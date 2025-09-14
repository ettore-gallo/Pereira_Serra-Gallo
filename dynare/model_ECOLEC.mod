
% VARIABLES
var 
Yn, Ye, Cw, Cr, L, Ie, In, Mr, B, Ze, Zn, rm, Pip, wp, rd, 
Kn, Ke, e, G, varphi, Piw, nu, De, Dn, D, om_diff, alpha, Vin, Vr, Vom, Vnu, Vtw, Vtr, un,
devlnYe, devlnYn, devlnCr,  devlnCw,  
devlnIe, devlnIn, devR, devPip, devwp, devlnL, devOmega, devlnG;

% EXOGENOUS DISTURBANCES
varexo ein, er, etw, etr, enu, eom;

% MODEL PARAMETERS
parameters 
Gama, epsilon, delta, Pipbar, Knbar, teta, 
Ynbar, Yebar, Ybar, Lbar, Crbar, Cwbar, rmbar, Piwbar, nubar, 
varphibar, rdbar, phiphipiw, phiid, phiir, phiivarphi, phiiy, 
phirpi, phiry, phinuL, wpd, xi, sp, wpbar, tauw, taur,
ue, nue, nuK, nuL, psiOM, phiiOM, alphanmax, Dbar, rhoin, rhor, rhotw, rhotr, rhonu, rhoom, om_diff_bar,
Iebar, Inbar, Debar, Dnbar, Kebar, Mrbar, Gbar, Zebar, Znbar, Bbar, unbar, nune, varphia;

% CALIBRATED 
Gama = 1.006337502;
delta = 0.014;
Pipbar = 1.0056; 
teta = 1.14;
ue = 0.8;
Ynbar = 1;
Yebar = 0.15;
Iebar = 0.05;
Inbar = 0.2;
Ybar = Yebar + Ynbar;
rmbar = 0.006485;
Piwbar = Pipbar;
nubar = 0.5271181516;
rdbar = (1+teta)*rmbar;
phiphipiw = 0.1;
phiid = 0.01;
phiir = 0.2;
phiivarphi = 0.2;
phiiy = 0.2;
phirpi = 1.5;
phiry = 0.125;
phinuL = 0.5;

xi = 0.129531;
wpd = 1.89;

tauw = 0.2;
taur = 0.0;
phiiOM = -0.5;
psiOM = 0.5;
alphanmax = 0.9;
rhoin = 0.5;                                               
rhor = 0.5;                                               
rhotw = 0.5;                                               
rhotr = 0.5;                                               
rhonu = 0.5;                                               
rhoom = 0.5;                                               
om_diff_bar = 0;
unbar = 0.8;

varphia = 0.5; 

%%%%%%%%%%%%%%%%%%%%%%
%% MODEL
%%%%%%%%%%%%%%%%%%%%%%
model;
% Worker households
Cw = (1 - tauw * Vtw) * wp * L;

% Rentier households
Cr = (1-sp)*(1-taur*Vtr)*(Zn + Ze + B + Mr(-1) * rm(-1)/ (Pip*Gama));
Mr - Mr(-1)/(Pip*Gama) = sp*(1-taur*Vtr)*(Yn - wp*L - (1-xi)*(In + Ie));

% Energy sector 
Ye = Yn / nune * Vin;
Ie = In*Kebar/Knbar;
Ke = (1-delta)*1/Gama*Ke(-1) + Ie;
De - De(-1)/(Pip*Gama) = xi*Ie;
Ze = Ye - (1-xi)*Ie - rd(-1)/(Pip*Gama)*De(-1);

