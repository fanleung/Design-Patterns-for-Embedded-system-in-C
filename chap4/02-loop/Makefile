GasControlExecutive: GasControlExecutive.c GasDisplayThread.o SharedData.o
	gcc -o GasControlExecutive GasControlExecutive.c GasDisplayThread.o SharedData.o && del *.o

GasDisplayThread.o: GasDisplayThread.c 
	gcc -c GasDisplayThread.c
SharedData.o: SharedData.c
	gcc -c SharedData.c

clean:
	del *.o




