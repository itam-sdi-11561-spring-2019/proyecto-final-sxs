function [circuloN] =calculaObstaculos(ini,fin,Obs,numObs)
%Recta y parámetros para determinar si hay interferencias
m=(fin(2)-ini(2))/(fin(1)-ini(1));
b=ini(2)-m*ini(1);
numInter=0;
circuloN(1)=0;
for i=1:numObs
    d=abs(Obs(i,2)-m*(Obs(i,1))-b)/sqrt(m^2+1);
    %d2=abs(ini(1)-fin(1))-abs(ini(1)-Obs(i,1));
    %d3=abs(ini(2)-fin(2))-abs(ini(2)-Obs(i,2));
    d2=abs(ini(1)-fin(1))-max(abs([ini(1)-(Obs(i,1)+4),fin(1)-(Obs(i,1)+4)]));
    d3=abs(ini(2)-fin(2))-max(abs([ini(2)-(Obs(i,2)+4),fin(2)-(Obs(i,2)+4)]));
    if (d2>0 &d3>0)&d<40
        numInter=numInter+1;
        %Arreglo que nos indica cuáles círculos del arreglo interfieren con la ruta
        circuloN(numInter)=i;
    end
end
if(circuloN(1)~=0)
    d=(Obs(circuloN(1),1)-ini(1))^2+(Obs(circuloN(1),2)-ini(2))^2;
    for i=2:numInter
        dn=(Obs(circuloN(i),1)-ini(1))^2+(Obs(circuloN(i),2)-ini(2))^2;
        if(dn<d)
            d=dn;
            circuloN(1)=circuloN(i);
        end
    end
end
end