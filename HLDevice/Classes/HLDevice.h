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

    // iPad
    HLDeviceModeliPad1,
    HLDeviceModeliPad2,
    HLDeviceModeliPad3,
    HLDeviceModeliPad4,
    HLDeviceModeliPadAir,
    HLDeviceModeliPadAir2,
    HLDeviceModeliPad5,
    HLDeviceModeliPadMini,
    HLDeviceModeliPadMini2,
    HLDeviceModeliPadMini3,
    HLDeviceModeliPadMini4,
    HLDeviceModeliPadPro9Inch,
    HLDeviceModeliPadPro12Inch,
    HLDeviceModeliPadPro12Inch2,
    HLDeviceModeliPadPro10Inch,

    // iPod
    HLDeviceModeliPodTouch1,
    HLDeviceModeliPodTouch2,
    HLDeviceModeliPodTouch3,
    HLDeviceModeliPodTouch4,
    HLDeviceModeliPodTouch5,
    HLDeviceModeliPodTouch6,

    HLDeviceModelMaxValue,
    
    HLDeviceModelMinValue       = HLDeviceModelUnknown,

    HLDeviceModeliPhoneMinValue = HLDeviceModeliPhone1G,
    HLDeviceModeliPhoneMaxValue = HLDeviceModeliPhoneX,
    HLDeviceModeliPadMinValue   = HLDeviceModeliPad1,
    HLDeviceModeliPadMaxValue   = HLDeviceModeliPadPro10Inch,
    HLDeviceModeliPodMinValue   = HLDeviceModeliPodTouch1,
    HLDeviceModeliPodMaxValue   = HLDeviceModeliPodTouch6,
};

/**
 设备类型

 - HLDeviceTypeUnkown: 未知设备
 - HLDeviceTypeRealMachine: 真机
 - HLDeviceTypeSimulator: 模拟器
 */
typedef NS_ENUM(NSInteger, HLDeviceType) {
    HLDeviceTypeUnkown,
    HLDeviceTypeRealMachine,
    HLDeviceTypeSimulator,
};

@interface HLDevice : NSObject

@property (nonatomic, assign, readonly) HLDeviceModel deviceModel;
@property (nonatomic, assign, readonly) HLDeviceType deviceType;

/**
 当前设备 
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

@end
