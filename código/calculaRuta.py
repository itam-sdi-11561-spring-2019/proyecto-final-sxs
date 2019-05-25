import numpy as np
def calculaRuta  (ini, fin, Obs):
	numObs= len(Obs) #toma la columna
	m=(fin(1)-ini(1))/(fin(0)-ini(0))
	circuloN = alculaObstaculos(ini,fin,Obs,numObs)
	#Vector con los puntos a los que debe llegar
	numPuntos=1
	if circuloN(0)==0:
		numInter=0
	else
		numInter=len(circuloN)
	
	#puntos(1,:)=[ini,atan(m)];
	puntos(1)=[ini, math.atan(m)] #toma la fila 1
	i=1
	r=16
	numI=0
	while(numInter>=1 & numI<200):
        p1=[r*sin(puntos(numPuntos,2)-math.pi)+Obs(circuloN(i),0),r*cos(puntos(numPuntos,2))+Obs(circuloN(i),1)]
        p2=[-r*sin(puntos(numPuntos,2)+math.pi)+Obs(circuloN(i),0),-r*cos(puntos(numPuntos,2))+Obs(circuloN(i),1)]
        cipi=calculaObstaculos(ini,p1,Obs,numObs)
        if(cipi(0)<numInter|cipi(0)==0):
            numPuntos=1+numPuntos
            puntos(numPuntos)=[p1,math.atan(((p1(1)-ini(1))/(p1(0)-ini(0))))]
            ini=p1
            circuloN=calculaObstaculos(ini,fin,Obs,numObs)
            r=r+4;
        else:
            cipi=calculaObstaculos(ini,p2,Obs,numObs)
            if(cipi(1)<numInter|cipi(1)==0):
                numPuntos=1+numPuntos
                puntos(numPuntos)=[p2,math.atan(((p2(1)-ini(1))/(p2(0)-ini(0))))]
                ini=p2
                circuloN=calculaObstaculos(ini,fin,Obs,numObs)
                r=r+4
            else:
                r=r+32
    	if(circuloN(1)==0):
    		numInter=0
    	else:
    		numInter=len(circuloN)
		numI=numI+1
	puntos(numPuntos+1)=[fin,math.atan((fin(1)-ini(1))/(fin(0)-ini(0)))]
	ruta=puntos
    return ruta

	#len(Obs) #columnas
	#len(Obs[1])	#filas

