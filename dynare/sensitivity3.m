clear
close all 
cd '/Users/ettoreg/Documents/GitHub/Pereira_Serra-Gallo/dynare'

%% === PARAMETER GREEK NOTATION MAPPING ===
% Create a function to get Greek notation for parameters
function greek_label = get_greek_notation(param_name)
    param_map = containers.Map( ...
        {'taur', 'tauw', 'xi', 'phiiOM', 'psiOM', 'phinuL', 'varphia', 'phirpi', 'phiry', 'Yebar', 'phiphipiw', 'phiid', 'phiir', 'phiivarphi', 'phiiy'}, ...
        {'$\tau_r$', '$\tau_w$', '$\xi$', '$\varphi_{i,\Omega}$', '$\psi_{\Omega}$', '$\varphi_{\nu L}$', '$\varphi_{\alpha,G}$', '$\varphi_{r,\pi}$', '$\varphi_{r,y}$', '$\bar{Y}_e$', '$\varphi_{\phi\pi}$', '$\varphi_{i,d}$', '$\varphi_{i,r}$', '$\varphi_{i,\varphi}$', '$\varphi_{i,y}$'} ...
    );
    
    if isKey(param_map, param_name)
        greek_label = param_map(param_name);
    else
        greek_label = param_name; % fallback to original name
    end
end

%% === 1. Baseline parameter values ===
baseline_params = struct( ...
    'taur', 0.2, ...
    'tauw', 0.2, ...
    'xi', 0.129531, ...
    'phiiOM', -0.5, ...
    'psiOM', 0.5, ...
    'phinuL', 0.5, ...
    'varphia', 0.5, ...
    'phirpi', 1.5, ...
    'phiry', 0.125, ...
    'Yebar', 0.15 ...
);

%% === 2. Sensitivity grids (define only for params you want to test) ===
sensitivity_grids = struct( ...
    'taur', [0.0 0.2 0.4], ...
    'tauw', [0.7 1.0 1.3] * baseline_params.tauw, ...
    'xi', [0.7 1.0 1.3] * baseline_params.xi, ...
    'phiiOM', [0.7 1.0 1.3] * baseline_params.phiiOM, ...
    'psiOM', [0.7 1.0 1.3] * baseline_params.psiOM, ...
    'phinuL', [0.7 1.0 1.3] * baseline_params.phinuL, ...    
    'varphia', [0.7 1.0 1.3] * baseline_params.varphia, ...   
    'phirpi', [0.7 1.0 1.3] * baseline_params.phirpi, ...   
    'phiry', [0.7 1.0 1.3] * baseline_params.phiry, ...       
    'Yebar', [0.7 1.0 1.3] * baseline_params.Yebar ...
);

%% === 3. Variables and titles ===
variables = {
    'devlnYe'
    'devlnYn'
    'devlnCr'
    'devlnCw'
    'devlnIn'
    'devR'
    'devPip'
    'devlnL'
    'devwp'
    'devOmega'
};

titles = {
    '$\mathrm{dev}\,\ln(Y_{e,t})$'
    '$\mathrm{dev}\,\ln(Y_{n,t})$'
    '$\mathrm{dev}\,\ln(C_{r,t})$'
    '$\mathrm{dev}\,\ln(C_{w,t})$'
    '$\mathrm{dev}\,\ln(I_{n,t})$'
    '$\mathrm{dev}\,R_{t}$'
    '$\mathrm{dev}\,\Pi_{t}$'
    '$\mathrm{dev}\,\ln(L_{t})$'
    '$\mathrm{dev}\,\omega_{t}$'
    '$\mathrm{dev}\,\ln(\Omega_{t})$'
};

shocks = {'eom'};   % extend if needed

%% === 4. Run simulations ===
param_names = fieldnames(sensitivity_grids);
results = struct();
first_time = true;

for p = 1:length(param_names)
    pname = param_names{p};
    grid = sensitivity_grids.(pname);
    
    fprintf('\n>>> Running sensitivity for parameter: %s (%s)\n', pname, get_greek_notation(pname));
    results.(pname) = cell(length(grid),1);
    
    for i = 1:length(grid)
        % Reset to baseline
        params = baseline_params;
        % Change only current param
        params.(pname) = grid(i);
        
        if first_time
            dynare model_ECOLEC noclearall;  % your model
            first_time = false;
        else
            % Apply parameter values
            param_fields = fieldnames(params);
            for k = 1:length(param_fields)
                set_param_value(param_fields{k}, params.(param_fields{k}));
            end
            
            [info, oo_] = stoch_simul(M_, options_, oo_, var_list_);
            if info
                disp(['Computation fails for ' pname ' = ' num2str(grid(i))]);
                continue;
            end
        end
        
        results.(pname){i} = oo_.irfs;
    end
end

