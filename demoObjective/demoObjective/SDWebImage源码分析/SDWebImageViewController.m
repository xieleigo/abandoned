//
//  SDWebImageViewController.m
//  demoObjective
//
//  Created by asdc on 2019/8/12.
//  Copyright © 2019 TongFangXL. All rights reserved.
//
//  No known instance method for selector 'clearDiskOnCompletion:'
// 改为：[[[SDWebImageManager sharedManager] imageCache] clearWithCacheType:SDImageCacheTypeAll completion:nil];

#import "SDWebImageViewController.h"
#import <SDWebImage/SDWebImage.h>

@interface SDWebImageViewController ()

@property (strong,nonatomic)UIImageView *imageView;

@end

@implementation SDWebImageViewController

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.imageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width * 0.973);
    self.imageView.center = self.view.center;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSString *imageString = @"https://upload-images.jianshu.io/upload_images/2752872-fdfef90d4f90cdf7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1000";
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:imageString]
                      placeholderImage:[UIImage imageNamed:@"icon_default_image"]
                             completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                                 self.imageView.image = image;
                                 NSLog(@"图片下载完成");
                             }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    
    [self.view addSubview:self.imageView];
}

#pragma mark -- 懒加载
- (UIImageView *)imageView {
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor redColor];
    }
    return _imageView;
}

@end
