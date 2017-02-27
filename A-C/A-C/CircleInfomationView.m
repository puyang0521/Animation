//
//  CircleInfomationView.m
//  ZiPeiYi
//
//  Created by YouXianMing on 16/1/4.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#import "CircleInfomationView.h"
#import "Header.h"
#import "CircleBarView.h"
#import "UIView+SetRect.h"
#import "GCD.h"

typedef enum : NSUInteger {
    
    kCircleBarViewFlag = 1000,
    
} ECircleInfomationViewValue;

@interface CircleInfomationView ()

@property (nonatomic) BOOL  haveBuild;

@end

@implementation CircleInfomationView

- (void)buildView {
    
    if (self.percentArray == nil) {
        
        return;
    }
    
    for (NSInteger i = 0; i < self.percentArray.count; i++) {
        
        CircleBarView *circleBarView         = [[CircleBarView alloc] initWithFrame:CGRectMake(0, 0, self.width, 12.f *ScreenHeightRate)];
        circleBarView.color                  = self.colorsArray[i];
        circleBarView.name                   = self.nameArray[i];
        circleBarView.tag                    = kCircleBarViewFlag + i;
        [circleBarView buildViewWithType:kNormalType];
        [self addSubview:circleBarView];
        
        CGPoint p =[self centerPointWithPointNumber:self.percentArray.count
                                     centerPointGap:20.f*ScreenHeightRate
                                              index:i];

        circleBarView.center =p ;

    }
    
    _haveBuild = YES;
}

- (CGPoint)centerPointWithPointNumber:(NSInteger)number centerPointGap:(CGFloat)gap index:(NSInteger)index {
    
    CGFloat firstValue = self.height / 2.f - (number - 1) / 2.f * gap;
    return CGPointMake(self.width / 2.f, firstValue + gap * index);
}

- (BOOL)haveBuildSubView {
    
    return _haveBuild;
}

- (void)showAnimated:(BOOL)animated {
    
    if (self.percentArray == nil) {
        
        return;
    }
    
    if (animated) {
        
        for (NSInteger i = 0; i < self.percentArray.count; i++) {
            
            CircleBarView *circleBarView = [self viewWithTag:kCircleBarViewFlag + i];
            
            [GCDQueue executeInMainQueue:^{
                
                [circleBarView showAnimated:animated type:kNormalType];
                
            } afterDelaySecs:i * 0.20f];
        }
        
    } else {
        
        for (NSInteger i = 0; i < self.percentArray.count; i++) {
            
            CircleBarView *circleBarView = [self viewWithTag:kCircleBarViewFlag + i];
            [circleBarView showAnimated:animated type:kNormalType];
        }
    }
}

@end
