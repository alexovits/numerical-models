function [x] = Solver(filename)
fileID = fopen(filename,'r');
formatSpec = '%f';
size = [3 3];
A = fscanf(fileID,formatSpec,size);
size = [1 3];
b = fscanf(fileID,formatSpec,size);
size = [1 1];
n = fscanf(fileID,formatSpec,size);
size = [1 1];
eps = fscanf(fileID,formatSpec,size);
fclose(fileID);
A = A';
b = b';
if Convergent(A) == 1
    RelaxIteration(A,b,eps,0.01)
else
    disp('There was a problem. The iteration is not convergent')
end



%Ha P konnyen invertalhtato az... jo mert konyebben konvergal
% Soronkent domincancia -> konvergens Ha nem kilepsz!
end

