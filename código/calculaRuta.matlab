function ruta = calculaRuta(ini,fin,Obs)
close all;

rutaIn=[linspace(ini(1),fin(1),100);linspace(ini(2),fin(2),100);ones(1,100).*atan((fin(2)-ini(2))/(fin(1)-ini(1)))]';

 
numObs=length(Obs(:,1));
m=(fin(2)-ini(2))/(fin(1)-ini(1));
circuloN=calculaObstaculos(ini,fin,Obs,numObs);
%Vector con los puntos a los que debe llegar
numPuntos=1;
if(circuloN(1)==0)
    numInter=0;
else
    numInter=length(circuloN);
end
puntos(1,:)=[ini,atan(m)];
i=1;
r=16;
figure(3)
visualizacion(ini,fin,Obs,rutaIn,circuloN);
grid on;
figure(1)
numI=1;
while(numInter>=1 & numI<200)
        p1=[r*sin(puntos(numPuntos,3)-pi)+Obs(circuloN(i),1),r*cos(puntos(numPuntos,3))+Obs(circuloN(i),2)];
        p2=[-r*sin(puntos(numPuntos,3)+pi)+Obs(circuloN(i),1),-r*cos(puntos(numPuntos,3))+Obs(circuloN(i),2)];
        visualizacion(ini,fin,Obs,rutaIn,circuloN);
        plot(p1(1),p1(2),'d');
        plot(p2(1),p2(2),'d');
        getframe
        cipi=calculaObstaculos(ini,p1,Obs,numObs);
        if(cipi(1)<numInter|cipi(1)==0)
            numPuntos=1+numPuntos;
            puntos(numPuntos,:)=[p1,atan(((p1(2)-ini(2))/(p1(1)-ini(1))))];
            ini=p1;
            circuloN=calculaObstaculos(ini,fin,Obs,numObs);
             plot(p1(1),p1(2),'x');
             r=r+4;
            %
        else
            cipi=calculaObstaculos(ini,p2,Obs,numObs);
            if(cipi(1)<numInter|cipi(1)==0)
                numPuntos=1+numPuntos;
                puntos(numPuntos,:)=[p2,atan(((p2(2)-ini(2))/(p2(1)-ini(1))))];
                ini=p2;
                circuloN=calculaObstaculos(ini,fin,Obs,numObs);
                 plot(p2(1),p2(2),'x');
                 r=r+4;
            else
                 r=r+32
            end
        end
       if(circuloN(1)==0)
         numInter=0;
       else
         numInter=length(circuloN);
       end
       numI=numI+1;
       grid on;
end
puntos(numPuntos+1,:)=[fin,atan((fin(2)-ini(2))/(fin(1)-ini(1)))];
figure(2)
line(puntos(:,1),puntos(:,2))
hold on;
visualizacion([0,0],[0,0],Obs,[0,0],0)
grid on;
ruta=puntos;
end