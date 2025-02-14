clc
clear all

Num = readtable('12perNH2.xlsx','Range','A1:E1477');

atomid    = Num.atomid';
atom_name = string(Num.atom_name)';
X         = Num.X';
Y         = Num.Y';
Z         = Num.Z';

len = length(X);
i=1;
while i<2*len

    if mod(i,2)==0
    
            atom_name(i+3:end+2) = atom_name(i+1:end);
               atomid(i+3:end+2) = atomid(i+1:end);
                    X(i+3:end+2) = X(i+1:end);
                    Y(i+3:end+2) = Y(i+1:end);
                    Z(i+3:end+2) = Z(i+1:end);         
        
                 atom_name_newN = "N";
                    atomid_newN = i;
                        X_newN  = X(i-1);
                        Y_newN  = Y(i-1);
                        Z_newN  = 8.218;

                 atom_name_newH1 = "H1";
                    atomid_newH1 = i+1;
                        X_newH1  = X(i-1);
                        Y_newH1  = Y(i-1)-0.971;
                        Z_newH1  = 8.561;
                        
                 atom_name_newH2 = "H2";
                    atomid_newH2 = i+2;
                        X_newH2  = X(i-1)+0.841;
                        Y_newH2  = Y(i-1)+0.485;
                        Z_newH2  = 8.561;

            
            atom_name(i) = atom_name_newN;
               atomid(i) = atomid_newN;
                    X(i) = X_newN;
                    Y(i) = Y_newN;
                    Z(i) = Z_newN;

            atom_name(i+1) = atom_name_newH1;
               atomid(i+1) = atomid_newH1;
                    X(i+1) = X_newH1;
                    Y(i+1) = Y_newH1;
                    Z(i+1) = Z_newH1;

            atom_name(i+2) = atom_name_newH2;
               atomid(i+2) = atomid_newH2;
                    X(i+2) = X_newH2;
                    Y(i+2) = Y_newH2;
                    Z(i+2) = Z_newH2;
 
                    i=i+3;
              
    

    % else
    %     atom_name(i)="CF";
    end 
 
    i=i+1;
end

% X=round(X,3);
% Y=round(Y,3);
% Z=round(Z,3);

filename = '12perNH2-drop-1.xlsx';
T = table(atomid',atom_name',X',Y',Z');
% T(1:5,:);
writetable(T,filename,'Sheet',1,'Range','A1')