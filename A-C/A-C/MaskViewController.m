//
//  MaskViewController.m
//  A-C
//
//  Created by puyang on 2017/2/14.
//  Copyright © 2017年 puyang. All rights reserved.
//

#import "MaskViewController.h"
#import "Header.h"

#import "GCD.h"
#import "UIView+SetRect.h"
#import "WxHxD.h"
#import "UIFont+Fonts.h"
#import "NSString+HexColors.h"

#import "SingleMaskView.h"

@interface MaskViewController ()

@end

@implementation MaskViewController

- (void)setup {
    
    [super setup];
    
    [self addTitleViewBtn];
    
    [self showMaskView];
    
}


- (void)showMaskView{

   SingleMaskView *maskView = [SingleMaskView new];

    [maskView addTransparentRect:CGRectMake(self.contentView.width-180*ScreenWidthRate, 205*ScreenHeightRate, 170*ScreenWidthRate, 50*ScreenHeightRate) withRadius:10*ScreenWidthRate];
    [maskView addImage:[UIImage imageNamed:@"首页引导"] withFrame:CGRectMake(self.contentView.width-220*ScreenWidthRate, 270*ScreenHeightRate, 210*ScreenWidthRate, 83*ScreenWidthRate)];
    
    [GCDQueue executeInMainQueue:^{
        
        [maskView showMaskViewInView:self.view];
        
    } afterDelaySecs:0.7];
    


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
    [button addTarget:self action:@selector(showMaskView) forControlEvents:UIControlEventTouchUpInside];
    [self.titleView addSubview:button];
    
}

@end
