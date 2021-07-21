% histrnd.m
% This program generates random numbers between 0
% and 100, and then plot them in a histogram.
clc; % Clear out the command window
close all; % Close any figure windows
clear; % Clear all variables from memory
bins = 100; % No of bins in the histogram
% Ask user to input no of random numbers wanted
n = input(`Number of random number = ');
% Generate n random numbers between 0 and 100
% and then plot them in a histogram
list = 100*rand(1,n);
histogram(list,bins)