% Non-energy sector 
Yn = Cr + In + Ie + wp * L + taur * Vtr * (B + Zn + Ze + rm(-1)*Mr(-1)/(Pip*Gama));
e = nuL/nue;
un = Yn / (nuK*Kn(-1));
L = Yn / nuL;
varphi = wp/nuL;
1 = (1+epsilon)*(Pip/Piwbar)^(-phiphipiw)*varphi;
In/Knbar = (1-(1-delta)/Gama)*((Yn(-1)/Ynbar)^phiiy)*(Dn(-1)/Dnbar)^-phiid*((rd/rdbar)^(-phiir))*((varphi/varphibar)^(-phiivarphi))*((1+om_diff(-1))/(1+om_diff_bar))^(phiiOM)*Vin;
Kn = (1-delta)*1/Gama*Kn(-1) + In;
Dn - Dn(-1)/(Pip*Gama) = xi*In;
D = De + Dn;
Zn = Yn - wp*L - Ye - (1-xi)*In - rd(-1)/(Pip*Gama)*Dn(-1);

% Commercial banks
B = ((rd(-1))*Dn(-1))/(Pip * Gama) - ((rm(-1))*(Mr(-1)))/(Pip*Gama) + rd(-1)*De(-1)/(Pip*Gama);
rd = (1+teta)*rm;

% Central bank
rm/rmbar = (Pip/Pipbar)^phirpi*(Yn/Ynbar)^phiry*Vr;

% Government
G = tauw * Vtw * wp * L + taur*Vtr * (B + Zn + Ze + rm(-1)*Mr(-1)/(Pip*Gama));

% Labor market
Piw = nu*(wpd - wp(-1)) + 1;
nu/nubar = (L/Lbar)^phinuL * Vnu;

% Misc
wp/wp(-1) - 1 = Piw - Pip;

% Definition of alpha
alpha = alpha(-1)*(1 + varphia *G*(alphanmax - alpha(-1)))* Vom;

% Definition of om_diff
om_diff = (alphanmax - alpha)*(((1 + nune) / nune) * Yn)^psiOM ;

% Shock processes
Vin = Vin(-1)^rhoin*exp(ein);
Vr = Vr(-1)^rhor*exp(er);   
Vtw = Vtw(-1)^rhotw*exp(etw);   
Vtr = Vtr(-1)^rhotr*exp(etr);   
Vnu = Vnu(-1)^rhonu*exp(enu);   
Vom = Vom(-1)^rhoom*exp(-eom);   

% MEASUREMENT EQUATIONS  
devlnYe = log(Ye/Yebar)*100;                                            
devlnYn = log(Yn/Ynbar)*100;                                            
devlnCr = log((Cr)/(Crbar))*100;                             
devlnCw = log((Cw)/(Cwbar))*100;                             
devlnG = log((G)/(Gbar))*100;                             
devlnIe = log(Ie/Iebar)*100;                                            
devlnIn = log(In/Inbar)*100;                                            
devR= (rm-rmbar)*100;                                                
devwp= (wp-wpbar)*100;                                                
devPip = (Pip-Pipbar)*100;                                           
devlnL = log(L/Lbar)*100;  
devOmega = log(1+om_diff)*100;
end;

initval;
alpha = 0.3;
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% STEADY STATE MODEL
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
steady_state_model;
% Step 1: Set Pip and calculate Piw
Pip = Pipbar;
Piw = Pip;
nu = nubar; 

% Step 2: Calculate derived parameters that depend on basic parameters
% Calculate nuK and nue first
nuK = (Ynbar/(unbar*Inbar))*(1-(1-delta)/Gama);
nue = (Yebar/(ue*Iebar))*(1-(1-delta)/Gama);
nune = Ynbar / Yebar; 

% Step 3: Calculate wp (omega)
wp = (nu*wpd- Piw+1)/nu;

% Step 4: Calculate L and nuL
Yn = Ynbar;
L = 0.64350984/wp;
nuL = 1/L;

% Step 5: Calculate Ye
Ye = Yn / nune;

% Step 6: Calculate varphi and epsilon
varphi = wp / nuL;
epsilon = 1 / varphi - 1;

% Step 7: Calculate rd
rm = rmbar;
rd = (1 + teta) * rm;

% Step 8: Calculate steady state values that depend on taur and other variables
% These were moved from the parameter section
Knbar = Ynbar/(nuK*unbar);
Kebar = Yebar/(ue*nue);
wpbar = wp;  % This should equal the calculated wp in steady state
Lbar = L;    % This should equal the calculated L in steady state
varphibar = varphi;  % This should equal the calculated varphi in steady state
Debar = xi*Iebar/(1-1/(Pipbar*Gama));
Dnbar = xi*Inbar/(1-1/(Pipbar*Gama));
Dbar = Debar + Dnbar;

