//
//  GCDViewController.m
//  demoObjective
//
//  Created by asdc on 2019/8/15.
//  Copyright © 2019 TongFangXL. All rights reserved.
//

#import "GCDViewController.h"

@interface GCDViewController ()

@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.title = @"行走少年郎";
    
    NSArray *array1 = @[@"1", @"2", @"2", @"3", @"3", @"4", @"4"];
    NSMutableArray *array = [NSMutableArray arrayWithArray:array1];
    NSMutableArray *secondArray = [NSMutableArray new];
    for (NSInteger i = 0; i < [array count]; i ++) {
        NSString *stringi = array[i];
        NSMutableArray *newArray = [NSMutableArray new];
        [newArray addObject:stringi];

        for (NSInteger j = i + 1; j < [array count]; j ++) {
            NSString *stringj = array[j];
            if ([stringi isEqualToString:stringj]) {
                [newArray addObject:stringj];
                [array removeObjectAtIndex:j];
                j -= 1;
            }
        }

        [secondArray addObject:newArray];
    }
    
    NSMutableArray *tempArr = secondArray;
    NSLog(@"secondArray = %@",secondArray);
    
    
//    NSArray *array1 = @[@"2016-10-01",@"2016-10-02",@"2016-10-03",
//
//                        @"2016-10-01",@"2016-10-02",@"2016-10-03",
//
//                        @"2016-10-01",@"2016-10-02",@"2016-10-03",
//
//                        @"2016-10-01",@"2016-10-02",@"2016-10-03",
//
//                        @"2016-10-01",@"2016-10-02",@"2016-10-03",
//
//                        @"2016-10-01",@"2016-10-02",@"2016-10-03",
//
//                        @"2016-10-04",@"2016-10-06",@"2016-10-08",
//
//                        @"2016-10-05",@"2016-10-07",@"2016-10-09"];
//
//    NSMutableArray *array = [NSMutableArray arrayWithArray:array1];
//    NSMutableArray *dateMutablearray = [@[] mutableCopy];
//    for (int i = 0; i < array.count; i ++) {
//        NSString *string = array[i];
//        NSMutableArray *tempArray = [@[] mutableCopy];
//        [tempArray addObject:string];
//
//        for (int j = i + 1; j < array.count; j ++) {
//            NSString *jstring = array[j];
//            if([string isEqualToString:jstring]){
//                [tempArray addObject:jstring];
//                [array removeObjectAtIndex:j];
//                j -= 1;
//            }
//        }
//
//        [dateMutablearray addObject:tempArray];
//    }
//
//    NSLog(@"dateMutable:%@",dateMutablearray);
}

@end
