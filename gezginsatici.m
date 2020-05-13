clc,clear all,close all
gezici = xlsread('mesafeler.xlsx');
[cozum cozumeniyi objeniyi sayac objit]=saticisiman(gezici,1000,1,0.9)
plot(objit);