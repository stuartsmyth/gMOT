function [ eff ] = gmot( I )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
global N
n10 = I(:,2)./I(:,1); %0th order efficeincy face 1
n20 = I(:,3)./I(:,1); %0th order efficeincy face 2
n30 = I(:,4)./I(:,1); %0th order efficeincy face 3
n11 = I(:,5)./I(:,1); %1st order efficiency face 1
n12 = I(:,6)./I(:,1); %1st order efficiency face 2
n13 = I(:,7)./I(:,1); %1st order efficiency face 3

nb1 =  (N.*n11)./(1-n10);  % radition balance face 1
nb2 =  (N.*n12)./(1-n20);  % radition balance face 1
nb3 =  (N.*n13)./(1-n30);  % radition balance face 1

ep1 = I(:,8)./I(:,5); % polarisaition efficiency face 1
ep2 = I(:,9)./I(:,6); % polarisaition efficiency face 2
ep3 = I(:,10)./I(:,7); % polarisaition efficiency face 3

eff = [n10(2:end) n20(2:end) n30(2:end) n11(2:end) n12(2:end) n13(2:end) nb1(2:end) nb2(2:end) nb3(2:end) ep1(2:end) ep2(2:end) ep3(2:end)];
end
