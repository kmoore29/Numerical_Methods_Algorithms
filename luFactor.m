%Kyle Moore
%Bechara
%Mech 105
%Due 4/3/19

%Inputs needs to be a square matrix. 

%Output L is the lower triangular matrix from the inputted matrix, output U
%is the upper triangular matrix, and output P is the pivot matrix, showing
%how the original (A) has been pivoted.

function [L, U, P] = luFactor(A)
[x,y] = size(A); %setting up size of matrix
U = A; %stating properties
L = eye(x,y); %stating properties
P = L; %stating properties
narginchk(1,1); %making sure # of inputs works
if x ~= y %setting up error parameter for users
    error('Matrix has to be a square')
else
end
for r = 1:y %saying it will run from row 1 until final row
    absA = abs(U); %finding magnitudes of numbers
    cmax = max(absA(:,r)) %find highest value
    [rmax,Cmax] = find(absA == cmax, 1, 'first'); %pivot highest value to top
    newU = U(r,:); %pivot highest value to top
    U(r,:) = U(rmax,:); %pivot highest value to top
    U(rmax,:) = newU; %pivot highest value to top
    for c = 1:y
        if c <= y-1
        f = U(c+1,:)/U(r,:); %performing LU Decomposition
        v = f*U(r,:); %performing LU Decomposition
        g = U(c+1,:)-v; %performing LU Decomposition
        else
            break
        end
    end
end
    disp('L=') %displaying appropriate heading
    disp(L) %displaying results
    disp('U=') %displaying appropriate heading
    disp(U) %displaying results
    disp('P=') %displaying appropriate heading
    disp(P) %displaying results
end