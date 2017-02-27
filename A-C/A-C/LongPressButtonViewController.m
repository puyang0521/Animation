//
//  LongPressButtonViewController.m
//  A-C
//
//  Created by puyangon 2017/2/16.
//  Copyright © 2017年 puyang. All rights reserved.
//

#import "LongPressButtonViewController.h"
#import "PressAnimationButton.h"
#import "UIFont+Fonts.h"
#import "UIView+SetRect.h"

@interface LongPressButtonViewController () <PressAnimationButtonDelegate>

@property (nonatomic, strong) PressAnimationButton *button;

@end

@implementation LongPressButtonViewController

- (void)setup {
    
    [super setup];
    
    self.button          = [[PressAnimationButton alloc] initWithFrame:CGRectMake(0, 0, 280, 40)];
    self.button.font     = [UIFont HeitiSCWithFontSize:14.f];
    self.button.delegate = self;
    
    self.button.normalTextColor    = [UIColor blackColor];
    self.button.highlightTextColor = [UIColor whiteColor];
    self.button.animationColor     = [UIColor blackColor];
    
    self.button.layer.borderWidth  = 0.5f;
    self.button.animationWidth     = 200;
    self.button.text               = @"iOS Programmer LCL";
    
    self.button.center = self.contentView.middlePoint;
    [self.contentView addSubview:self.button];

    
    
}

#pragma mark 长按按钮事件
- (void)finishedEventByPressAnimationButton:(PressAnimationButton *)button {
    
    NSLog(@"%@", button);
}
@end
