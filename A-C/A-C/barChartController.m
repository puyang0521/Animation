//
//  barChartController.m
//  A-C
//
//  Created by puyang on 2017/2/9.
//  Copyright © 2017年 puyang. All rights reserved.
//

#import "barChartController.h"
#import "Header.h"
#import "GCD.h"
#import "UIView+SetRect.h"
#import "WxHxD.h"
#import "UIFont+Fonts.h"
#import "NSString+HexColors.h"

#import "AniChartView.h"
#import "AniChartViewBaseView.h"

@interface barChartController ()


@property (nonatomic, strong) GCDTimer      *timer;

@end

@implementation barChartController

- (void)setup{


    [super setup];
    
    self.contentView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3f];
    
    
    
    [self addTitleViewBtn];
    
    
    
    _timer = [[GCDTimer alloc] initInQueue:[GCDQueue mainQueue]];
    
    _md_get_weakSelf();
    [_timer event:^{
        
        [weakSelf showBarChart];
        
    } timeIntervalWithSecs:2];
    
    [_timer start];
    
 
    


}




- (void)showBarChart{


    // 移除所有子视图
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
  

    // 缩放效果
    AniChartView *aChartView = [[AniChartView alloc]initWithFrame:CGRectMake(50, 50, 260, 200)];

    aChartView.barColor = [UIColor yellowColor];
    aChartView.barSpacing = 10;
    aChartView.dataArray = [NSArray arrayWithObjects:@30,@20,@60,@40,@80,@50, nil];
    [self.contentView addSubview:aChartView];
    [aChartView showBarChart];
    
   

    
    // 逐条显示效果
    AniChartViewBaseView *aChartBaseView = [[AniChartViewBaseView alloc]initWithFrame:CGRectMake(50, 300, 260, 200)];
//    aChartBaseView.backgroundColor = [UIColor whiteColor];
    aChartBaseView.barColor = [UIColor yellowColor];
    aChartBaseView.barSpacing = 10;
    aChartBaseView.dataArray = [NSArray arrayWithObjects:@30,@20,@30,@20,@60,@40,@60,@40,@80,@50, nil];
    [self.contentView addSubview:aChartBaseView];
    [aChartBaseView showBarChart];



    
    
    // 停止计时器
    [_timer destroy];



}




-(void)addTitleViewBtn{
    
    self.titleView.backgroundColor = [UIColor colorWithRed:204/255.0 green:232/255.0 blue:207/255.0 alpha:1];
    
    
    UIButton  *button           = [[UIButton alloc] initWithFrame:CGRectMake(Width-70, 30, 60, 25)];
    button.layer.cornerRadius   = 3.f;
    button.layer.masksToBounds  = YES;
    button.layer.borderWidth    = 0.5f;
    button.layer.borderColor    = [[UIColor grayColor] colorWithAlphaComponent:0.25f].CGColor;
    button.titleLabel.font      = [UIFont HYQiHeiWithFontSize:12];
    [button setTitle:@"重现" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor whiteColor]];
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(showBarChart) forControlEvents:UIControlEventTouchUpInside];
    [self.titleView addSubview:button];
    
}

@end
