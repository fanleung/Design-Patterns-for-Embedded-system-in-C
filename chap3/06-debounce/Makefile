main: main.c Button.o ButtonDriver.o MicrowaveEmitter.o Timer.o 
	gcc -o main main.c Button.o ButtonDriver.o MicrowaveEmitter.o Timer.o && del *.o
Button.o: Button.c 
	gcc -c Button.c
ButtonDriver.o: ButtonDriver.c
	gcc -c ButtonDriver.c
MicrowaveEmitter.o: MicrowaveEmitter.c
	gcc -c MicrowaveEmitter.c
Timer.o: Timer.c
	gcc -c Timer.c

clean:
	del *.o




