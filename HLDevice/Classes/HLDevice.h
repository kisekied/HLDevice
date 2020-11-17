//
//  HLDevice.h
//  HLDevice
//
//  Created by kisekied on 2018/1/29.
//  Copyright © kisekied.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, HLDeviceModel) {
    HLDeviceModelUnknown = 0,

    // iPhone
    HLDeviceModeliPhone1G,
    HLDeviceModeliPhone3G,
    HLDeviceModeliPhone3GS,
    HLDeviceModeliPhone4,
    HLDeviceModeliPhone4s,
    HLDeviceModeliPhone5,
    HLDeviceModeliPhone5c,
    HLDeviceModeliPhone5s,
    HLDeviceModeliPhone6,
    HLDeviceModeliPhone6Plus,
    HLDeviceModeliPhone6s,
    HLDeviceModeliPhone6sPlus,
    HLDeviceModeliPhone7,
    HLDeviceModeliPhone7Plus,
    HLDeviceModeliPhoneSE,
    HLDeviceModeliPhone8,
    HLDeviceModeliPhone8Plus,
    HLDeviceModeliPhoneX,
    HLDeviceModeliPhoneXR,
    HLDeviceModeliPhoneXS,
    HLDeviceModeliPhoneXSMax,
    HLDeviceModeliPhone11,
    HLDeviceModeliPhone11Pro,
    HLDeviceModeliPhone11ProMax,
    HLDeviceModeliPhoneSE2,
    HLDeviceModeliPhone12Mini,
    HLDeviceModeliPhone12,
    HLDeviceModeliPhone12Pro,
    HLDeviceModeliPhone12ProMax,

    // iPad
    HLDeviceModeliPad1,
    HLDeviceModeliPad2,
    HLDeviceModeliPad3,
    HLDeviceModeliPad4,
    HLDeviceModeliPad5,
    HLDeviceModeliPad6,                 // iPad 2018
    HLDeviceModeliPad7,
    HLDeviceModeliPad8,

    HLDeviceModeliPadAir,
    HLDeviceModeliPadAir2,
    HLDeviceModeliPadAir3,
    HLDeviceModeliPadAir4,

    HLDeviceModeliPadMini,
    HLDeviceModeliPadMini2,
    HLDeviceModeliPadMini3,
    HLDeviceModeliPadMini4,
    HLDeviceModeliPadMini5,
    
    HLDeviceModeliPadPro9Inch,
    HLDeviceModeliPadPro12Inch,
    HLDeviceModeliPadPro12Inch2,
    HLDeviceModeliPadPro10Inch,
    HLDeviceModeliPadPro11Inch,
    HLDeviceModeliPadPro12Inch3,
    HLDeviceModeliPadPro11Inch2,
    HLDeviceModeliPadPro12Inch4,

    // iPod
    HLDeviceModeliPodTouch1,
    HLDeviceModeliPodTouch2,
    HLDeviceModeliPodTouch3,
    HLDeviceModeliPodTouch4,
    HLDeviceModeliPodTouch5,
    HLDeviceModeliPodTouch6,
    HLDeviceModeliPodTouch7,

    HLDeviceModelMaxValue,
    
    HLDeviceModelMinValue       = HLDeviceModelUnknown,

    HLDeviceModeliPhoneMinValue = HLDeviceModeliPhone1G,
    HLDeviceModeliPhoneMaxValue = HLDeviceModeliPhone12ProMax,
    HLDeviceModeliPadMinValue   = HLDeviceModeliPad1,
    HLDeviceModeliPadMaxValue   = HLDeviceModeliPadPro12Inch4,
    HLDeviceModeliPodMinValue   = HLDeviceModeliPodTouch1,
    HLDeviceModeliPodMaxValue   = HLDeviceModeliPodTouch7,
};

/**
 设备类型

 - HLDeviceTypeUnkown: 未知设备
 - HLDeviceTypeRealMachine: 真机
 - HLDeviceTypeSimulator: 模拟器
 */
typedef NS_ENUM(NSInteger, HLDeviceType) {
    HLDeviceTypeUnknown,
    HLDeviceTypeRealMachine,
    HLDeviceTypeSimulator,
};

@interface HLDevice : NSObject

@property (nonatomic, assign, readonly) HLDeviceModel deviceModel;
@property (nonatomic, assign, readonly) HLDeviceType deviceType;
@property (nonatomic, copy, readonly) NSString *modelIdentifier;

/**
 当前设备的实例对象.
 这是一个单例对象.
 */
+ (instancetype)currentDevice;

/**
 是否为iPhone, 不区分是否是真机
 */
- (BOOL)isPhone;

/**
 是否为iPad, 不区分是否是真机
 */
- (BOOL)isPad;

/**
 是否为iPod, 不区分是否是真机
 */
- (BOOL)isPod;

/**
 根据 model identifier 来判断设备

 @param modelIdentifier iOS device model identifier. 例如: "iPhone1,1", "iPad1,1"
 @return `HLDeviceModel`类型
 */
+ (HLDeviceModel)deviceModelWithModelIdentifier:(NSString *)modelIdentifier;

@end
