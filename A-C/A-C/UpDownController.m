//
//  UpDownController.m
//  A-C
//
//  Created by puyang on 2017/2/9.
//  Copyright © 2017年 puyang. All rights reserved.
//

#import "UpDownController.h"
#import "RedAndGreenBarView.h"
#import "DrawLine.h"

#import "UIView+SetRect.h"
#import "WxHxD.h"
#import "UIFont+Fonts.h"
#import "NSString+HexColors.h"

@interface UpDownController ()

@end

@implementation UpDownController

- (void)setup{


    [super setup];
    
    [self addTitleViewBtn];
    
    [self loadUpDownBarChart];
    

}




- (void)loadUpDownBarChart{


    // 1.【坐标系底图】
    UIView *chartView = [[UIView alloc]initWithFrame:CGRectMake(10, 200, self.view.frame.size.width-20, 400)];
    chartView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:chartView];
    
    // 添加横虚线(5根)
    CGFloat lineNuber = 6;
    CGFloat heightBit = (chartView.frame.size.height-30) /lineNuber ;
    for (int i = 0; i<lineNuber+1; i++) {
        
        [DrawLine drawDashLine:chartView yValue:heightBit*i+15 lineLength:2 lineSpacing:1 lineColor:[UIColor lightGrayColor]];
        
    }
    
    // 文字角标
    NSArray *textArray = [NSArray arrayWithObjects:@"+15,000.00",@"+10,000.0",@"+5,000.00",@"0.00",@"-5,000.00",@"-10,000.00",@"-15,000.00", nil];
    for (int i = 0; i<textArray.count; i++) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(2, heightBit*i, 100, 15)];
        [chartView addSubview:label];
        label.text = textArray[i];
        label.textColor = [UIColor lightGrayColor];
        label.textAlignment = NSTextAlignmentLeft;
        label.font          = [UIFont fontWithName:@"HelveticaNeue-Thin" size:12];
    }
    
    
    
    
    
    
    // 2.【柱状图】
    
    RedAndGreenBarView *aChartBaseView = [[RedAndGreenBarView alloc]initWithFrame:chartView.bounds];
    aChartBaseView.backgroundColor = [UIColor clearColor];
    aChartBaseView.barColor = [UIColor yellowColor];
    aChartBaseView.barSpacing = 2;
    aChartBaseView.dataArray = [NSArray arrayWithObjects:@30,@20,@-30,@60,@-40,@40,@80,@50,@-10, @-50,@60,@40,@-30,@60,@-40,@40,@-30,@50,@-60,@50,@-10, @-50,@30,@20,@50,@-10,@30,@20,@-30,@-10, @50,@60,nil];
    [chartView  addSubview:aChartBaseView];
    [aChartBaseView showBarChart];
    
    
    
    // 3.【竖线和底部日期】






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
    [button addTarget:self action:@selector(loadUpDownBarChart) forControlEvents:UIControlEventTouchUpInside];
    [self.titleView addSubview:button];
    
}


@end
