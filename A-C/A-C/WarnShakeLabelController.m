//
//  WarnShakeLabelController.m
//  A-C
//
//  Created by puyang on 2017/2/8.
//  Copyright © 2017年 puyang. All rights reserved.
//

#import "Header.h"
#import "WarnShakeLabelController.h"
#import "CALayer+Anim.h"

#import "GCD.h"
#import "UIView+SetRect.h"
#import "WxHxD.h"
#import "UIFont+Fonts.h"
#import "NSString+HexColors.h"

@interface WarnShakeLabelController ()

@property (nonatomic, strong) UILabel   *wrongNotice;
@property (nonatomic, strong) GCDTimer      *timer;
@end

@implementation WarnShakeLabelController

- (void)setup {
    
    [super setup];
    
    [self addTitleViewBtn];
    
    _timer = [[GCDTimer alloc] initInQueue:[GCDQueue mainQueue]];
    
    _md_get_weakSelf();
    [_timer event:^{
        
         [weakSelf showPasswordError];
        
    } timeIntervalWithSecs:2 delaySecs:1.f];
    
    [_timer start];

    
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
    [button addTarget:self action:@selector(showPasswordError) forControlEvents:UIControlEventTouchUpInside];
    [self.titleView addSubview:button];

}


// 密码错误提示
- (void)showPasswordError{
    
    
    if (self.wrongNotice){
        
        self.wrongNotice.alpha = 1;
        [self.wrongNotice.layer shake];
        [UIView animateWithDuration:0.5f delay:2.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            self.wrongNotice.alpha = 0;
            
        } completion:^(BOOL finished) {
            
        }];
        
        return;
        
        
    }
    
    
    

    
    self.wrongNotice   = [[UILabel alloc]initWithFrame:CGRectMake(Width/2-150, 130*ScreenHeightRate, 300, 20)];
    self.wrongNotice.textColor     = [@"ff0000" hexColor];
    self.wrongNotice.text          = @"券商密码错误，请重新输入";
    self.wrongNotice.font          = [UIFont HeitiSCWithFontSize:18.f];
    self.wrongNotice.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.wrongNotice];
    
    // shake 动画
    [self.wrongNotice.layer shake];
    [UIView animateWithDuration:0.5f delay:2.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        self.wrongNotice.alpha = 0;
        
    } completion:^(BOOL finished) {
        
    }];
    
    
    // 停止计时器
    [_timer destroy];
    
}


@end
