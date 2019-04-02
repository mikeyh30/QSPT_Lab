function [ rho ] = densityMat( rx, ry, rz)
%densityMat outputs the density matrix for the given inputs
    sigma0 = [1,0;0,1];
    sigmaX = [0,1;1,0];
    sigmaY = [0,-1i;1i,0];
    sigmaZ = [1,0;0,-1];
    
    rho = 0.5*(sigma0+rx*sigmaX+ry*sigmaY+rz*sigmaZ);
end

