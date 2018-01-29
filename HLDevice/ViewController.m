//
//  ViewController.m
//  HLDevice
//
//  Created by kisekied on 2018/1/29.
//  Copyright © 2018年 kisekied. All rights reserved.
//

#import "ViewController.h"
#import "HLDevice.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    HLDevice *device = [[HLDevice alloc] init];
    NSLog(@"device %@", device);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
