main: main.c BCPeriodicPoller.o BCTimer.o BreathingCircuitSensor.o MedicalDisplay.o
	gcc -o main main.c BCPeriodicPoller.o BCTimer.o BreathingCircuitSensor.o  MedicalDisplay.o && del *.o

BCPeriodicPoller.o: BCPeriodicPoller.c 
	gcc -c BCPeriodicPoller.c
BCTimer.o: BCTimer.c
	gcc -c BCTimer.c
BreathingCircuitSensor.o: BreathingCircuitSensor.c
	gcc -c BreathingCircuitSensor.c
MedicalDisplay.o: MedicalDisplay.c
	gcc -c MedicalDisplay.c

clean:
	del *.o




