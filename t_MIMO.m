clc
clear all
close all

s = tf('s');
G11 = 1/s;
G12 = s/(s+1);
G21 = 1/(s+3);
G22 = 1/((s^2)+(4*s)+4);

G = [G11 G12 ; G21 G22]  %% آرایه دو بعدی

