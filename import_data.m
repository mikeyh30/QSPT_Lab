%%
example_GARII_dataset = importdata('example_GARII_dataset.mat');
TomoData_Xdeco = importdata('TomoData_Xdeco.mat');
TomoData_Xpure = importdata('TomoData_Xpure.mat');
TomoData_Ypure = importdata('TomoData_Ypure.mat');
TomoData_Zpure = importdata('TomoData_Zpure.mat');

%%
sigma0 = [1,0;0,1];
sigmaX = [0,1;1,0];
sigmaY = [0,-1i;1i,0];
sigmaZ = [1,0;0,-1];

%%
data = TomoData_Xdeco;
figure
for i = 1:2;
    subplot(1,2,i)
    plot(data(:,1),data(:,1+i))
end

rx = trapz(data(5000:15000,2));
ry = trapz(data(5000:15000,3));
rz = trapz(data(25000:35000,2));
r = sqrt(rx^2+ry^2+rz^2);
rx = rx/r;
ry = ry/r;
rz = rz/r;
rho = 0.5*(sigma0+rx*sigmaX+ry*sigmaY+rz*sigmaZ);


%%
figure
for i = 1:8;
    subplot(2,4,i);
    plot(example_GARII_dataset.xdata,mean(example_GARII_dataset.dataQ(:,1,i,:),4));
end

