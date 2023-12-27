#ifndef IO2Sensor_H
#define IO2Sensor_H

typedef struct iO2Sensor iO2Sensor;
struct iO2Sensor
{
    int (*gimmeO2Flow)(void);       // 返回 0 - 100 范围的整数
    int (*gimmeO2Conc)(void);       // 返回 cc/min 为单位的整数类型
};

#endif // IO2Sensor_H