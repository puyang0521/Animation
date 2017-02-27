//
//  FlowLightLabelController.m
//  A-C
//
//  Created by puyang on 2017/2/8.
//  Copyright © 2017年 puyang. All rights reserved.
//

#import "FlowLightLabelController.h"

#import "FBShimmeringLayer.h"
#import "FBShimmeringView.h"
#import "StrokeCircleLayerConfigure.h"

#import "UIFont+Fonts.h"
#import "UIView+SetRect.h"

@interface FlowLightLabelController ()

@end

@implementation FlowLightLabelController

- (void)setup {
    
    [super setup];
    
    self.contentView.backgroundColor = [UIColor blackColor];
    
    {
    
    
        // Title label.
        UILabel *headlinelabel      = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, Width, 30)];
        headlinelabel.font          = [UIFont HeitiSCWithFontSize:20.f];
        headlinelabel.textAlignment = NSTextAlignmentCenter;
        headlinelabel.textColor     = [UIColor cyanColor];
        headlinelabel.text          = @"闪亮文字";
        [headlinelabel sizeToFit];
        
        
        
        FBShimmeringView *shimmeringView           = [[FBShimmeringView alloc] initWithFrame:CGRectMake(0, 20, Width, 30)];
        shimmeringView.shimmering                  = YES;
        shimmeringView.shimmeringBeginFadeDuration = 0.3;
        shimmeringView.shimmeringOpacity           = 0.3f;
        shimmeringView.shimmeringAnimationOpacity  = 1.f;
        [self.contentView addSubview:shimmeringView];
        
        shimmeringView.contentView = headlinelabel;
    
    
    
    }
    
    
    
    
    
    
    {
        FBShimmeringView *shimmeringView           = [[FBShimmeringView alloc] initWithFrame:self.contentView.bounds];
        shimmeringView.shimmering                  = YES;
        shimmeringView.shimmeringBeginFadeDuration = 0.3;
        shimmeringView.shimmeringOpacity           = 0.3;
        [self.contentView addSubview:shimmeringView];
        
        UILabel *logoLabel         = [[UILabel alloc] initWithFrame:shimmeringView.bounds];
        logoLabel.text             = @"Shimmer";
        logoLabel.font             = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:60.0];
        logoLabel.textColor        = [UIColor whiteColor];
        logoLabel.textAlignment    = NSTextAlignmentCenter;
        logoLabel.backgroundColor  = [UIColor clearColor];
        shimmeringView.contentView = logoLabel;
    }
    
    {
        FBShimmeringLayer *shimmeringLayer          = [FBShimmeringLayer layer];
        shimmeringLayer.frame                       = (CGRect){CGPointZero, CGSizeMake((130 + 1) * 2, (130 + 1) * 2)};
        shimmeringLayer.position                    = CGPointMake(Width/2, self.contentView.height/2-5);
        shimmeringLayer.shimmering                  = YES;
        shimmeringLayer.shimmeringBeginFadeDuration = 0.3;
        shimmeringLayer.shimmeringOpacity           = 0.3;
        shimmeringLayer.shimmeringPauseDuration     = 0.6f;
        [self.contentView.layer addSublayer:shimmeringLayer];
        
        CAShapeLayer *circleShape          = [CAShapeLayer layer];
        StrokeCircleLayerConfigure *config = [StrokeCircleLayerConfigure new];
        config.lineWidth                   = 1.f;
        config.startAngle                  = 0;
        config.endAngle                    = M_PI * 2;
        config.radius                      = 130.f;
        config.strokeColor                 = [UIColor redColor];
        [config configCAShapeLayer:circleShape];
        
        shimmeringLayer.contentLayer = circleShape;
    }

    
}




@end
