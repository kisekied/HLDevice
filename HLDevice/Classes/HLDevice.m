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

@property (nonatomic, copy, readwrite) NSString *modelIdentifier;

@end

@implementation HLDevice

#pragma mark - ♻️ LifeCycle

- (instancetype)init {
    if (self = [super init]) {
        [self mapDevice];
    }
    return self;
}


#pragma mark - Public

+ (instancetype)currentDevice {
    static HLDevice *device = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        device = [[HLDevice alloc] init];
    });
    return device;
}

- (BOOL)isPhone {
    return (self.deviceModel >= HLDeviceModeliPhoneMinValue &&
            self.deviceModel <= HLDeviceModeliPhoneMaxValue);
}

- (BOOL)isPad {
    return (self.deviceModel >= HLDeviceModeliPadMinValue &&
            self.deviceModel <= HLDeviceModeliPadMaxValue);
}

- (BOOL)isPod {
    return (self.deviceModel >= HLDeviceModeliPodMinValue &&
            self.deviceModel <= HLDeviceModeliPodMaxValue);
}


#pragma mark - Private

+ (nullable NSString *)modelIdentifierForCurrentDevice {
    NSString *identifier = nil;
    struct utsname systemInfo;
    uname(&systemInfo);
    identifier = [NSString stringWithCString:systemInfo.machine
                                    encoding:NSUTF8StringEncoding];
    return identifier;
}

- (void)mapDevice {

    _modelIdentifier     = [HLDevice modelIdentifierForCurrentDevice] ?: @"";

    if ([_modelIdentifier hasPrefix:@"iPhone"] ||
        [_modelIdentifier hasPrefix:@"iPad"] ||
        [_modelIdentifier hasPrefix:@"iPod"]) {
        _deviceType      = HLDeviceTypeRealMachine;
    } else if ([_modelIdentifier isEqualToString:@"i386"] ||
               [_modelIdentifier isEqualToString:@"x86_64"]) {
        _deviceType      = HLDeviceTypeSimulator;
        _modelIdentifier = [NSProcessInfo processInfo].environment[@"SIMULATOR_MODEL_IDENTIFIER"] ?: @"simulator";
    } else {
        _deviceType      = HLDeviceTypeUnknown;
        _modelIdentifier = @"unknown";
    }

    _deviceModel = [HLDevice deviceModelWithModelIdentifier:_modelIdentifier];
}

+ (HLDeviceModel)deviceModelWithModelIdentifier:(NSString *)modelIdentifier {

    NSDictionary<NSString *, NSNumber *> *map = HLDeviceModelMap();

    NSNumber *deviceModelNumber = map[modelIdentifier];

    if (deviceModelNumber) {
        NSInteger deviceModelNumberValue = deviceModelNumber.integerValue;
        if (deviceModelNumberValue > HLDeviceModelMinValue &&
            deviceModelNumberValue < HLDeviceModelMaxValue) {
            return deviceModelNumberValue;
        }
    }

    return HLDeviceModelUnknown;
}

#pragma mark - ⚙️ Getter

