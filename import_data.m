%% Load data
example_GARII_dataset = importdata('example_GARII_dataset.mat');
TomoData_Xdeco = importdata('TomoData_Xdeco.mat');
TomoData_Xpure = importdata('TomoData_Xpure.mat');
TomoData_Ypure = importdata('TomoData_Ypure.mat');
TomoData_Zpure = importdata('TomoData_Zpure.mat');


%% Visualise state data
data = TomoData_Xpure;
figure;
for i = 1:2;
    subplot(1,2,i);
    plot(data(:,1),data(:,1+i));
end

%% Quantum State Tomography
rx = trapz(TomoData_Xpure(5000:15000,2));
ry = trapz(TomoData_Ypure(5000:15000,3));
rz = trapz(TomoData_Zpure(25000:35000,2));
rxdeco = trapz(TomoData_Xdeco(5000:15000,2))/rx;
rydeco = trapz(TomoData_Xdeco(5000:15000,3))/ry;
rzdeco = trapz(TomoData_Xdeco(25000:35000,2))/rz;

rho = densityMat(rxdeco,rydeco,rzdeco);

%% Visualise GARII data
figure;
for i = 1:8;
    subplot(2,4,i);
    plot(example_GARII_dataset.xdata,mean(example_GARII_dataset.dataQ(:,1,i,:),4));
end

%% Quantum Process Tomography
% First we need to find the integration bin:
starttime1 = 1.1e-5;
endtime1   = 3.0e-5;
starttime2 = 9.1e-5;
endtime2   = 1.1e-4;
bintimes = binIntegrationTimes(example_GARII_dataset.xdata, starttime1, endtime1, starttime2, endtime2);
% Now we integrate to find rx, ry, and rz
% Add -1e-3 to normalise correctly, maybe remove?
rz = trapz(mean(example_GARII_dataset.dataQ(bintimes(3):bintimes(4),1,1,:)-1e-3,4));
rzp= trapz(mean(example_GARII_dataset.dataQ(bintimes(3):bintimes(4),1,3,:)-1e-3,4));
rx = trapz(mean(example_GARII_dataset.dataQ(bintimes(1):bintimes(2),1,5,:)-1e-3,4));
ry = trapz(mean(example_GARII_dataset.dataI(bintimes(1):bintimes(2),1,7,:)-1e-3,4));

rho1       = densityMatGARII(rz,rz,rz,bintimes,example_GARII_dataset,2);
rho4       = densityMatGARII(rzp,rzp,rzp,bintimes,example_GARII_dataset,4);
plusplus   = densityMatGARII(rx,rx,rx,bintimes,example_GARII_dataset,6);
minusminus = densityMatGARII(ry,ry,ry,bintimes,example_GARII_dataset,8);

rho2 = plusplus - 1i*minusminus - 0.5*(1-1i)*(rho1+rho4);
rho3 = plusplus + 1i*minusminus - 0.5*(1+1i)*(rho1+rho4);

lambda = 0.5*[1,0,0,1;0,1,1,0;0,1,-1,0;1,0,0,-1];

chi = lambda*[rho1,rho2;rho3,rho4]*lambda;

bar3(chi)


