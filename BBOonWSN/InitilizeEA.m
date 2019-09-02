
function [PopulationSize,MaxGen,Pc,Pm] = InitilizeEA()
% disp('InitilizeEA');
%Population size
PopulationSize = 5;

%Maximum number of generations
MaxGen = 1;

%Crossover Probability
%Pc = 0.6;
Pc =1;

%Mutation Probability
Pm = 0.01;
%Pm = 0.006;

