#include <stdio.h>
#include "Button.h"
#include "ButtonHandler.h"
#include "LED.h"

int main(int argc, char const *argv[])
{
    int j;
    Button* itsButton;
    LED* itsLED;
    itsButton = Button_Create();
    itsLED = LED_Create();

    for (j=0;j<9;j++) {
        ISRAddress[j] = NULL;
        oldVectors[j] = NULL;
    };
    install(); /* install interrupt vectors */
    /* normal system execution stuff */

    return 0;
}