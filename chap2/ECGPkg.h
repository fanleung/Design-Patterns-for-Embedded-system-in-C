#ifndef __ECG_PKG_H__
#define __ECG_PKG_H__

/***
 *  定义了队列大小和 boolean 类型
 * 
*/

#include <stdio.h>
/* forward declarations */

struct ArrythmiaDetector;
struct ECG_Module;
struct HistogramDisplay;
struct QRSDetector;
struct TMDQueue;
struct TestBuilder;
struct TimeMarkedData;
struct WaveformDisplay;
typedef unsigned char boolean;

#define QUEUE_SIZE (20000)

#endif
