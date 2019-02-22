% GMOT efficeinty plotter
% Author stuart smyth
% Last mod 20 FEB 19

%% Import power data from excel
load ('Gratingmeasurements.mat');
measurements = table2array(Gratingmeasurements);

%% define background light levels in uW
bi = 9.63; % incident
b0 = 19;   % 0th order
b1 = 11.2; % 1st order
bv = 36.7; % vertical polarization
bh = 16.6; % horizontal polarization

%% Correct power data for background light
ii = measurements(:,1)- bi;
i10 = measurements(:,2)- b0;
i20 = measurements(:,5)- b0;
i30 = measurements(:,8)- b0;
i11 = measurements(:,3)- b1;
i12 = measurements(:,6)- b1;
i13 = measurements(:,9)- b1;
ip1 = measurements(:,4)- bv;
ip2 = measurements(:,7)- bv;
ip3 = measurements(:,10)- bv;

I = [ii i10 i20 i30 i11 i12 i13 ip1 ip2 ip3]; 

%% use function
global N
N = 3; % number of grating faces
[ eff ] = gmot( I );% out is matrix eff that has all calculated values

%% plotting
x1 = [0.9 1 1.1]; % matrix of x values for plots
x2 = [1.9 2 2.1];
x3 = [2.9 3 3.1];


figure (1)
bar(x1,eff(1,1:3))
hold on 
bar(x2,eff(2,1:3))
bar(x3,eff(3,1:3))
ylabel('\eta_{0}')
xlabel('grating')

figure (2)
bar(x1,eff(1,4:6))
hold on 
bar(x2,eff(2,4:6))
bar(x3,eff(3,4:6))
ylabel('\eta_{1}')
xlabel('grating')

figure(3)
bar(x1,eff(1,7:9))
hold on 
bar(x2,eff(2,7:9))
bar(x3,eff(3,7:9))
ylabel('\eta_{b}')
xlabel('grating')

figure (4)
bar(x1,eff(1,10:12))
hold on 
bar(x2,eff(2,10:12))
bar(x3,eff(3,10:12))
ylabel('\epsilon_{p}')
xlabel('grating')

