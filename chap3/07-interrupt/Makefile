main: main.c ButtonHandler.o LED.o Button.o 
	gcc -o main main.c ButtonHandler.o LED.o Button.o  && del *.o
ButtonHandler.o: ButtonHandler.c 
	gcc -c ButtonHandler.c
LED.o: LED.c
	gcc -c LED.c
Button.o: Button.c
	gcc -c Button.c

clean:
	del *.o




