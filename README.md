# HLDevice
参考了[DeviceKit](https://github.com/dennisweissmann/DeviceKit), 判断iOS设备型号：
- `HLDeviceModel`：用于判断设备模型，如iPhoneX等
- `HLDeviceType`: 用于判断设备类型，目前有三种: `HLDeviceTypeUnkown`: 未知设备, `HLDeviceTypeRealMachine`: 真机, `HLDeviceTypeSimulator`: 模拟器

# Usage
```objc
HLDevice *device = [[HLDevice alloc] init];
if (device.deviceModel == HLDeviceModel_iPhoneX ) {
    ...
}
```

