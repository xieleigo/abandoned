//
//  MBExample.h
//  xworkpro
//
//  Created by asdc on 2018/7/13.
//  Copyright © 2018年 TongFangXL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBExample : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) SEL selector;

+ (instancetype)exampleWithTitle:(NSString *)title selector:(SEL)selector;

@end
