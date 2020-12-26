//
//  HomeViewController.m
//  demoObjective
//
//  Created by asdc on 2019/8/6.
//  Copyright © 2019 TongFangXL. All rights reserved.
//

#import "HomeViewController.h"
#import "MBExample.h"

#import "SDWebImageViewController.h"

#import "GCDViewController.h"

@interface HomeViewController ()

@property (nonatomic, strong) NSArray<NSArray<MBExample *> *> *examples;

@end

@implementation HomeViewController

- (id)init {
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.tintColor = [UIColor colorWithRed:.337f green:.57f blue:.731f alpha:1.f];
    
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.examples.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.examples[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MBExample *example = self.examples[indexPath.section][indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MBExampleCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MBExampleCell"];
    }
    cell.textLabel.text = example.title;
    cell.textLabel.textColor = self.view.tintColor;
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.selectedBackgroundView = [UIView new];
    cell.selectedBackgroundView.backgroundColor = [cell.textLabel.textColor colorWithAlphaComponent:0.1f];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MBExample *example = self.examples[indexPath.section][indexPath.row];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [self performSelector:example.selector];
    // [self performSelector:example.selector withObject:nil afterDelay:0];
#pragma clang diagnostic pop
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    });
}







- (NSArray<NSArray<MBExample *> *> *)examples {
    if (!_examples) {
        _examples =
        @[@[[MBExample exampleWithTitle:@"SDWebImage源码分析及架构设计探索" selector:@selector(SDWebImageExample)]],
          @[[MBExample exampleWithTitle:@"GCD 详尽总结" selector:@selector(GCDExample)],
            [MBExample exampleWithTitle:@"待将来时完成1" selector:@selector(indeterminateExample)],
            [MBExample exampleWithTitle:@"待将来时完成1" selector:@selector(indeterminateExample)]]
          ];
    }
    return _examples;
}

#pragma mark -- 每行的点击事件
- (void)indeterminateExample {
    
}

- (void)SDWebImageExample {
    SDWebImageViewController *nextVc = [[SDWebImageViewController alloc] init];
    [self.navigationController pushViewController:nextVc animated:YES];
}

- (void)GCDExample {
    GCDViewController *nextVc = [[GCDViewController alloc] init];
    [self.navigationController pushViewController:nextVc animated:YES];
}

@end
