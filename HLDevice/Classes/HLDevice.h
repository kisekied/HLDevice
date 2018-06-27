//
//  HLDevice.h
//  HLDevice
//
//  Created by kisekied on 2018/1/29.
//  Copyright © kisekied.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, HLDeviceModel) {
    HLDeviceModel_Unknown = 0,

    // iPhone
    HLDeviceModel_iPhone1G,
    HLDeviceModel_iPhone3G,
    HLDeviceModel_iPhone3GS,
    HLDeviceModel_iPhone4,
    HLDeviceModel_iPhone4s,
    HLDeviceModel_iPhone5,
    HLDeviceModel_iPhone5c,
    HLDeviceModel_iPhone5s,
    HLDeviceModel_iPhone6,
    HLDeviceModel_iPhone6Plus,
    HLDeviceModel_iPhone6s,
    HLDeviceModel_iPhone6sPlus,
    HLDeviceModel_iPhone7,
    HLDeviceModel_iPhone7Plus,
    HLDeviceModel_iPhoneSE,
    HLDeviceModel_iPhone8,
    HLDeviceModel_iPhone8Plus,
    HLDeviceModel_iPhoneX,

    // iPad
    HLDeviceModel_iPad1,
    HLDeviceModel_iPad2,
    HLDeviceModel_iPad3,
    HLDeviceModel_iPad4,
    HLDeviceModel_iPadAir,
    HLDeviceModel_iPadAir2,
    HLDeviceModel_iPad5,
    HLDeviceModel_iPadMini,
    HLDeviceModel_iPadMini2,
    HLDeviceModel_iPadMini3,
    HLDeviceModel_iPadMini4,
    HLDeviceModel_iPadPro9Inch,
    HLDeviceModel_iPadPro12Inch,
    HLDeviceModel_iPadPro12Inch2,
    HLDeviceModel_iPadPro10Inch,

    // iPod
    HLDeviceModel_iPodTouch1,
    HLDeviceModel_iPodTouch2,
    HLDeviceModel_iPodTouch3,
    HLDeviceModel_iPodTouch4,
    HLDeviceModel_iPodTouch5,
    HLDeviceModel_iPodTouch6,

    HLDeviceModelMaxValue,
    
    HLDeviceModelMinValue        = HLDeviceModel_Unknown,

    HLDeviceModel_iPhoneMinValue = HLDeviceModel_iPhone1G,
    HLDeviceModel_iPhoneMaxValue = HLDeviceModel_iPhoneX,
    HLDeviceModel_iPadMinValue   = HLDeviceModel_iPad1,
    HLDeviceModel_iPadMaxValue   = HLDeviceModel_iPadPro10Inch,
    HLDeviceModel_iPodMinValue   = HLDeviceModel_iPodTouch1,
    HLDeviceModel_iPodMaxValue   = HLDeviceModel_iPodTouch6,
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
