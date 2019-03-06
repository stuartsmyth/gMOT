% GMOT efficeinty plotter
% Author stuart smyth
% Last mod 20 FEB 19

%% Import power data from excel

load ('Gratingmeasurements.mat');
measurements = table2array(GratingmeasurementsS2);

%% define background light levels in uW
bi = 9.63; % incident
b0 = 19;   % 0th order
b1 = 11.2; % 1st order
bv = 36.7; % vertical polarization
b1plus = 36.92; % 1st order other polarization

%% Correct power data for background light
ii  = measurements(:,3)- bi;
i1minus = measurements(:,4)- b1;
i1plus = measurements(:,5)- b1plus;
ip = measurements(:,6)- bv;

I = [ii i1minus i1plus ip]; 

%% position data
X = (measurements(:,1)-22.7)*-1;

x1 = X-0.1;
x2 = X+0.1;


%% use function

n1minus = I(:,2)./I(:,1); %1st order efficiency - 

n1plus = I(:,3)./I(:,1); %1st order efficiency +

ep = I(:,4)./I(:,2); % polarisaition efficiency face 1

eff = [ n1minus n1plus ep];
%% plotting

figure()
bar(x1,eff(:,1),0.2)
hold on
bar(x2,eff(:,2),0.2)
xlim([-0.5 7.5]);
ylabel('\eta_{1}')
xlabel('position(mm)')

figure()
bar(X,eff(:,3))
ylabel('\epsilon_{p}')
xlabel('position(mm)')