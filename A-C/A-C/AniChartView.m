//
//  AniChartView.m
//  指纹开发
//
//  Created by puyang on 2016/12/8.
//  Copyright © 2016年 puyang. All rights reserved.
//

#import "AniChartView.h"
//#import "POP.h"
@interface AniChartView ()

@property (nonatomic, strong) NSMutableArray  *shapeLayerArray;  // 存储每条柱

@end

@implementation AniChartView

// 初始化
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.shapeLayerArray  = [NSMutableArray array];
 
        
    }
    return self;
}



# pragma mark 公有方法
// 显示柱状图
- (void)showBarChart{

    
    if (self.dataArray == nil || self.dataArray.count==0){
    
        return;
    
    }
    

    
    // 计算柱条的宽度
    CGFloat barWith;
    if (self.barSpacing > 0) {
        
        barWith = (self.frame.size.width-(int)self.barSpacing*(self.dataArray.count+1))/self.dataArray.count;
    }else{
    
        barWith = self.frame.size.width/self.dataArray.count;
    
    }
    
    
    for (int i = 0; i< self.dataArray.count; i++) {
        
        // 4.1计算每根柱子的x值
        
        CGFloat barX = i * barWith +(int)self.barSpacing*(i+1);
        
        // 4.2计算每根柱子的高度
        
        CGFloat barH = ([self.dataArray[i]floatValue] /100.0) * self.frame.size.height;
        
        // 4.3计算每根柱子的y值
        
        CGFloat barY = self.frame.size.height- barH;
        
        // 4.4创建柱状型的柱子
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(barX, barY, barWith,barH)];

        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = self.bounds;
        [self.layer addSublayer:shapeLayer];
        shapeLayer.path = path.CGPath;
        shapeLayer.fillColor = self.barColor.CGColor;
        
        [self.shapeLayerArray addObject:shapeLayer];
        
        
        
    }
    self.transform = CGAffineTransformMakeScale(1, 0);
    
    
    [UIView animateWithDuration:0.3 animations:^{
        self.transform = CGAffineTransformMakeScale(1, 1);
//        self.transform =  CGAffineTransformMakeTranslation(0, self.frame.size.height);
    }];
    
    _finishedLoading = YES;
    

    [self refreshBarChart];
}

// 刷新柱状图
- (void)refreshBarChart{


    

}


//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//}


@end
