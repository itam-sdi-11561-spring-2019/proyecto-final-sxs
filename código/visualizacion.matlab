function visualizacion(ini,fin,Obs,ruta,circuloN)
%Es lo que tiene que publicar el publisher en ros (Ruta, obstáculos y
%posiciones
plot(ini(1),ini(2),'r*')
hold on;
plot(fin(1),fin(2),'ko')
%axis([-300, 300, -180, 180])

numObs=length(Obs(:,1));
%Recta que se debe ajustar a los obstaculos
%Se deben de considerar también los ángulos como una tercera columna
rutaIn=[linspace(ini(1),fin(1),100);linspace(ini(2),fin(2),100)]';
plot(rutaIn(:,1),rutaIn(:,2))
r=8;
ang=[0:.1:2*pi];
x0=r.*cos(ang);
y0=r.*sin(ang);
for i=1:numObs
    plot(Obs(i,1)+x0,Obs(i,2)+y0,'b');
end
if (circuloN~=0)
    for i=1:length(circuloN)
        plot(Obs(circuloN(i),1)+x0,Obs(circuloN(i),2)+y0,'r');
    end
end
plot(ruta(:,1),ruta(:,2));
end