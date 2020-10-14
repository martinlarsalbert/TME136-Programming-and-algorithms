clear all
close all
clc

% Read data
filename = 'TELIA-2012-01-25-2019-07-02.csv';
stock = readStockData(filename);

% Simulate strategy
transaction = simulateStrategy(stock);

% Print and plot results
printAndPlotResult(stock, transaction);

