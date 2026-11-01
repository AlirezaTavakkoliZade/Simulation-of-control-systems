clc
clear all
close all

s = tf('s');

G = (5*(s-1)) / (((s+2)^2)*(s-3))