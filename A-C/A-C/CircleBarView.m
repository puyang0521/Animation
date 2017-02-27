//
//  CircleBarView.m
//  ZiPeiYi
//
//  Created by YouXianMing on 16/1/4.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#import "CircleBarView.h"
#import "UIView+SetRect.h"
#import "NSString+HexColors.h"
#import "UIFont+Fonts.h"
#import "WxHxD.h"
#import "NSString+HexColors.h"

@interface CircleBarView ()

@property (nonatomic, strong) UIView  *colorView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *percentLabel;

@end

@implementation CircleBarView

- (void)buildViewWithType:(ECircleBarViewType)type {

    if (type == kNormalType) {
        
        self.colorView                 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 11*ScreenHeightRate, 11*ScreenHeightRate)];
        self.colorView.backgroundColor = self.color;
        self.colorView.center          = CGPointMake(self.width / 2.f - 25.f*ScreenWidthRate, self.middleY);
        [self addSubview:self.colorView];
        
        self.titleLabel           = [[UILabel alloc] initWithFrame:CGRectMake(self.width / 2.f - 15*ScreenWidthRate, 0, self.width / 2.f, self.height)];
        self.titleLabel.textColor = [@"#666666" hexColor];
        self.titleLabel.text      = self.name;
        self.titleLabel.font      = [UIFont HeitiSCWithFontSize:11.f];
        [self addSubview:self.titleLabel];
        
        self.colorView.alpha  = 0.f;
        self.titleLabel.alpha = 0.f;
        
    } else if (type == kBigType) {
        
        // 颜色
        self.colorView                 = [[UIView alloc] initWithFrame:CGRectMake(0, 3.5f*ScreenHeightRate, 11*ScreenHeightRate, 11*ScreenHeightRate)];
        self.colorView.backgroundColor = self.color;
        [self addSubview:self.colorView];
        
        // 标题
        self.titleLabel           = [[UILabel alloc] initWithFrame:CGRectMake(19 *ScreenWidthRate, 1, self.width / 2.f, 14.f*ScreenHeightRate)];
        self.titleLabel.textColor = [@"#666666" hexColor];
        self.titleLabel.text      = [NSString stringWithFormat:@"%@ - ", self.name];
        self.titleLabel.font      = [UIFont HeitiSCWithFontSize:12.f];
        [self.titleLabel sizeToFit];
        [self addSubview:self.titleLabel];
        
        // 百分比
        self.percentLabel           = [[UILabel alloc] initWithFrame:self.titleLabel.frame];
        self.percentLabel.x         = self.titleLabel.right;
        self.percentLabel.width    += 100*ScreenWidthRate;
        self.percentLabel.textColor = self.color;
        self.percentLabel.font      = [UIFont HeitiSCWithFontSize:15.f];
        [self addSubview:self.percentLabel];
        self.percentLabel.text      = @"40%";
        
        
    } else if (type == kLineType) {
    
        // 颜色
        self.colorView                 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10*ScreenHeightRate, 10*ScreenHeightRate)];
        self.colorView.backgroundColor = self.color;
        [self addSubview:self.colorView];
        
        // 标题
        self.titleLabel           = [[UILabel alloc] initWithFrame:CGRectMake(self.colorView.right+10*ScreenWidthRate, 0, self.width-(20+40+10)*ScreenWidthRate, 10.f*ScreenHeightRate)];
        self.titleLabel.textColor = [@"#999999" hexColor];
        self.titleLabel.centerY   = self.colorView.centerY;
        self.titleLabel.text      = self.name;
        self.titleLabel.font      = [UIFont HeitiSCWithFontSize:10.f];
        [self addSubview:self.titleLabel];
        
        // 百分比
        self.percentLabel           = [[UILabel alloc] initWithFrame:CGRectMake(self.titleLabel.right+10*ScreenWidthRate, 0, 40*ScreenWidthRate, 10*ScreenHeightRate)];
        self.percentLabel.centerY   = self.colorView.centerY;
        self.percentLabel.textColor = [@"#999999" hexColor];
        self.percentLabel.font      = [UIFont HeitiSCWithFontSize:10.f];
        self.percentLabel.text      = @"%40";
        [self addSubview:self.percentLabel];
        
    }
}

- (void)showAnimated:(BOOL)animated type:(ECircleBarViewType)type {

    if (type == kNormalType) {
        
        if (animated) {
            
            [UIView animateWithDuration:1.75f animations:^{
                
                self.colorView.alpha  = 1.f;
                self.titleLabel.alpha = 1.f;
            }];
            
        } else {
        
            self.colorView.alpha  = 1.f;
            self.titleLabel.alpha = 1.f;
        }
    }
}


@end
