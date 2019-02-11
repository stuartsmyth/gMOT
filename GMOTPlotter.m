% GMOT efficeinty plotter
% Author stuart smyth
% Last mod 3 FEB 19

%% Import power data from excel
load ('Gratingmeasurements.mat');
measurements = table2array(Gratingmeasurements);
%%grating1 = measurements(2,:);

%% define background light levels in uW
bi = 9.63; % incident
b0 = 19;   % 0th order
b1 = 11.2; % 1st order
bv = 36.7; % vertical polarization
bh = 16.6; % horizontal polarization

%% Correct power data for background light
ii = measurements(:,1)- bi;
i0 = measurements(:,2)- b0;
i1 = measurements(:,3)- b1;
iv = measurements(:,4)- bv;
ih = measurements(:,5)- bh;
I = [ii i0 i1 iv ih]; % power data accounting for BG light

%% use function
[ eff ] = gmot( I )



