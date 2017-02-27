//
//  UIView+AnimationsListViewController.m
//  Animations
//
//  Created by YouXianMing on 16/3/25.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#import "UIView+AnimationsListViewController.h"
#import "UIFont+Fonts.h"
#import "UIView+SetRect.h"
@implementation UIView (AnimationsListViewController)

+ (UILabel *)animationsListViewControllerNormalHeadLabel {

    // Title label.
    UILabel *headlinelabel                      = [[UILabel alloc]initWithFrame:CGRectMake(12, 30, 100, 20)];
    headlinelabel.font                          = [UIFont AvenirLightWithFontSize:17.f];
    headlinelabel.textAlignment                 = NSTextAlignmentLeft;
    headlinelabel.textColor                     = [UIColor colorWithRed:0.329  green:0.329  blue:0.329 alpha:1];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"Animations"];
    headlinelabel.attributedText                = attributedString;
    [headlinelabel sizeToFit];
    
    return headlinelabel;
}

+ (UILabel *)animationsListViewControllerHeadLabel {
    
    // Title label.
    UILabel *headlinelabel                      = [[UILabel alloc]initWithFrame:CGRectMake(12, 30, 100, 20)];
    headlinelabel.font                          = [UIFont AvenirLightWithFontSize:17.f];
    headlinelabel.textAlignment                 = NSTextAlignmentLeft;
    NSString *showString                        = @"Animations";
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:showString];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor clearColor] range:NSMakeRange(0, showString.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0.203  green:0.598  blue:0.859 alpha:1]
                             range:NSMakeRange(0, 1)];
    
    headlinelabel.attributedText                = attributedString;
    [headlinelabel sizeToFit];
    
    return headlinelabel;
}



+ (UILabel *)animationsListViewControllerNormalHeadLabel2 {
    
    // Title label.
    UILabel *headlinelabel                      = [[UILabel alloc]initWithFrame:CGRectMake(Width-70, 30, 70, 20)];

    headlinelabel.font                          = [UIFont AvenirLightWithFontSize:18.f];
    headlinelabel.textAlignment                 = NSTextAlignmentRight;
    headlinelabel.textColor                     = [UIColor colorWithRed:0.329  green:0.329  blue:0.329 alpha:1];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"Charts"];
    headlinelabel.attributedText                = attributedString;
    [headlinelabel sizeToFit];
    
    return headlinelabel;
}

+ (UILabel *)animationsListViewControllerHeadLabel2 {
    
    // Title label.
    UILabel *headlinelabel                      =  [[UILabel alloc]initWithFrame:CGRectMake(Width-70, 30, 70, 20)];
   
    headlinelabel.font                          = [UIFont AvenirLightWithFontSize:18.f];
    headlinelabel.textAlignment                 = NSTextAlignmentRight;
    NSString *showString                        = @"Charts";
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:showString];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor clearColor] range:NSMakeRange(0, showString.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0.203  green:0.598  blue:0.859 alpha:1]
                             range:NSMakeRange(0, 1)];
    
    headlinelabel.attributedText                = attributedString;
    [headlinelabel sizeToFit];
    
    return headlinelabel;
}

@end
