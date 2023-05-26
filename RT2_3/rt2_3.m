clear all
close all

% Importa i dati dal foglio di lavoro
tempi = load("matlab.mat", "tabellatempi");

% manipulation data
A=tempi.tabellatempi;
B= table2array(A);
T= str2double(B);

% remove line 20
T(20,:)= [];

% population
P1 = T(:,1); %Anna
P2 = T(:,2); %Andrea

% mean
m1 = mean(P1);
m2 = mean(P2);

N = length(T);

for i= 1:N
    x(i)=i;
end
    
err1 = std(P1);
err2 = std(P2);





for i= 1:N
    y1(i)=m1;
    y2(i)=m2;
end

% plot 1
plot(x,y1,'b')
hold on
plot(x,P1,'r')
hold on
errorbar(x',P1,err1)

title("Robot 1")
legend('mean','Robot 1','std')

% plot 2
figure
plot(x,y2,'b')
hold on
plot(x,P2,'r')
hold on
errorbar(x',P2,err2)

title("Robot 2")
legend('mean','Robot 2','std')

%plot1 vs plot2
figure
plot(x,P1,'r')
hold on
plot(x,P2,'b')
hold on

title("Robot 1 vs Robot 2")
legend('Robot 1','Robot 2')

% Calcola il t-test con i dati importati

[h, p, ci, stats] = ttest(P1,P2,'Alpha',0.05);

% Visualizza i risultati
disp(['Valore t: ', num2str(stats.tstat)]);
disp(['P-value: ', num2str(p)]);
disp(['Intervallo di confidenza: [', num2str(ci(1)), ', ', num2str(ci(2)), ']']);
if h
    disp('I tempi di esecuzione sono significativamente diversi.');
else
    disp('Non ci sono differenze significative tra i tempi di esecuzione.');
end