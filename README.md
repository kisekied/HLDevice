# HLDevice
参考了[DeviceKit](https://github.com/dennisweissmann/DeviceKit), 判断iOS设备型号：
- `HLDeviceModel`：用于判断设备模型，如iPhoneX等
- `HLDeviceType`: 用于判断设备类型，目前有三种: `HLDeviceTypeUnkown`: 未知设备, `HLDeviceTypeRealMachine`: 真机, `HLDeviceTypeSimulator`: 模拟器
- `modelIdentifier`: iOS设备识别符。 如： "iPhone1,1", "iPad1,1"等

# Installation

### CocoaPods
``` ruby
pod 'HLDevice'
```

### Manually
将 `HLDevice.h` 和 `HLDevice.m` 拖到工程中即可。


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
- 2021-10-11 添加支持 `iPhone 13` 系列，以及 `iPad Mini 6`, `iPad 9`, `iPad Pro` 2021 系列
- 2020-11-17 添加支持 `iPhone SE2` 和 `iPhone 12` 系列, 以及 `iPad 7`, `iPad 8`, `iPad Air 4` 和 `iPad Pro` 2020 系列
- 2019-09-27 添加支持 `iPhone 11` 系列, `iPad Air 3`, `iPad mini 5`,  `iPod Touch 7`
- 2019-01-23 更新iPad型号
- 2018-10-09 修复真机bug.
- 2018-09-29 增加三种设备类型: iPhoneXR, iPhoneXS, iPhoneXS Max


