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
    HLDeviceModel_iPodTouch5,
    HLDeviceModel_iPodTouch6,

    HLDeviceModelMaxValue,
    
    HLDeviceModelMinValue        = HLDeviceModel_Unknown,

    HLDeviceModel_iPhoneMinValue = HLDeviceModel_iPhone4,
    HLDeviceModel_iPhoneMaxValue = HLDeviceModel_iPhoneX,
    HLDeviceModel_iPadMinValue   = HLDeviceModel_iPad2,
    HLDeviceModel_iPadMaxValue   = HLDeviceModel_iPadPro10Inch,
    HLDeviceModel_iPodMinValue   = HLDeviceModel_iPodTouch5,
    HLDeviceModel_iPodMaxValue   = HLDeviceModel_iPodTouch6,
};

typedef NS_ENUM(NSInteger, HLDeviceType) {
    HLDeviceTypeUnkown,
    HLDeviceTypeRealMachine,
    HLDeviceTypeSimulator,
};

@interface HLDevice : NSObject

@property (nonatomic, assign, readonly) HLDeviceModel deviceModel;
@property (nonatomic, assign, readonly) HLDeviceType deviceType;

- (BOOL)isPhone;
- (BOOL)isPad;
- (BOOL)isPod;

@end
