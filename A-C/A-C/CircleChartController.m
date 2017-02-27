//
//  CircleChartController.m
//  A-C
//
//  Created by puyang on 2017/2/10.
//  Copyright © 2017年 puyang. All rights reserved.
//

#import "CircleChartController.h"
#import "Header.h"
#import "UIView+SetRect.h"
#import "UIFont+Fonts.h"

#import "CirclePercentView.h"
#import "CircleInfomationView.h"


@interface CircleChartController ()

@property (nonatomic, strong) CirclePercentView     *circlePercentView;
@property (nonatomic, strong) CircleInfomationView  *circleInfomationView;


@property (nonatomic, strong) NSArray *percentArray;
@property (nonatomic, strong) NSArray *colorsArray;
@property (nonatomic, strong) NSArray *nameArray;



@end

@implementation CircleChartController

- (void)setup{
    
    
    [super setup];
    
    [self addTitleViewBtn];
    
  
    
    
    // 百分比数据（和为1）
    self.percentArray = @[@"0.2",@"0.1",@"0.3",@"0.13",@"0.17",@"0.1"];
    
    
    self.nameArray     = @[@"iOS",@"Java",@"Python",@"Android",@"人工智能",@"物联网"];
    
    
    self.colorsArray   =  @[[UIColor colorWithRed:223/255.0 green:73/255.0 blue:53/255.0 alpha:1],
                                               [UIColor colorWithRed:243/255.0 green:143/255.0 blue:43/255.0 alpha:1],
                                               [UIColor colorWithRed:235/255.0 green:218/255.0 blue:89/255.0 alpha:1],
                                               [UIColor colorWithRed:115/255.0 green:216/255.0 blue:75/255.0 alpha:1],
                                               [UIColor colorWithRed:58/255.0 green:223/255.0 blue:210/255.0 alpha:1],
                                               [UIColor colorWithRed:32/255.0 green:172/255.0 blue:255.0/255.0 alpha:1],
                                               [UIColor colorWithRed:39/255.0 green:92/255.0 blue:170/255.0 alpha:1],
                                               [UIColor colorWithRed:141/255.0 green:132/255.0 blue:240/255.0 alpha:1]];
    
    
    
    
    
      [self loadCircleChart];

   
}



- (void)loadCircleChart{


    // 移除所有子视图
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    
    
    // 百分比的view
    self.circlePercentView              = [[CirclePercentView alloc] initWithFrame:CGRectMake(0, 0, 210 *ScreenHeightRate, 210*ScreenHeightRate)];
    self.circlePercentView.center       = CGPointMake(Width / 2.f, 180*ScreenHeightRate);
    self.circlePercentView.lineWidth    = 20;
    self.circlePercentView.roateAngle   = 45.f;
    self.circlePercentView.percentArray = self.percentArray;
    self.circlePercentView.colorsArray  = self.colorsArray;
    [self.contentView addSubview:self.circlePercentView];
    
    // 圆环中数据view
    self.circleInfomationView        = [[CircleInfomationView alloc] initWithFrame:CGRectMake(0, 0, 210*ScreenHeightRate, 210 * ScreenHeightRate)];
    self.circleInfomationView.center = CGPointMake(Width / 2.f, 180*ScreenHeightRate);
    self.circleInfomationView.percentArray = self.percentArray;
    self.circleInfomationView.colorsArray  = self.colorsArray;
    self.circleInfomationView.nameArray    = self.nameArray;
    [self.contentView addSubview:self.circleInfomationView];

    
    
    [self.circlePercentView buildView];
    [self.circlePercentView showAnimated:YES];
    
    
    [self.circleInfomationView buildView];
    [self.circleInfomationView showAnimated:YES];
    
    
//    // 圆环
//    if ([self.circlePercentView haveBuildSubView] == NO) {
//        
//      
//        [self.circlePercentView buildView];
//        [self.circlePercentView showAnimated:YES];
//        
//    } else {
//        
//        [self.circlePercentView showAnimated:NO];
//    }
//    
//    // 圆环中的数据
//    if ([self.circleInfomationView haveBuildSubView] == NO) {
//        
//
//        [self.circleInfomationView buildView];
//        [self.circleInfomationView showAnimated:YES];
//        
//    } else {
//        
//        [self.circleInfomationView showAnimated:NO];
//    }



}







// 添加【重现】按钮
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
    [button addTarget:self action:@selector(loadCircleChart) forControlEvents:UIControlEventTouchUpInside];
    [self.titleView addSubview:button];
    
}

@end
