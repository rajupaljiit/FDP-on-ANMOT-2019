%lifetime
r=xlsread('Results m=0.2.xlsx','Sheet1','A1:A4338');
r=r';
sep=xlsread('Results m=0.2.xlsx','Sheet1','B3:B4338');
sep=sep';
IHCR=xlsread('Results m=0.2.xlsx','Sheet1','C3:C4338');
IHCR=IHCR';
ERP=xlsread('Results m=0.2.xlsx','Sheet1','D3:D4338');
ERP=ERP';
KGACVI=xlsread('Results m=0.2.xlsx','Sheet1','E3:E4338');
KGACVI=KGACVI';
figure(1);
plot(r,sep,'-r',r,IHCR,'-b',r,ERP,'-m',r,KGACVI,'-k', 'Linewidth',2.5);
legend({'SEP','IHCR','ERP','KBBO'},'FontSize',15');
xlabel('Number of Rounds','FontSize',15);    
ylabel('Number of Alive nodes','FontSize',15);
ax=gca;
set(gca,'FontSize',15);
set(gca,'YScale','linear');
% set(gca,'XScale','log');

% Total residual energy 
r=xlsread('Results m=0.2.xlsx','Sheet2','A1:A4338');
r=r';
sep=xlsread('Results m=0.2.xlsx','Sheet2','B3:B4338');
sep=sep';
IHCR=xlsread('Results m=0.2.xlsx','Sheet2','C3:C4338');
IHCR=IHCR';
ERP=xlsread('Results m=0.2.xlsx','Sheet2','D3:D4338');
ERP=ERP';
KGACVI=xlsread('Results m=0.2.xlsx','Sheet2','E3:E4338');
KGACVI=KGACVI';
figure(2);
plot(r,sep,'-r',r,IHCR,'-b',r,ERP,'-m',r,KGACVI,'-k', 'Linewidth',2.5);
% % plot(r,re_sep,'-r',r,re_hcr,'-b',r,re_erp,'-m',r,re_GACVI,'-k', 'Linewidth',2.5);
legend({'SEP','IHCR','ERP','KBBO'},'FontSize',15');
xlabel('Number of Rounds','FontSize',15);    
ylabel('Total Residual Energy (in Joules)','FontSize',15);
ax=gca;
set(gca,'FontSize',15);
set(gca,'YScale','linear');

% % %%Number of packet sent to BS

r=xlsread('Results m=0.2.xlsx','Sheet3','A1:A4338');
r=r';
sep=xlsread('Results m=0.2.xlsx','Sheet3','B3:B4338');
sep=sep';
IHCR=xlsread('Results m=0.2.xlsx','Sheet3','C3:C4338');
IHCR=IHCR';
ERP=xlsread('Results m=0.2.xlsx','Sheet3','D3:D4338');
ERP=ERP';
KGACVI=xlsread('Results m=0.2.xlsx','Sheet3','E3:E4338');
KGACVI=KGACVI';
figure(3);
plot(r,sep,'-r',r,IHCR,'-b',r,ERP,'-m',r,KGACVI,'-k', 'Linewidth',2.5);% % 
% figure(3);
% plot(r,p_sep,'-r',r,p_hcr,'-b',r,p_erp,'-m',r,p_GACVI,'-k', 'Linewidth',2);
legend({'SEP','IHCR','ERP','KBBO'},'FontSize',15');
xlabel('Number of Rounds','FontSize',15);    
ylabel('Number of Packets to BS','FontSize',15);
ax=gca;
set(gca,'FontSize',15);
set(gca,'YScale','linear');

% %% cluster heads
% figure(4);
% a2=xlsread('GA+CVI+Kmeans','Sheet4');
% bh=boxplot(a2);
% xlabel('Protocols'); % x-axis label
% ylabel('Number of advanced CHs'); % y-axis label
% ax=gca;
% ax.XTickLabel = {'SEP','ERP','IHCR','GACVI'};
% % ax.TickLength = [0.01 0.035];
% % box off;
% ax.LineWidth = 4;
%  ax.TickDir = 'both';
%  set(bh(:,:),'linewidth',2.6);
%  set(gca,'FontSize',15);
% 
% %% Throughput
% 
% figure(5);
% 
% a2=xlsread('Results','Sheet2');
% bh=boxplot(a2);
% xlabel('Protocols'); % x-axis label
% ylabel('Number of advanced CHs'); % y-axis label
% ax=gca;
% ax.XTickLabel = {'SEP','IHCR','ERP','BEECP'};
% ax.TickLength = [0.01 0.035];
% box off;
% ax.LineWidth = 4;
%  ax.TickDir = 'both';
%  set(bh(:,:),'linewidth',2.6);
%  set(gca,'FontSize',15);
% 
