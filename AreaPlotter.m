% GMOT efficeinty plotter
% Author stuart smyth
% Last mod 20 FEB 19

%% Import power data from excel

load ('Gratingmeasurements.mat');
measurements = table2array(GratingmeasurementsS1);

%% define background light levels in uW
bi = 9.63; % incident
b0 = 19;   % 0th order
b1 = 11.2; % 1st order
bv = 36.7; % vertical polarization
b1plus = 36.92; % 1st order other polarization

%% Correct power data for background light
ii  = measurements(:,3)- bi;
i0 = measurements(:,4)- b0;
i1 = measurements(:,5)- b1;

I = [ii i0 i1]; 

%% position data
x = (measurements(:,1)-22.7)*-1;
y = (measurements(:,2)-6.9)*-1;

X = [ x(1)  x(3)  x(5) x(7) x(11) x(17) x(24) x(31)];
Y = y(22:27);

%% use function
global N
N = 4; % number of grating faces
[ eff ] = gmot4( I );% out is matrix eff that has all calculated values

eff1 = [ eff(1,:)  eff(3,:)  eff(5,:) eff(7,:) eff(11,:)...
         eff(17,:) eff(24,:) eff(31,:)];
     
eff2 = eff(22:27,:);
%% plotting

figure()
bar(X,eff1(1:3:end))
figure()
bar(X,eff1(2:3:end))
figure()
bar(X,eff1(3:3:end))

figure()
barh(Y,eff2(:,1))
figure()
barh(Y,eff2(:,2))
figure()
barh(Y,eff2(:,3))

