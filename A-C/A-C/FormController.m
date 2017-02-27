//
//  FormController.m
//  A-C
//
//  Created by puyang on 2017/2/8.
//  Copyright © 2017年 puyang. All rights reserved.
//

#import "FormController.h"
#import "Header.h"
#import "DrawLine.h"
#import "UIView+SetRect.h"
#import "UIFont+Fonts.h"

@interface FormController ()

@end

@implementation FormController

- (void)setup {
    
    [super setup];
    
    
    {
    
    
        // 1.表格view
        UIView *formView = [[UIView alloc]initWithFrame:CGRectMake((ScreenWidth-300)/2, 50, 300, 300)];
        
        formView.backgroundColor = [UIColor whiteColor];
        
        [self.contentView addSubview:formView];
        
        
    
        // 2. 部分背景色  第一行的高度
        UIView *oneBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, formView.width, formView.height/6)];
        
        oneBarView.backgroundColor = [[UIColor lightGrayColor]colorWithAlphaComponent:0.3];
        [formView addSubview:oneBarView];

        
        
        // 3. 标题字段
        
        NSArray *titleArray = @[@"",@"投入",@"收入",@"盈亏"];
        
        for (int i = 0; i<4; i++) {
            
            UILabel *label       = [[UILabel alloc]initWithFrame:CGRectMake(oneBarView.width/4*i, 0, oneBarView.width/4, oneBarView.height)];
            label.text           = titleArray[i];
            label.textColor      = [UIColor grayColor];
            label.font           = [UIFont HelveticaNeueFontSize:15];
            label.textAlignment  = NSTextAlignmentCenter;
            [oneBarView addSubview:label];
            
            
        }
        
        
        // 特殊字段
        UILabel *label1       = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, oneBarView.width/4-2, oneBarView.height-15)];
        label1.text           = @"资产";
        label1.textColor      = [UIColor darkGrayColor];
        label1.font           = [UIFont HelveticaNeueFontSize:14];
        label1.textAlignment  = NSTextAlignmentRight;
        [oneBarView addSubview:label1];
        
        UILabel *label2       = [[UILabel alloc]initWithFrame:CGRectMake(2, 15, oneBarView.width/4, oneBarView.height-15)];
        label2.text           = @"姓名";
        label2.textColor      = [UIColor darkGrayColor];
        label2.font           = [UIFont HelveticaNeueFontSize:14];
        label2.textAlignment  = NSTextAlignmentLeft;
        [oneBarView addSubview:label2];
        
   
        
        
        
        // 4. 绘制横竖线
        // 添加竖实线(5根)
        CGFloat weightBit = (formView.frame.size.width) /4 ;
        for (int i = 0; i<=4; i++) {
            
            [DrawLine drawSolidLine:formView xValue:weightBit*i lineLength:2  lineColor:[UIColor lightGrayColor]];
            
        }
        
 
        
        // 添加横虚线(6根)
        CGFloat heightBit = (formView.frame.size.height) /6 ;
        for (int i = 0; i<=6; i++) {
            
            [DrawLine drawDashLine:formView yValue:heightBit*i lineLength:2 lineSpacing:1 lineColor:[UIColor darkGrayColor]];
            
        }
        
        // 斜线
        [DrawLine drawSolidLine:oneBarView startPoint:CGPointMake(0, 0) endPoint:CGPointMake(oneBarView.width/4, oneBarView.height) lineLength:1 lineColor:[UIColor grayColor]];
      // 5. 内容字段
    
    
    
    
    }
    
    
    
}
@end
