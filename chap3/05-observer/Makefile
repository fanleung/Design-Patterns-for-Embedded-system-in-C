main: main.c DisplayClient.o GasData.o GasMixerClient.o GasNotificationHandle.o GasSensor.o SatetyMonitorClient.o
	gcc -o main main.c DisplayClient.o GasData.o GasMixerClient.o GasNotificationHandle.o GasSensor.o SatetyMonitorClient.o && del *.o
DisplayClient.o: DisplayClient.c 
	gcc -c DisplayClient.c
GasData.o: GasData.c
	gcc -c GasData.c
GasMixerClient.o: GasMixerClient.c
	gcc -c GasMixerClient.c
GasNotificationHandle.o: GasNotificationHandle.c
	gcc -c GasNotificationHandle.c
GasSensor.o: GasSensor.c 
	gcc -c GasSensor.c
SatetyMonitorClient.o: SatetyMonitorClient.c 
	gcc -c SatetyMonitorClient.c

clean:
	del *.o




