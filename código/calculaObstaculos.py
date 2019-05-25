import numpy as np
def calculaObstaculos  (ini, fin, Obs, numObs):
	#Recta y parámetros para determinar si hay obstaculos en ella
	m = (fin(1)-ini(1))/(fin(0)-ini(0))
	b = ini(1)-m*ini(1)
	numInter=0

	for i in range(1,numObs):
		d=abs(Obs(i,2)-m*(Obs(i,1))-b)/sqrt(m^2+1)
		d2=abs(ini(0)-fin(0))-max(abs([ini(0)-(Obs(i,0)+4),fin(0)-(Obs(i,0)+4)]))
    	d3=abs(ini(1)-fin(1))-max(abs([ini(1)-(Obs(i,1)+4),fin(1)-(Obs(i,1)+4)]))
    	if (d2>0 &d3>0)&d<40:
    		numInter=numInter+1
    		#Arreglo que nos indica cuáles círculos del arreglo interfieren
    		circuloN(numInter)=i
    if (circuloN(0)!=0):
    	d=(Obs(circuloN(0),0)-ini(0))^2+(Obs(circuloN(0),1)-ini(1))^2
    	for i in range(1,num):
    		dn=(Obs(circuloN(i),0)-ini(0))^2+(Obs(circuloN(i),1)-ini(1))^2
    		if dn<d:
    			d=dn
    			circuloN(1)=circuloN(i)
    return circuloN
