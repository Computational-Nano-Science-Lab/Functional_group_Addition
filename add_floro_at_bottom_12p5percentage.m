clc
clear

Num = readtable('toplayer_graphene.xlsx','Range','A1:E5905');

atomid    = Num.atomid';
atom_name = string(Num.atom_name)';
X         = Num.X';
Y         = Num.Y';
Z         = Num.Z';

len = length(X);
for i=1:1:0.875*len

    if mod(atomid(i),8)==2
    
                 atom_name_new = "CF";
                    atomid_new = atomid(i);
                        X_new  = X(i);
                        Y_new  = Y(i);
                        Z_new  = Z(i);
                        
            atom_name(i:end-1) = atom_name(i+1:end);
               atomid(i:end-1) = atomid(i+1:end);
                    X(i:end-1) = X(i+1:end);
                    Y(i:end-1) = Y(i+1:end);
                    Z(i:end-1) = Z(i+1:end);
        
                    
                atom_name(end) = atom_name_new;
                   atomid(end) = atomid_new;
                        X(end) = X_new;
                        Y(end) = Y_new;
                        Z(end) = Z_new;
        
        
                atom_name(end+1) = "F";
                   atomid(end+1) = atomid_new;
                      X(end+1) = X_new;
                      Y(end+1) = Y_new;
                      Z(end+1) = 1.39+6.7;
        
        
    
    end
        
 
end

X=round(X,3);
Y=round(Y,3);
Z=round(Z,3);

filename = 'atomdata_12p5per.xlsx';
T = table(atomid',atom_name',X',Y',Z');
% T(1:5,:);
writetable(T,filename,'Sheet',1,'Range','A1')