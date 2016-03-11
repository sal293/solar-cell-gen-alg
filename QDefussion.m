function [ System ] = QDefussion( Ld,R,System)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

Ld=80;
R=linspace(0,241,240);
I=linspace(1,479,240);
V=exp(-((R/Ld).^2));
Ss=sum(V);
Fr=V/Ss;

figure(8)
plot(Fr);
grid
title('Defussion');
xlabel('Distance[nm]');
ylabel('Precentage [%]');


S=size(System);


d=130;

for i=1:S(1)
    for j=1:S(2)
        for k=1:S(3)
            
for d = 1:d
    for m = -d:d
        for n = -d:d
            for l = -d:d
                
                r=m*m + n*n + l*l;
                
                if r~=0
                ir=round(sqrt(r));
                else
                    ir=1;
                end
                
                if i+m>0 && j+n>0 && k+l>0 && i+m<S(1) && j+n<S(2) && k+l<S(3)
                if r <= d^2
                    %if r > (d-1)*(d-1)
                        
                        System(i+m,j+n,k+l,4)= System(i+m,j+n,k+l,4)+(Fr(ir)/(4*pi*r))*System(i,j,k,2);
                    %end
                end
                end
            end
        end
    end
end

        end
    end
end

%C=I.^3;
%C(2:240)=C(2:240)-C(1:239);

%Fr=V./C;
%Def=Fr;

%plot(Def);

end
