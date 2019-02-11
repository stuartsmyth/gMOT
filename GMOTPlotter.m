% GMOT efficeinty plotter
% Author stuart smyth
% Last mod 3 FEB 19

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
i0 = measurements(:,2)- b0;
i11 = measurements(:,3)- b1;
i12 = measurements(:,6)- b1;
i13 = measurements(:,9)- b1;
iv1 = measurements(:,4)- bv;
iv2 = measurements(:,7)- bv;
iv3 = measurements(:,10)- bv;
ih1 = measurements(:,5)- bh;
ih2 = measurements(:,8)- bh;
ih3 = measurements(:,11)- bh;
I = [ii i0 i11 i12 i13 iv1 iv2 iv3 ih1 ih2 ih3]; 

%% use function
global N
N = 3; % number of grating faces
[ eff ] = gmot( I ); % out is matrix eff that has all calculated values

%% plotting
x1 = [0.9 1 1.1]; % matrix of x values for plots
x2 = [1.9 2 2.1];
x3 = [2.9 3 3.1];


figure (1)
stem(eff(:,1))
axis([0 4 0 100])
ylabel('\eta_{0}(%)')
xlabel('grating')

figure (2)
stem(x1,eff(1,2:4))
hold on
stem(x2,eff(2,2:4))
stem(x3,eff(3,2:4))
ylim([0 100])
ylabel('\eta_{1}(%)')
xlabel('grating')
hold off

figure(3)
stem(eff(:,5))
axis([0 4 0 100])
ylabel('\eta_{b}(%)')
xlabel('grating')

figure (4)
stem(x1,eff(1,6:8))
hold on
stem(x2,eff(2,6:8))
stem(x3,eff(3,6:8))
ylabel('\epsilon_{p}(%)')
xlabel('grating')
hold off
