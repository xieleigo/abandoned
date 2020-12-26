//
//  MBExample.m
//  xworkpro
//
//  Created by asdc on 2018/7/13.
//  Copyright © 2018年 TongFangXL. All rights reserved.
//

#import "MBExample.h"

@implementation MBExample

+ (instancetype)exampleWithTitle:(NSString *)title selector:(SEL)selector {
    MBExample *example = [[self class] new];
    example.title = title;
    example.selector = selector;
    return example;
}

@end
