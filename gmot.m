function [ eff ] = gmot( I )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
global N
n0 = (I(:,2)./I(:,1).*100); %0th order efficeincy
n11 = (I(:,3)./I(:,1).*100); %1st order efficiency face 1
n12 = (I(:,4)./I(:,1).*100); %1st order efficiency face 2
n13 = (I(:,5)./I(:,1).*100); %1st order efficiency face 3
n1avg = (n11+n12+n13)./3;%average n1
%nb =  (N.*n1avg)./(100-n0);  % radition balance non percentage
nb =  (1./((N.*n1avg)./(100-n0)).*100);  % radition balance
ep1 = (I(:,9)./I(:,1).*100); % polarisaition efficiency face 1
ep2 = (I(:,10)./I(:,1).*100); % polarisaition efficiency face 2
ep3 = (I(:,11)./I(:,1).*100); % polarisaition efficiency face 3
eff = [n0(2:end) n11(2:end) n12(2:end) n13(2:end) nb(2:end) ep1(2:end) ep2(2:end) ep3(2:end)];
end
