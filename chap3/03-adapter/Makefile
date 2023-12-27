main: main.c GasMixer.o GasDisplay.o AcmeO2Adapter.o AcmeO2SensorProxy.o GasMixer.o GasDisplay.o UltimateO2Adapter.o UltimateO2SensorProxy.o
	gcc -o main main.c GasMixer.o GasDisplay.o AcmeO2Adapter.o AcmeO2SensorProxy.o UltimateO2Adapter.o UltimateO2SensorProxy.o
AcmeO2Adapter.o: AcmeO2Adapter.c 
	gcc -c AcmeO2Adapter.c
AcmeO2SensorProxy.o: AcmeO2SensorProxy.c
	gcc -c AcmeO2SensorProxy.c
GasMixer.o: GasMixer.c
	gcc -c GasMixer.c
GasDisplay.o: GasDisplay.c
	gcc -c GasDisplay.c
UltimateO2Adapter.o: UltimateO2Adapter.c 
	gcc -c UltimateO2Adapter.c
UltimateO2SensorProxy.o: UltimateO2SensorProxy.c
	gcc -c UltimateO2SensorProxy.c

clean:
	del main.exe *.o