% Calculate sp (depends on taur)
sp = xi * (Inbar + Iebar) / ((1 - taur) * (Ynbar - wpbar * Lbar - (1 - xi) * (Inbar + Iebar)));

% Calculate other steady state bars that depend on sp and taur
Cwbar = (1-tauw)*wpbar*Lbar;
Crbar = (1-sp)*(1-taur)*(Ynbar - wpbar*Lbar - (1-xi)*(Inbar + Iebar));
Mrbar = sp*(1-taur)*(Ynbar - wpbar*Lbar - (1-xi)*(Inbar + Iebar))/(1-1/(Pipbar*Gama));
Gbar = tauw*wpbar*Lbar + taur*(Ynbar - wpbar*Lbar - (1-xi)*(Inbar + Iebar));
Zebar = Yebar - (1-xi)*Iebar - rdbar*Debar/(Pipbar*Gama);
Znbar = Ynbar - wpbar*Lbar - Yebar - (1-xi)*Inbar - rdbar*Dnbar/(Pipbar*Gama);
Bbar = rdbar*Dnbar/(Pipbar*Gama) + rdbar*Debar/(Pipbar*Gama) - rmbar*Mrbar/(Pipbar*Gama);

% Step 9: Calculate steady state values for model variables
In = Inbar;
Ie = Iebar;
un = unbar;

% Step 10: Calculate Ke and Kn
Ke = Ye / (ue * nue);
Kn = Yn / (nuK * un);

% Step 11: Calculate De and Dn
De = (xi * Ie) / (1 - 1 / (Pip * Gama));
Dn = (xi * In) / (1 - 1 / (Pip * Gama));
D = De + Dn;

% Step 12: Calculate Cw
Cw = (1 - tauw) * wp * L;

% Step 13: Calculate G
G = tauw * wp * L + taur * (Yn - wp * L - (1 - xi) * (In + Ie));

% Step 14: Calculate Cr
Cr = (1 - sp) * (1 - taur) * (Yn - wp * L - (1 - xi) * (In + Ie));

% Step 15: Calculate Mr
Mr = sp * (1 - taur) * (Yn - wp * L - (1 - xi) * (In + Ie)) / (1 - 1 / (Pip * Gama));

% Step 16: Calculate Ze
Ze = Ye - (1 - xi) * Ie - (rd / (Pip * Gama)) * De;

% Step 17: Calculate Zn
Zn = Yn - wp * L - Ye - (1 - xi) * In - (rd / (Pip * Gama)) * Dn;

% Step 18: Calculate B
B = (rd / (Pip * Gama)) * Dn + (rd / (Pip * Gama)) * De - (rm / (Pip * Gama)) * Mr;

% Other steady state variables
e = nuL / nue;
alpha = alphanmax;

% Calculate om and om_diff
om_diff = om_diff_bar;

% Shock processes in steady state
Vin = 1;
Vr = 1;
Vom = 1;
Vnu = 1;
Vtw = 1;
Vtr = 1;

% Measurement equations in steady state
devlnYe=0; 
devlnYn=0; 
devlnCw=0; 
devlnCr=0; 
devlnIe=0; 
devlnIn=0; 
devR=0;
devPip=0;
devlnL = 0 ; 
devwp = 0;
devOmega = 0;
devlnG = 0;
end;

steady(solve_algo=2,maxit=2000);
check; 
options_.debug = true;
model_diagnostics;

shocks;
var ein; stderr 0.01;
var er; stderr 0.01;
var etw; stderr 0.01;
var etr; stderr 0.01;
var enu; stderr 0.01;
var eom; stderr 0.01;
end;

stoch_simul(order=1,irf=50,nograph) devlnYe devlnYn devlnCr devlnCw devlnIe devlnIn devR devPip devlnL devwp devOmega devlnG;

write_latex_dynamic_model;
write_latex_parameter_table;
write_latex_definitions;
