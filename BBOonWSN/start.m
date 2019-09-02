function [bestfit, averagefit,CHNum,STATISTICS]=start()

disp('Sensor Network Simulation starts.....');

[XMax, YMax, NumberOfNodes,OptimalElectionProbability,RoundMax] = InitializeWSN();

[Eo, ETX, ERX, Efs, Emp, EDA, do] = InitializeEnergyModel();

[Sensor,Sink] = SensorsDeployment();
[PopulationSize,MaxGen,Pc,Pm] = InitilizeEA();


%First Iteration

STATISTICS = [];
C = [];
X = [];
Y = [];

first_dead = -1;
Last_dead = -1;
flag_first_dead = 0;

StatisticCounter = 1;
RoundCounter = 0;
NetworkAlive = true;

bestfit = zeros(1,MaxGen);
averagefit = zeros(1,MaxGen);
CHNum = zeros(1,MaxGen);



while((RoundCounter <= RoundMax && NetworkAlive))
    
    RoundCounter
    
    figure(1);
    hold off;
    
    [STATISTICS, Sensor] = GetStatisticsOfWSN(Sensor, Sink, NumberOfNodes, ...
                                              STATISTICS,StatisticCounter, ...
                                              RoundCounter);
    
    %When the first node dies
    if (STATISTICS(StatisticCounter).DeadNodes >= 1)
        if(flag_first_dead == 0)
            first_dead = StatisticCounter; %  first_dead: the round where the first node died                   
            flag_first_dead = 1;
        end;
    end;
    
    
    if(STATISTICS(StatisticCounter).DeadNodes > 0)
            if(STATISTICS(StatisticCounter).DeadNodes == NumberOfNodes)
                  Last_dead = StatisticCounter; %  Last_dead: the round where the Last node died                   
                  NetworkAlive = false; %If all Nodes Died
            end;
    end;
        
    IsCluster = 0;  
    
    %Cluster-Head Election Phase
    [Sensor, STATISTICS,IsCluster,C, X, Y,bestfit,averagefit,CHNum] = ClusterHeadElection(PopulationSize,MaxGen,Pc,Pm,Sensor, Sink, ...
                                                        STATISTICS,StatisticCounter,IsCluster, ...
                                                        C, X, Y,...
                                                        NumberOfNodes, ...
                                                        OptimalElectionProbability, ...
                                                        ETX, ERX, Efs, Emp, EDA, do,RoundCounter,bestfit,averagefit,CHNum);
                                                    
    
    %Election of Associated Cluster Head for Normal Nodes %i.e. Connection
    %Establishment and Data Transmission phases (steady state phase)
     if(IsCluster == 1)
        [Sensor, STATISTICS] = ClusterHeadAssociation(Sensor, Sink, ...
                                                  STATISTICS, ...
                                                  StatisticCounter, ...
                                                  NumberOfNodes, ...
                                                  ETX, ERX, Efs, Emp, EDA, do, ...
                                                  C);
         for SensorCounter = 1:NumberOfNodes
             %Caliculation of Total Remaining Energy
             STATISTICS(StatisticCounter).RemainingEnergy = STATISTICS(StatisticCounter).RemainingEnergy + Sensor(SensorCounter).Energy;
         end;
    
    end;
    STATISTICS(StatisticCounter).RemainingEnergy
    hold on;
%     DrawVoronoiCell(X,Y, XMax, YMax);
    
    if(IsCluster == 1) 
        StatisticCounter = StatisticCounter+1;
    end 
    RoundCounter = RoundCounter + 1; 
end;
%save('m=0.2\STATISTIC_WSN15.mat','STATISTICS');
%save('m=0.2\FirsetDead_LastDead_WSN15.mat','first_dead','Last_dead');
%save('m=0.2','STATISTICS');
%save('m=0.2,'first_dead','Last_dead');

first_dead
len=length(STATISTICS);
len
Last_dead

