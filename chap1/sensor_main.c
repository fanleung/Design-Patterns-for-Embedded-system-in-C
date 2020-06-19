#include "sensor.h"
#include <stdlib.h>
#include <stdio.h>

void main(void)
{
    Sensor *p_Sensor0, *p_Sensor1;
    p_Sensor0 = Sensor_create();
    p_Sensor1 = Sensor_create();

    p_Sensor0->value = 99;
    p_Sensor1->value = -1;

    printf("The current value from Sensor0 is %d\r\n", sensor_get_value(p_Sensor0));
    printf("The current value from Sensor1 is %d\r\n", sensor_get_value(p_Sensor1));

    sensor_destroy(p_Sensor0);
    sensor_destroy(p_Sensor1);
}