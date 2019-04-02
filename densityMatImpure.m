function [ rho ] = densityMatImpure( data , r )
%densityMatImpure Takes a dataset and generates a desnity function
    rx = trapz(data(5000:15000,2));
    ry = trapz(data(5000:15000,3));
    rz = trapz(data(25000:35000,2));
    rx = rx/r;
    ry = ry/r;
    rz = rz/r;
    rho = densityMat(rx,ry,rz);
end

