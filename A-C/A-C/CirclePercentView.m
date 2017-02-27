//
//  CirclePercentView.m
//  ZiPeiYi
//
//  Created by YouXianMing on 16/1/4.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#import "CirclePercentView.h"
#import "CircleView.h"

// 将度数转换为弧度
#define   RADIAN(degrees)  ((M_PI * (degrees))/ 180.f)

// 将弧度转换为度数
#define   DEGREES(radian)  ((radian) * 180.f / M_PI)

typedef enum : NSUInteger {
    
    kCircleViewFlag = 1000,
    
} ECirclePercentViewValue;

@interface CirclePercentView ()

/**
 *  默认的旋转值
 */
@property (nonatomic, assign) CGAffineTransform  defaultTransform;

/**
 *  是否构建过了
 */
@property (nonatomic)         BOOL               haveBuild;

@end

@implementation CirclePercentView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        // 存储默认的旋转值
        self.defaultTransform = self.transform;
    }
    
    return self;
}

- (void)roateAngle:(CGFloat)angle duration:(CGFloat)duration animated:(BOOL)animated {
    
    if (animated) {
        
        [UIView animateWithDuration:duration animations:^{
            
            self.transform = CGAffineTransformRotate(_defaultTransform, RADIAN(angle));
        }];
        
    } else {
    
        self.transform = CGAffineTransformRotate(_defaultTransform, RADIAN(angle));
    }
}

- (void)buildView {

    if (self.percentArray == nil) {
        
        return;
    }
    
    for (NSInteger i = self.percentArray.count-1; i >=0; i--) {
        
        CircleView *circleView = [[CircleView alloc] initWithFrame:self.bounds];
        circleView.lineWidth   = self.lineWidth;
        circleView.lineColor   = self.colorsArray[i];
        circleView.startAngle  = 90;
        circleView.clockWise   = YES;
        circleView.tag         = kCircleViewFlag + i;
        [circleView buildView];
        [self addSubview:circleView];
    }
    
    _haveBuild = YES;
}

- (BOOL)haveBuildSubView {

    return _haveBuild;
}

- (void)showAnimated:(BOOL)animated {

    if (self.percentArray == nil) {
        
        return;
    }
    
    // 数据构造圆环百分比梯度（百分比转换为90度点到终点的梯度）
    NSMutableArray *dataArray = [NSMutableArray array];
    CGFloat value = 0;
    for (int i = 0; i < self.percentArray.count; i++) {
        
        NSString *tempData = self.percentArray[i];
        value             += tempData.doubleValue;
        [dataArray addObject:[NSNumber numberWithFloat:value]];
    }

    
    
    
    for (NSInteger i = self.percentArray.count-1; i >=0; i--) {
        
        NSNumber *value          = dataArray[i];
        
        CircleView *circleView = [self viewWithTag:kCircleViewFlag + i];
        
        [circleView strokeEnd:value.doubleValue animated:animated duration:1.75f];
//        [self roateAngle:self.roateAngle duration:1.75f animated:animated];
    }
    
}

@end