%% === 5. Post-processing helper ===
Ynbar = 1;
Yebar = 0.15;
compute_tratio = @(irf) ...
    (exp(irf.devOmega_eom/100)-1) ./ ...
    (exp(irf.devlnYe_eom/100)*Yebar + exp(irf.devlnYn_eom/100)*Ynbar);

%% === 6. Plotting with Greek notation ===
for p = 1:length(param_names)
    pname = param_names{p};
    pname_greek = get_greek_notation(pname);
    grid = sensitivity_grids.(pname);
    irf_cells = results.(pname);
    
    for s_idx = 1:length(shocks)
        current_shock = shocks{s_idx};
        
        fig = figure('Units','centimeters','Position',[1 1 21 29.7], ...
                     'PaperUnits','centimeters','PaperSize',[21 29.7], ...
                     'Name',['Shock: ' current_shock ', Param: ' pname_greek]);
        
        % Loop over variables
        for v_idx = 1:length(variables)
            subplot(4,3,v_idx);
            var_name = variables{v_idx};
            irf_field = [var_name '_' current_shock];
            
            hold on;
            for i = 1:length(grid)
                if ~isempty(irf_cells{i}) && isfield(irf_cells{i}, irf_field)
                    plot(irf_cells{i}.(irf_field), 'LineWidth', 1.5);
                end
            end
            yline(0, 'k--', 'LineWidth', 1.2);
            title(titles{v_idx}, 'FontSize', 10, 'Interpreter','latex');
            set(gca, 'FontSize', 8, 'Box', 'off');
            xlim([1 50]);
        end
        
        % Plot tratio in last subplot
        subplot(4,3,length(variables)+1);
        hold on;
        for i = 1:length(grid)
            if ~isempty(irf_cells{i})
                tratio_i = compute_tratio(irf_cells{i});
                plot(tratio_i, 'LineWidth', 1.5);
            end
        end
        yline(0, 'k--', 'LineWidth', 1.2);
        title('Carbon intensity ($\dot{\Omega}/Y$)', 'FontSize', 10, 'Interpreter','latex');
        set(gca, 'FontSize', 8, 'Box', 'off');
        xlim([1 50]);
        
        % Legend with Greek notation = parameter values
        legend_labels = cell(length(grid), 1);
        for i = 1:length(grid)
            legend_labels{i} = sprintf('%s = %.3f', pname_greek, grid(i));
        end
        legend_handle = legend(legend_labels, 'Orientation', 'vertical', 'FontSize', 10, 'Interpreter','latex');
        legend_position = get(legend_handle, 'Position');
        legend_position(1) = 0.75; legend_position(2) = 0.15;
        set(legend_handle, 'Position', legend_position);
        
        % Save figure with Greek notation in filename (replace special chars)
        safe_pname = strrep(strrep(strrep(pname_greek, '$', ''), '\', ''), '{', '');
        safe_pname = strrep(strrep(safe_pname, '}', ''), ',', '_');
        print(fig, ['IRFs_' current_shock '_' safe_pname], '-dpdf', '-r300');
    end
end

%% === 7. Global Sensitivity: Sobol Indices (Variance-based) with Greek notation ===
% Extended to additional parameters: phiphipiw, phiid, phiir, phiivarphi, phiiy
 
% 1. Add extra parameters to baseline and sensitivity grids if not present
extra_params = {'phiphipiw','phiid','phiir','phiivarphi','phiiy'};
extra_defaults = [0.1, 0.01, 0.2, 0.2, 0.2];
for idx = 1:numel(extra_params)
    pname = extra_params{idx};
    if ~isfield(baseline_params, pname)
        baseline_params.(pname) = extra_defaults(idx);
        sensitivity_grids.(pname) = [0.7 1.0 1.3] * extra_defaults(idx);
    end
end

% 2. Define Sobol parameter set (all param_names plus new ones)
sobol_params = [param_names; extra_params'];
lb = zeros(length(sobol_params),1);
ub = zeros(length(sobol_params),1);
for i = 1:length(sobol_params)
    grid = sensitivity_grids.(sobol_params{i});
    lb(i) = min(grid);
    ub(i) = max(grid);
end

% 3. Generate Sobol sample matrix
N = 1000; % number of sample points
sobol_samples = lhsdesign(N, length(sobol_params));
for i = 1:length(sobol_params)
    sobol_samples(:,i) = lb(i) + sobol_samples(:,i).*(ub(i)-lb(i));
end

% 4. Run model for each sample, collect output for several variables
metric_names = {'devlnYe_eom'}; %,'devlnYn_eom','devlnCr_eom','devlnCw_eom','devlnIn_eom'};
output_metrics = nan(N, numel(metric_names));
for n = 1:N
    params = baseline_params;
    for i = 1:length(sobol_params)
        params.(sobol_params{i}) = sobol_samples(n,i);
    end
    param_fields = fieldnames(params);
    for k = 1:length(param_fields)
        set_param_value(param_fields{k}, params.(param_fields{k}));
    end
    [info, oo_] = stoch_simul(M_, options_, oo_, var_list_);
    if info
        continue;
    end
    irf = oo_.irfs;
    for m = 1:numel(metric_names)
        if isfield(irf, metric_names{m})
            output_metrics(n,m) = max(abs(irf.(metric_names{m})));
        end
    end
end

% 5. Compute Sobol indices (correlation proxy) for all metrics
Si_all = nan(length(sobol_params), numel(metric_names));
for m = 1:numel(metric_names)
    for i = 1:length(sobol_params)
        Si_all(i,m) = abs(corr(sobol_samples(:,i), output_metrics(:,m), 'rows','complete'));
    end
end

% 6. Plot sensitivity bar charts for each output metric with Greek notation
for m = 1:numel(metric_names)
    figure('Name', ['Global Sensitivity: ' metric_names{m}]);
    bar(Si_all(:,m), 'FaceColor', [0.2 0.6 0.8]);
    
    % Create Greek labels for x-axis
    greek_labels = cell(length(sobol_params), 1);
    for i = 1:length(sobol_params)
        greek_labels{i} = get_greek_notation(sobol_params{i});
    end
    
    set(gca, 'XTickLabel', greek_labels, 'XTickLabelRotation', 45, 'FontSize', 12);
    set(gca, 'TickLabelInterpreter', 'latex');
    ylabel('Sensitivity Index (|Corr|)');
    title(['Global Sensitivity of $\max|\mathrm{' strrep(metric_names{m},'_','\,') '}|$'], 'Interpreter','latex');
    grid on;
    print(gcf, ['GlobalSensitivity_' metric_names{m}], '-dpdf', '-r300');
end

%% === 8. Heatmap: Parameter Interaction Effects (Extended) with Greek notation ===
% Example: show how devlnYe peak responds to pairs of parameters

% Select a subset of parameters for interaction analysis (to keep heatmap readable)
interaction_params = {'taur', 'tauw', 'xi', 'phirpi', 'phiry'};
n_interact = length(interaction_params);

% Create parameter combination grids
param_grid_size = 10; % resolution for each parameter
interaction_results = nan(param_grid_size, param_grid_size, n_interact, n_interact);

for i = 1:n_interact
    for j = 1:n_interact
        if i >= j, continue; end % Only compute upper triangle
        
        param1 = interaction_params{i};
        param2 = interaction_params{j};
        
        fprintf('Computing interaction: %s vs %s\n', get_greek_notation(param1), get_greek_notation(param2));
        
        % Get parameter ranges
        range1 = sensitivity_grids.(param1);
        range2 = sensitivity_grids.(param2);
        
        grid1 = linspace(min(range1), max(range1), param_grid_size);
        grid2 = linspace(min(range2), max(range2), param_grid_size);
        
        for g1 = 1:param_grid_size
            for g2 = 1:param_grid_size
                params = baseline_params;
                params.(param1) = grid1(g1);
                params.(param2) = grid2(g2);
                
                % Apply parameters
                param_fields = fieldnames(params);
                for k = 1:length(param_fields)
                    set_param_value(param_fields{k}, params.(param_fields{k}));
                end
                
                [info, oo_] = stoch_simul(M_, options_, oo_, var_list_);
                if ~info && isfield(oo_.irfs, 'devlnYe_eom')
                    interaction_results(g1, g2, i, j) = max(abs(oo_.irfs.devlnYe_eom));
                end
            end
        end
        
        % Plot heatmap
        figure('Name', ['Parameter Interaction: ' get_greek_notation(param1) ' vs ' get_greek_notation(param2)]);
        imagesc(grid2, grid1, interaction_results(:, :, i, j));
        colorbar;
        xlabel([get_greek_notation(param2)], 'Interpreter', 'latex', 'FontSize', 12);
        ylabel([get_greek_notation(param1)], 'Interpreter', 'latex', 'FontSize', 12);
        title(['IRF Peak Sensitivity: ' get_greek_notation(param1) ' vs ' get_greek_notation(param2)], 'Interpreter', 'latex');
        set(gca, 'YDir', 'normal');
        
        % Save heatmap
        safe_param1 = strrep(strrep(strrep(get_greek_notation(param1), '$', ''), '\', ''), '{', '');
        safe_param1 = strrep(strrep(safe_param1, '}', ''), ',', '_');
        safe_param2 = strrep(strrep(strrep(get_greek_notation(param2), '$', ''), '\', ''), '{', '');
        safe_param2 = strrep(strrep(safe_param2, '}', ''), ',', '_');
        print(gcf, ['Heatmap_' safe_param1 '_vs_' safe_param2], '-dpdf', '-r300');
    end
end

fprintf('\n=== Analysis Complete ===\n');
fprintf('All plots now use Greek notation as specified in the parameter table.\n');
fprintf('Files saved with appropriate Greek notation in legends and axis labels.\n');