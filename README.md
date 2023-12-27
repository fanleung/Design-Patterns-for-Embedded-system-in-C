# Design-Patterns-for-Embedded-system-in-C
C嵌入式编程设计模式

refer to: 
https://github.com/ksvbka/design_pattern_for_embedded_system

IDE：
vscode

编译eg：
`gcc sensor.c sensor_main.c -o main`

编译多个文件，建议参考目录中的 Makefile

运行eg：
`./main.exe`

原书有部分代码有问题，已修改；

如果此项目可以帮到你，请我喝杯咖啡:P

![reward](/pic/reward.png)


进度：
P75


### 第1章什么是嵌入式编程
#### 1.1 嵌入式系统有何特殊之处
#### 1.2 面向对象还是结构化
#### 1.3 小结
---
### 第2章嵌入式实时过程 Harmony 的嵌入式编程
#### 2.1 Harmony过程的基本原理
##### 2.1.5.4 实例:观察者模式 
```
心电图 ECG 模型数据
2-1 ECGPkg.h -> 定义队列大小和 boolean 类型
2-2 TMDQueue.h -> 定时标记数据队列(TMDQueue), 包括各种数据客户通过 ECG 模块插入的数据
2-3 ECG_Module.h -> 获取选定导联时间的数据，调用 TMDQueue_insert 存储
2-4 HistogramDisplay.h
2-5 TMDQueue.c
2-6 ECG_Module.c -> 实现文件显示数据如何插入到队列中
2-7 HistogramDisplay.c -> 实现文件显示 TMDQueue_remove 函数的使用
2-8 TestBuilder.h
2-9 TestBuilder.c
2=10 main.c -> 展示了不同的类插入数据到队列中的简单应用，并且有客户从中读出信息并使用
2-11 TMDQueue_ob.h 观察者模式的头文件
2-12 TMDQueue_ob.c 
2-13 NotificationHandle.h
2-14 NotificationHanlde.c
2-15 HistogramDisplay_ob.c 
```
#### 2.2 方法
#### 2.3 接下来是什么
---
### 第3章访问硬件的设计模式
#### 3.1 基本的硬件访问概念
```
3-1 操作面向位的内存映射硬件
3-2 C中的位域
```
#### 3.2 硬件代理模式
创建软件单元负责访问硬件的一部分、硬件压缩封装以及编码实现。使用类或结构体封装所有硬件设备访问。
- initialize: 公有方法，初始化
- configure: 公有方法，配置设备
- disable: 公有方法，关闭或禁用
- access: 公有方法，从设备返回一个特殊值
- mulate: 公有方法，向设备写入
- unmarshal: 私有方法，在返回设备数据前，执行解密解压等操作（表示->原始），客户不可访问
- marshal: 私有方法，使用其他方法获取参数后，执行加密压缩等操作(原始->表示)，客户不可访问

```
3-3 HardwareProxyExample.h
3-4 MotorData.h
3-5 MotorProxy.h
3-6 MotorProxy.c
```

#### 3.3 硬件适配器模式
扩展硬件代理模式，以提供支持不同硬件接口的能力；使已存在的硬件接口能适应应用期望
```
Gas_Display 客户为相关医护人员显示这些数据
Gas_Mixer 客户端将这些数据用于气体输送闭合循环控制
iO2Sensor 提供两个服务 gimmeO2Conc, gimmeO2Flow
AcmeO2SensorProxy 提供两个服务 getO2Conc, getO2Flow
UltimateO2Sensor 提供两个服务 accessO2Conc, accessGasFlow
```
#### 3.4 中介者模式
支持多种硬件设备的协调，实现系统级的行为
```
3-9 RobotArmManager.h
3-10 RobotArmManager.c

```
#### 3.5 观察者模式
发布遥感数据到需要的软件元素的方法("发布-订阅模式")
```
3-11 GasSensor.h
3-12 GasSensor.c
3-13 DisplayClient.h
3-14 DisplayClient.c
3-15 GasData.h
3-16 GasData.c
```

#### 3.6 去抖动模式
按键，转动开关，继电器等

#### 3.7 中断模式
硬件设备接口简单重用的方法<br>
高紧急度事件，即使在系统非常繁忙地处理其他事件时，也必须处理这些事件，如按键
#### 3.8 轮询模式
拓展中断定时器为嵌入式系统提供精确时序<br>
当数据或事件不是高度紧急，且数据采集事足够短可采用轮询模式
#### 3.9 小结
---
### 第4章嵌入并发和资源管理的设计模式
#### 4.1 并发基本概念
- 抢占式调度
- 时间片调度
- 优先级调度

#### 4.2 循环执行模式
> 在无线循环内调度线程
#### 4.3 静态优先级模式
通过优先级调度线程
#### 4.4 临界区模式
通过禁用任务转换保护资源
#### 4.5 守卫调用模式
通过互斥信号量保护资源
#### 4.6 队列模式
通过消息排队序列化访问
#### 4.7 汇合模式
协调复杂任务同步
#### 4.8 同时锁定模式
通过同时锁定资源避免死锁
#### 4.9 排序锁定
通过以特定的顺序锁定资源避免死锁
#### 4.10 小结
---
### 第5章状态机的设计模式
#### 5.1 哦,行为
#### 5.2 基本状态机概念
#### 5.3 单事件接收器模式
#### 5.4 多事件接收器模式
#### 5.5 状态表模式
#### 5.6 状态模式
#### 5.7 与状态
#### 5.8 分解与状态模式
#### 5.9 小结
---
### 第6章安全性和可靠性模式
#### 6.1 关于安全性和可靠性的一些事
#### 6.2 二进制反码模式
#### 6.3 CRC模式
#### 6.4 智能数据模式
#### 6.5 通道模式
#### 6.6 保护单通道模式
#### 6.7 双通道模式
#### 6.8 小结
---
附录A UML表示法
