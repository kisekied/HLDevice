//
//  HLDevice.m
//  HLDevice
//
//  Created by kisekied on 2018/1/29.
//  Copyright © kisekied.
//
#import <UIKit/UIKit.h>
#import "HLDevice.h"
#import <sys/utsname.h>

@interface HLDevice ()

@property (nonatomic, copy) NSString *identifier;

@end

@implementation HLDevice

#pragma mark - ♻️ LifeCycle

- (instancetype)init {
    if (self = [super init]) {
        [self mapToDeviceModel];
    }
    return self;
}

#pragma mark - Public

- (BOOL)isPhone {
    return (self.deviceModel >= HLDeviceModel_iPhoneMinValue &&
            self.deviceModel <= HLDeviceModel_iPhoneMaxValue);
}

- (BOOL)isPad {
    return (self.deviceModel >= HLDeviceModel_iPadMinValue &&
            self.deviceModel <= HLDeviceModel_iPadMaxValue);
}

- (BOOL)isPod {
    return (self.deviceModel >= HLDeviceModel_iPodMinValue &&
            self.deviceModel <= HLDeviceModel_iPodMaxValue);
}


#pragma mark - Private

- (void)mapToDeviceModel {
    if ([self.identifier isEqualToString:@"i386"] || [self.identifier isEqualToString:@"x86_64"]) {
        _deviceType     = HLDeviceTypeSimulator;
        self.identifier =
        [NSProcessInfo processInfo].environment[@"SIMULATOR_MODEL_IDENTIFIER"] ?: @"iOS";
    } else {
        _deviceType     = HLDeviceTypeRealMachine;
    }

    NSDictionary<NSString *, NSNumber *> *map = [self identifierToDeviceModelMap];
    NSNumber *deviceModelNumber = map[self.identifier];
    if (deviceModelNumber) {
        NSInteger deviceModelNumberValue = deviceModelNumber.integerValue;
        if (deviceModelNumberValue > HLDeviceModelMinValue &&
            deviceModelNumberValue < HLDeviceModelMaxValue) {
            _deviceModel = deviceModelNumberValue;
            return;
        }
    }

    _deviceModel = HLDeviceModel_Unknown;
    _deviceType  = HLDeviceTypeUnkown;
}


#pragma mark - ⚙️ Getter

- (NSString *)identifier {
    if (!_identifier) {
        struct utsname systemInfo;
        uname(&systemInfo);
        _identifier = [NSString stringWithCString:systemInfo.machine
                                         encoding:NSUTF8StringEncoding];
    }
    return _identifier;
}

- (NSDictionary<NSString *, NSNumber *> *)identifierToDeviceModelMap {
    static NSDictionary *dict = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dict = @{
          // iPhone
          @"iPhone3,1": @(HLDeviceModel_iPhone4),
          @"iPhone3,2": @(HLDeviceModel_iPhone4),
          @"iPhone3,3": @(HLDeviceModel_iPhone4),
          @"iPhone4,1": @(HLDeviceModel_iPhone4s),
          @"iPhone5,1": @(HLDeviceModel_iPhone5),
          @"iPhone5,2": @(HLDeviceModel_iPhone5),
          @"iPhone5,3": @(HLDeviceModel_iPhone5c),
          @"iPhone5,4": @(HLDeviceModel_iPhone5c),
          @"iPhone6,1": @(HLDeviceModel_iPhone5s),
          @"iPhone6,2": @(HLDeviceModel_iPhone5s),
          @"iPhone7,2": @(HLDeviceModel_iPhone6),
          @"iPhone7,1": @(HLDeviceModel_iPhone6Plus),
          @"iPhone8,1": @(HLDeviceModel_iPhone6s),
          @"iPhone8,2": @(HLDeviceModel_iPhone6sPlus),
          @"iPhone9,1": @(HLDeviceModel_iPhone7),
          @"iPhone9,3": @(HLDeviceModel_iPhone7),
          @"iPhone9,2": @(HLDeviceModel_iPhone7Plus),
          @"iPhone9,4": @(HLDeviceModel_iPhone7Plus),
          @"iPhone8,4": @(HLDeviceModel_iPhoneSE),
          @"iPhone10,1": @(HLDeviceModel_iPhone8),
          @"iPhone10,4": @(HLDeviceModel_iPhone8),
          @"iPhone10,2": @(HLDeviceModel_iPhone8Plus),
          @"iPhone10,5": @(HLDeviceModel_iPhone8Plus),
          @"iPhone10,3": @(HLDeviceModel_iPhoneX),
          @"iPhone10,6": @(HLDeviceModel_iPhoneX),
          // iPad
          @"iPad2,1": @(HLDeviceModel_iPad2),
          @"iPad2,2": @(HLDeviceModel_iPad2),
          @"iPad2,3": @(HLDeviceModel_iPad2),
          @"iPad2,4": @(HLDeviceModel_iPad2),
          @"iPad3,1": @(HLDeviceModel_iPad3),
          @"iPad3,2": @(HLDeviceModel_iPad3),
          @"iPad3,3": @(HLDeviceModel_iPad3),
          @"iPad3,4": @(HLDeviceModel_iPad4),
          @"iPad3,5": @(HLDeviceModel_iPad4),
          @"iPad3,6": @(HLDeviceModel_iPad4),
          @"iPad4,1": @(HLDeviceModel_iPadAir),
          @"iPad4,2": @(HLDeviceModel_iPadAir),
          @"iPad4,3": @(HLDeviceModel_iPadAir),
          @"iPad5,3": @(HLDeviceModel_iPadAir2),
          @"iPad5,4": @(HLDeviceModel_iPadAir2),
          @"iPad6,11": @(HLDeviceModel_iPad5),
          @"iPad6,12": @(HLDeviceModel_iPad5),
          @"iPad2,5": @(HLDeviceModel_iPadMini),
          @"iPad2,6": @(HLDeviceModel_iPadMini),
          @"iPad2,7": @(HLDeviceModel_iPadMini),
          @"iPad4,4": @(HLDeviceModel_iPadMini2),
          @"iPad4,5": @(HLDeviceModel_iPadMini2),
          @"iPad4,6": @(HLDeviceModel_iPadMini2),
          @"iPad4,7": @(HLDeviceModel_iPadMini3),
          @"iPad4,8": @(HLDeviceModel_iPadMini3),
          @"iPad4,9": @(HLDeviceModel_iPadMini3),
          @"iPad5,1": @(HLDeviceModel_iPadMini4),
          @"iPad5,2": @(HLDeviceModel_iPadMini4),
          @"iPad6,3": @(HLDeviceModel_iPadPro9Inch),
          @"iPad6,4": @(HLDeviceModel_iPadPro9Inch),
          @"iPad6,7": @(HLDeviceModel_iPadPro12Inch),
          @"iPad6,8": @(HLDeviceModel_iPadPro12Inch),
          @"iPad7,1": @(HLDeviceModel_iPadPro12Inch2),
          @"iPad7,2": @(HLDeviceModel_iPadPro12Inch2),
          @"iPad7,3": @(HLDeviceModel_iPadPro10Inch),
          @"iPad7,4": @(HLDeviceModel_iPadPro10Inch),
          // iPod
          @"iPod5,1": @(HLDeviceModel_iPodTouch5),
          @"iPod7,1": @(HLDeviceModel_iPodTouch6),
          };
    });
    return dict;
}

@end
