function [ rho ] = densityMatGARII( rx, ry, rz, bintimes, GARII, phasecycle )
%densityMatGARII Provides a density matrix from GARII data
%   

rxdeco = trapz(mean(GARII.dataI(bintimes(1):bintimes(2),1,phasecycle,:)-1e-3,4))/rx;
rydeco = trapz(mean(GARII.dataQ(bintimes(1):bintimes(2),1,phasecycle,:)-1e-3,4))/ry;
rzdeco = trapz(mean(GARII.dataQ(bintimes(3):bintimes(4),1,phasecycle,:)-1e-3,4))/rz;

rho = densityMat(rxdeco,rydeco,rzdeco);

end

