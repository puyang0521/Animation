//
//  AlertView.m
//  A-C
//
//  Created by puyang on 2017/2/13.
//  Copyright © 2017年 puyang. All rights reserved.
//

#import "AlertView.h"
#import "GCD.h"
#import "Header.h"
#import "UIFont+Fonts.h"
#import "UIView+SetRect.h"
#import "POP.h"
#import "NSString+HexColors.h"

@implementation AlertView




+ (void)showAlertView:(UIView*)onView withText:(NSString*)message during:(NSTimeInterval)delayTime{

    
    UIView *blackView         = [[UIView alloc] initWithFrame:onView.bounds];
    blackView.backgroundColor = [UIColor blackColor];
    blackView.alpha           = 0;
    [onView addSubview:blackView];
    
    [UIView animateWithDuration:0.3f animations:^{
        
        blackView.alpha = 0.25f;
    }];

    
    // 创建信息label
    UILabel *textLabel      = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 170, 0)];
    textLabel.text          = message;
    textLabel.font          = [UIFont HeitiSCWithFontSize:15.f];
    textLabel.textColor     = [UIColor whiteColor];
    textLabel.textAlignment = NSTextAlignmentLeft;
    textLabel.numberOfLines = 0;
    [textLabel sizeToFit];
    
    // 创建信息窗体view
    UIView *messageView            = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 190, textLabel.height + 20)];
    messageView.backgroundColor    = [[UIColor blackColor] colorWithAlphaComponent:0.55f];
    messageView.center             = onView.middlePoint;
    textLabel.center               = messageView.middlePoint;
    messageView.alpha              = 0.f;
    messageView.layer.cornerRadius = 10;
    messageView.clipsToBounds      = YES;
    [messageView addSubview:textLabel];
    [onView addSubview:messageView];
    

    
    
    // 执行动画
    POPBasicAnimation  *alpha = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    alpha.toValue             = @(1.f);
    alpha.duration            = 0.3f;
    [messageView pop_addAnimation:alpha forKey:nil];
    
    POPSpringAnimation *scale = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scale.fromValue           = [NSValue valueWithCGSize:CGSizeMake(1.75f, 1.75f)];
    scale.toValue             = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
    scale.dynamicsTension     = 1000;
    scale.dynamicsMass        = 1.3;
    scale.dynamicsFriction    = 10.3;
    scale.springSpeed         = 20;
    scale.springBounciness    = 15.64;
//    scale.delegate            = self;
    [messageView.layer pop_addAnimation:scale forKey:nil];
    
    
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayTime * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        [UIView animateWithDuration:0.2f animations:^{
            
            blackView.alpha       = 0.f;
            messageView.alpha     = 0.f;
            messageView.transform = CGAffineTransformMakeScale(0.75f, 0.75f);
            
        } completion:^(BOOL finished) {
            
            [blackView removeFromSuperview];
            [messageView removeFromSuperview];
            
        }];

    
    });
    
    

}


+ (void)showAlertView:(UIView*)onView withLeftText:(NSString*) message during:(NSTimeInterval)delayTime{


    UIView *blackView         = [[UIView alloc] initWithFrame:onView.bounds];
    blackView.backgroundColor = [UIColor blackColor];
    blackView.alpha           = 0;
    [onView addSubview:blackView];
    
    [UIView animateWithDuration:0.3f animations:^{
        
        blackView.alpha = 0.25f;
    }];
    
    
    // 创建信息label
    UILabel *textLabel      = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 170, 0)];
    textLabel.text          = message;
    textLabel.font          = [UIFont HeitiSCWithFontSize:15.f];
    textLabel.textColor     = [UIColor whiteColor];
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.numberOfLines = 0;
    [textLabel sizeToFit];
    
    // 创建信息窗体view
    UIView *messageView            = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 190, textLabel.height + 20)];
    messageView.backgroundColor    = [[UIColor blackColor] colorWithAlphaComponent:0.55f];
    messageView.center             = onView.middlePoint;
    textLabel.center               = messageView.middlePoint;
    messageView.alpha              = 0.f;
    messageView.layer.cornerRadius = 10;
    messageView.clipsToBounds      = YES;
    [messageView addSubview:textLabel];
    [onView addSubview:messageView];
    
    
    
    
    // 执行动画
    POPBasicAnimation  *alpha = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    alpha.toValue             = @(1.f);
    alpha.duration            = 0.3f;
    [messageView pop_addAnimation:alpha forKey:nil];
    
    POPSpringAnimation *scale = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scale.fromValue           = [NSValue valueWithCGSize:CGSizeMake(1.75f, 1.75f)];
    scale.toValue             = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
    scale.dynamicsTension     = 1000;
    scale.dynamicsMass        = 1.3;
    scale.dynamicsFriction    = 10.3;
    scale.springSpeed         = 20;
    scale.springBounciness    = 15.64;
    //    scale.delegate            = self;
    [messageView.layer pop_addAnimation:scale forKey:nil];
    
    
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayTime * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        [UIView animateWithDuration:0.2f animations:^{
            
            blackView.alpha       = 0.f;
            messageView.alpha     = 0.f;
            messageView.transform = CGAffineTransformMakeScale(0.75f, 0.75f);
            
        } completion:^(BOOL finished) {
            
            [blackView removeFromSuperview];
            [messageView removeFromSuperview];
            
        }];
        
        
    });




}

@end
