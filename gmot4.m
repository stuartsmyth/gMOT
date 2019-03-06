function [ eff ] = gmot4( I )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
global N
n0 = I(:,2)./I(:,1); %0th order efficeincy face 1

n1 = I(:,3)./I(:,1); %1st order efficiency face 1

nb =  (N.*n1)./(1-n0);  % radition balance face 1

eff = [n0 n1 nb];
end