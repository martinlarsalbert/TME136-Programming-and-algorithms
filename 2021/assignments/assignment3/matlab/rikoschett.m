clear all
close all
clc

% Read data
% filename = 'ERIC_B-2015-10-01-2021-09-29.csv';
% filename = 'HM_B-2015-10-01-2021-09-29.csv';
% filename = 'VOLV_B-2015-10-01-2021-09-29.csv';
% filename = 'TELIA-2015-10-01-2021-09-29.csv';
% filename = 'TELIA-2012-01-25-2019-07-02.csv';
% filename = 'ABB-2015-10-01-2019-10-01.csv';
filename = 'ABB-2015-10-01-2021-09-29.csv';
stock = readStockData(filename);

% Simulate strategy
[transaction, money] = simulateStrategy(stock);

% Print and plot results
printAndPlotResult(stock, transaction, money);

