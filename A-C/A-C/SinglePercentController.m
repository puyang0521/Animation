//
//  SinglePercentController.m
//  A-C
//
//  Created by puyang on 2017/2/13.
//  Copyright © 2017年 puyang. All rights reserved.
//

#import "SinglePercentController.h"
#import "Header.h"
#import "UIView+SetRect.h"
#import "UIFont+Fonts.h"

#import "LXGradientProcessView.h"
#import "LXCircleAnimationView.h"

@interface SinglePercentController ()

@property (nonatomic, strong) LXGradientProcessView *processView;        // 进度条
@property (nonatomic, strong) LXCircleAnimationView *circleProgressView; // 仿芝麻信用圆圈

@end

@implementation SinglePercentController

- (void)setup{
    
    
    [super setup];
    
//    [self addTitleViewBtn];
    
    
    [self loadSinglePercent];
    
    
    
}

- (void)loadSinglePercent{
    
    
    
      // 移除所有子视图
      [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
        // 渐变进度条
        self.processView = [[LXGradientProcessView alloc] initWithFrame:CGRectMake(10.f, 50.f, self.view.frame.size.width - 20.f, 45.f)];
        self.processView.percent = 100;
        [self.contentView addSubview:self.processView];
    
        // 芝麻信用
        self.circleProgressView = [[LXCircleAnimationView alloc] initWithFrame:CGRectMake(40.f, 350.f, self.view.frame.size.width - 80.f, self.view.frame.size.width - 80.f)];
        self.circleProgressView.bgImage = [UIImage imageNamed:@"backgroundImage"];
        self.circleProgressView.percent = 90.f;
        self.circleProgressView.text    = @"信用极好";
    
        [self.contentView addSubview:self.circleProgressView];
    
    
}

//// 添加【重现】按钮
//-(void)addTitleViewBtn{
//    
//    self.titleView.backgroundColor = [UIColor colorWithRed:204/255.0 green:232/255.0 blue:207/255.0 alpha:1];
//    
//    
//    UIButton  *button           = [[UIButton alloc] initWithFrame:CGRectMake(Width-70, 30, 60, 25)];
//    button.layer.cornerRadius   = 3.f;
//    button.layer.masksToBounds  = YES;
//    button.layer.borderWidth    = 0.5f;
//    button.layer.borderColor    = [[UIColor grayColor] colorWithAlphaComponent:0.25f].CGColor;
//    button.titleLabel.font      = [UIFont HYQiHeiWithFontSize:12];
//    [button setTitle:@"重现" forState:UIControlStateNormal];
//    [button setBackgroundColor:[UIColor whiteColor]];
//    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(loadSinglePercent) forControlEvents:UIControlEventTouchUpInside];
//    [self.titleView addSubview:button];
//    
//}

@end