static inline NSDictionary<NSString *, NSNumber *> *HLDeviceModelMap() {
    return @{
             // iPhone
             @"iPhone1,1": @(HLDeviceModeliPhone1G),
             @"iPhone1,2": @(HLDeviceModeliPhone3G),
             @"iPhone2,1": @(HLDeviceModeliPhone3GS),
             @"iPhone3,1": @(HLDeviceModeliPhone4),
             @"iPhone3,2": @(HLDeviceModeliPhone4),
             @"iPhone3,3": @(HLDeviceModeliPhone4),
             @"iPhone4,1": @(HLDeviceModeliPhone4s),
             @"iPhone5,1": @(HLDeviceModeliPhone5),
             @"iPhone5,2": @(HLDeviceModeliPhone5),
             @"iPhone5,3": @(HLDeviceModeliPhone5c),
             @"iPhone5,4": @(HLDeviceModeliPhone5c),
             @"iPhone6,1": @(HLDeviceModeliPhone5s),
             @"iPhone6,2": @(HLDeviceModeliPhone5s),
             @"iPhone7,2": @(HLDeviceModeliPhone6),
             @"iPhone7,1": @(HLDeviceModeliPhone6Plus),
             @"iPhone8,1": @(HLDeviceModeliPhone6s),
             @"iPhone8,2": @(HLDeviceModeliPhone6sPlus),
             @"iPhone9,1": @(HLDeviceModeliPhone7),
             @"iPhone9,3": @(HLDeviceModeliPhone7),
             @"iPhone9,2": @(HLDeviceModeliPhone7Plus),
             @"iPhone9,4": @(HLDeviceModeliPhone7Plus),
             @"iPhone8,4": @(HLDeviceModeliPhoneSE),
             @"iPhone10,1": @(HLDeviceModeliPhone8),
             @"iPhone10,4": @(HLDeviceModeliPhone8),
             @"iPhone10,2": @(HLDeviceModeliPhone8Plus),
             @"iPhone10,5": @(HLDeviceModeliPhone8Plus),
             @"iPhone10,3": @(HLDeviceModeliPhoneX),
             @"iPhone10,6": @(HLDeviceModeliPhoneX),
             @"iPhone11,2": @(HLDeviceModeliPhoneXS),
             @"iPhone11,4": @(HLDeviceModeliPhoneXSMax),
             @"iPhone11,6": @(HLDeviceModeliPhoneXSMax),
             @"iPhone11,8": @(HLDeviceModeliPhoneXR),

             // iPad
             @"iPad1,1": @(HLDeviceModeliPad1),
             @"iPad2,1": @(HLDeviceModeliPad2),
             @"iPad2,2": @(HLDeviceModeliPad2),
             @"iPad2,3": @(HLDeviceModeliPad2),
             @"iPad2,4": @(HLDeviceModeliPad2),
             @"iPad3,1": @(HLDeviceModeliPad3),
             @"iPad3,2": @(HLDeviceModeliPad3),
             @"iPad3,3": @(HLDeviceModeliPad3),
             @"iPad3,4": @(HLDeviceModeliPad4),
             @"iPad3,5": @(HLDeviceModeliPad4),
             @"iPad3,6": @(HLDeviceModeliPad4),
             @"iPad4,1": @(HLDeviceModeliPadAir),
             @"iPad4,2": @(HLDeviceModeliPadAir),
             @"iPad4,3": @(HLDeviceModeliPadAir),
             @"iPad5,3": @(HLDeviceModeliPadAir2),
             @"iPad5,4": @(HLDeviceModeliPadAir2),
             @"iPad6,11": @(HLDeviceModeliPad5),
             @"iPad6,12": @(HLDeviceModeliPad5),
             @"iPad2,5": @(HLDeviceModeliPadMini),
             @"iPad2,6": @(HLDeviceModeliPadMini),
             @"iPad2,7": @(HLDeviceModeliPadMini),
             @"iPad4,4": @(HLDeviceModeliPadMini2),
             @"iPad4,5": @(HLDeviceModeliPadMini2),
             @"iPad4,6": @(HLDeviceModeliPadMini2),
             @"iPad4,7": @(HLDeviceModeliPadMini3),
             @"iPad4,8": @(HLDeviceModeliPadMini3),
             @"iPad4,9": @(HLDeviceModeliPadMini3),
             @"iPad5,1": @(HLDeviceModeliPadMini4),
             @"iPad5,2": @(HLDeviceModeliPadMini4),
             @"iPad6,3": @(HLDeviceModeliPadPro9Inch),
             @"iPad6,4": @(HLDeviceModeliPadPro9Inch),
             @"iPad6,7": @(HLDeviceModeliPadPro12Inch),
             @"iPad6,8": @(HLDeviceModeliPadPro12Inch),
             @"iPad7,1": @(HLDeviceModeliPadPro12Inch2),
             @"iPad7,2": @(HLDeviceModeliPadPro12Inch2),
             @"iPad7,3": @(HLDeviceModeliPadPro10Inch),
             @"iPad7,4": @(HLDeviceModeliPadPro10Inch),
             @"iPad7,5": @(HLDeviceModeliPad6),
             @"iPad7,6": @(HLDeviceModeliPad6),
             @"iPad8,1": @(HLDeviceModeliPadPro11Inch),
             @"iPad8,2": @(HLDeviceModeliPadPro11Inch),
             @"iPad8,3": @(HLDeviceModeliPadPro11Inch),
             @"iPad8,4": @(HLDeviceModeliPadPro11Inch),
             @"iPad8,5": @(HLDeviceModeliPadPro12Inch3),
             @"iPad8,6": @(HLDeviceModeliPadPro12Inch3),
             @"iPad8,7": @(HLDeviceModeliPadPro12Inch3),
             @"iPad8,8": @(HLDeviceModeliPadPro12Inch3),
             
             // iPod
             @"iPod1,1": @(HLDeviceModeliPodTouch1),
             @"iPod2,1": @(HLDeviceModeliPodTouch2),
             @"iPod3,1": @(HLDeviceModeliPodTouch3),
             @"iPod4,1": @(HLDeviceModeliPodTouch4),
             @"iPod5,1": @(HLDeviceModeliPodTouch5),
             @"iPod7,1": @(HLDeviceModeliPodTouch6),
             };
}

@end
