%%
example_GARII_dataset = importdata('example_GARII_dataset.mat');
TomoData_Xdeco = importdata('TomoData_Xdeco.mat');
TomoData_Xpure = importdata('TomoData_Xpure.mat');
TomoData_Ypure = importdata('TomoData_Ypure.mat');
TomoData_Zpure = importdata('TomoData_Zpure.mat');


%%
data = TomoData_Xdeco;
figure;
for i = 1:2;
    subplot(1,2,i);
    plot(data(:,1),data(:,1+i));
end

%%
rx = trapz(TomoData_Xpure(5000:15000,2));
ry = trapz(TomoData_Ypure(5000:15000,3));
rz = trapz(TomoData_Zpure(25000:35000,2));
rxdeco = trapz(TomoData_Xdeco(5000:15000,2))/rx;
rydeco = trapz(TomoData_Xdeco(5000:15000,3))/ry;
rzdeco = trapz(TomoData_Xdeco(25000:35000,2))/rz;

rho = densityMat(rxdeco,rydeco,rzdeco);


%%
figure;
for i = 1:8;
    subplot(2,4,i);
    plot(example_GARII_dataset.xdata,mean(example_GARII_dataset.dataQ(:,1,i,:),4));
end

