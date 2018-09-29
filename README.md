# HLDevice
参考了[DeviceKit](https://github.com/dennisweissmann/DeviceKit), 判断iOS设备型号：
- `HLDeviceModel`：用于判断设备模型，如iPhoneX等
- `HLDeviceType`: 用于判断设备类型，目前有三种: `HLDeviceTypeUnkown`: 未知设备, `HLDeviceTypeRealMachine`: 真机, `HLDeviceTypeSimulator`: 模拟器
- `modelIdentifier`: iOS设备识别符。 如： "iPhone1,1", "iPad1,1"等

# Usage
```objc
HLDevice *device = [HLDevice currentDevice];
if (device.deviceModel == HLDeviceModeliPhoneX ) {
    ...
}
```

`[HLDevice currentDevice]` 为单例对象，如果工程中对该设备对象使用次数很少，可以使用下面的正常实例化方法：



```objc
HLDevice *device = [[HLDevice alloc] init];
if (device.deviceModel == HLDeviceModeliPhoneX ) {
    ...
}
```



# History
2018-09-29 增加三种设备类型: iPhoneXR, iPhoneXS, iPhoneXS Max


