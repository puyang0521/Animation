//
//  BrokenLineController.m
//  A-C
//
//  Created by puyang on 2017/2/9.
//  Copyright © 2017年 puyang. All rights reserved.
//

#import "BrokenLineController.h"
#import "DrawLine.h"

#import "GCD.h"
#import "UIView+SetRect.h"
#import "WxHxD.h"
#import "UIFont+Fonts.h"
#import "NSString+HexColors.h"

@interface BrokenLineController ()

@property (nonatomic, strong) NSArray *dataArray;      // 折线拐点数据

@property (nonatomic, strong) NSArray *dataArray2;     // 第二条折线


@end

@implementation BrokenLineController

- (void)setup {
    
    [super setup];
    
    
    self.dataArray      = [NSArray arrayWithObjects:@"0.3",@"1.2",@"0.7",@"1.8",@"2.2",@"1.8",@"1.5", nil];
    self.dataArray2      = [NSArray arrayWithObjects:@"0.8",@"1.5",@"1.0",@"1.6",@"2.0",@"1.5",@"1.8", nil];
    
    
    
    [self addTitleViewBtn];
    
    [self straightLineChart];
    
    
    
}



// 单条直线
- (void)straightLineChart{
    
    
    // 1.【坐标系底图】
    UIView *chartView = [[UIView alloc]initWithFrame:CGRectMake(10, 40, self.view.frame.size.width-20, 200)];
    chartView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:chartView];
    
    
    
    
    // 添加竖实线(7根)
    CGFloat weightBit = (chartView.frame.size.width) /6 ;
    for (int i = 0; i<=8; i++) {
        
        [DrawLine drawSolidLine:chartView xValue:weightBit*i lineLength:2  lineColor:[UIColor lightGrayColor]];
        
    }
    
    
    
    
    // 添加横虚线(5根)
    CGFloat heightBit = (chartView.frame.size.height) /5 ;
    for (int i = 0; i<=5; i++) {
        
        [DrawLine drawDashLine:chartView yValue:heightBit*i lineLength:2 lineSpacing:1 lineColor:[UIColor darkGrayColor]];
        
    }
    
    // 文字角标
    NSArray *textArray = [NSArray arrayWithObjects:@"2.5",@"2.0",@"1.5",@"1.0",@"0.5",@"0", nil];
    for (int i = 0; i<textArray.count; i++) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(2, heightBit*i, 100, 15)];
        [chartView addSubview:label];
        label.text = textArray[i];
        label.textColor = [UIColor lightGrayColor];
        label.textAlignment = NSTextAlignmentLeft;
        label.font          = [UIFont fontWithName:@"HelveticaNeue-Thin" size:12];
    }
    
    
    
    
    
    
    // 2.【直线图】
    
    UIView *lineView = [[UIView alloc]initWithFrame:chartView.bounds];
    [chartView addSubview:lineView];
    
    // 2.1创建直线路径
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    linePath.lineWidth     = 2;
    // 2.2创建渐变色遮罩路径
    UIBezierPath *maskPath = [UIBezierPath bezierPath];
    maskPath.lineWidth     = 1;
    // 起点为坐标左下角顶点
    [maskPath moveToPoint:CGPointMake(0, lineView.frame.size.height)];
    
    
    // 存储拐点位置
    NSMutableArray *pointArray = [NSMutableArray array];
    
    for (int i = 0; i<self.dataArray.count; i++) {
        
        // x值固定为，竖线间隔
        CGPoint point;
        
        point.x= weightBit*i;
        
        CGFloat pointHeight = ([self.dataArray[i]floatValue]/2.5) * chartView.frame.size.height;
        point.y = chartView.frame.size.height -pointHeight;
        
        // 2.3添加折线路径
        if (i == 0){
            // 起点
            [linePath moveToPoint:point];
            
        }else{
            [linePath addLineToPoint:point];
            
        }
        
        // 2.4添加渐变遮罩路径
        [maskPath addLineToPoint:point];
        
        // 存储拐点位置
        [pointArray addObject:NSStringFromCGPoint(point)];
        
        
    }
    
    // 2.5遮罩终点右下角顶点
    [maskPath addLineToPoint:CGPointMake(lineView.frame.size.width, lineView.frame.size.height)];
    // 闭合到初始点路径
    [maskPath closePath];
    
    
    
    // 2.6将折线走势路径赋shapeLayer
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame         = lineView.frame;
    shapeLayer.fillColor     = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor   = [UIColor blueColor].CGColor;
    shapeLayer.path          = linePath.CGPath;
    shapeLayer.lineJoin      = kCALineJoinRound;
    shapeLayer.lineCap       = kCALineCapRound;
    shapeLayer.opacity       = 0.6;  // 透明度
    
    
    // 2.7添加渐变色图层
    CAGradientLayer * gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = lineView.frame;
    gradientLayer.colors = [NSArray arrayWithObjects:(id)[[UIColor blueColor] CGColor], (id)[[UIColor whiteColor] CGColor] ,nil];
    gradientLayer.locations =  @[@(0), @(1)];
    // 从上往下渐变
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
    
    
    // 渐变图层遮罩层】
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame         = lineView.bounds;
    maskLayer.path          = maskPath.CGPath;  // 【将上面遮罩路径赋给遮罩图层
    
    gradientLayer.mask      = maskLayer;
    gradientLayer.opacity   = 0;  // 后期添加透明度动画变为0.3
    
    
    // 添加动画【折线链接动画】
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = 1;
    //    animation.delegate=self;
    [shapeLayer addAnimation:animation forKey:@"pathStroke"];
    
    // 遮罩层透明度动画
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = [NSNumber numberWithFloat:0];
    opacityAnimation.toValue = [NSNumber numberWithFloat:0.3];
    opacityAnimation.duration = 0.5;
    opacityAnimation.beginTime = CACurrentMediaTime()+1; // 延时1秒执行
    opacityAnimation.removedOnCompletion = NO;          //动画结束了禁止删除
    opacityAnimation.fillMode = kCAFillModeForwards;  //停在动画结束处
    [gradientLayer addAnimation:opacityAnimation forKey:nil];
    
    // 注意遮罩层和路径层先后添加顺序
    [lineView.layer addSublayer:gradientLayer];
    [lineView.layer addSublayer:shapeLayer];
    
    
    
    
    //    NSMutableArray * array  = [[NSMutableArray alloc] initWithObjects:NSStringFromCGPoint(itemSprite1position),nil];
    //
    //
    //    从数组中取值的过程是这样的：
    //    复制代码
    //    CGPoint point=CGPointFromNSString（[array objectAtIndex:0]）；
    
    
    
    // 展示双折线图
    [self doubleLineChart];
    
}



// 双折线图
- (void)doubleLineChart{

    // 1.【坐标系底图】
    UIView *chartView = [[UIView alloc]initWithFrame:CGRectMake(10, self.contentView.height/2, self.view.frame.size.width-20, 200)];
    chartView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:chartView];
    
    
    
    
    // 添加竖实线(7根)
    CGFloat weightBit = (chartView.frame.size.width) /6 ;
    for (int i = 0; i<=8; i++) {
        
        [DrawLine drawSolidLine:chartView xValue:weightBit*i lineLength:2  lineColor:[UIColor lightGrayColor]];
        
    }
    
    
    
    
    // 添加横虚线(5根)
    CGFloat heightBit = (chartView.frame.size.height) /5 ;
    for (int i = 0; i<=5; i++) {
        
        [DrawLine drawDashLine:chartView yValue:heightBit*i lineLength:2 lineSpacing:1 lineColor:[UIColor darkGrayColor]];
        
    }
    
    // 文字角标
    NSArray *textArray = [NSArray arrayWithObjects:@"2.5",@"2.0",@"1.5",@"1.0",@"0.5",@"0", nil];
    for (int i = 0; i<textArray.count; i++) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(2, heightBit*i, 100, 15)];
        [chartView addSubview:label];
        label.text = textArray[i];
        label.textColor = [UIColor lightGrayColor];
        label.textAlignment = NSTextAlignmentLeft;
        label.font          = [UIFont fontWithName:@"HelveticaNeue-Thin" size:12];
    }
    
    
    
    
    
    
    // 2.【直线图】
    
    UIView *lineView = [[UIView alloc]initWithFrame:chartView.bounds];
    [chartView addSubview:lineView];
    
             /* *******  第一条折线  *********/
    
    
    {
    
    // 2.1创建直线路径
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    linePath.lineWidth     = 2;
    // 2.2创建渐变色遮罩路径
    UIBezierPath *maskPath = [UIBezierPath bezierPath];
    maskPath.lineWidth     = 1;
    // 起点为坐标左下角顶点
    [maskPath moveToPoint:CGPointMake(0, lineView.frame.size.height)];
    
    
    // 存储拐点位置
    NSMutableArray *pointArray = [NSMutableArray array];
    
    for (int i = 0; i<self.dataArray.count; i++) {
        
        // x值固定为，竖线间隔
        CGPoint point;
        
        point.x= weightBit*i;
        
        CGFloat pointHeight = ([self.dataArray[i]floatValue]/2.5) * chartView.frame.size.height;
        point.y = chartView.frame.size.height -pointHeight;
        
        // 2.3添加折线路径
        if (i == 0){
            // 起点
            [linePath moveToPoint:point];
            
        }else{
            [linePath addLineToPoint:point];
            
        }
        
        // 2.4添加渐变遮罩路径
        [maskPath addLineToPoint:point];
        
        // 存储拐点位置
        [pointArray addObject:NSStringFromCGPoint(point)];
        
        
    }
    
    // 2.5遮罩终点右下角顶点
    [maskPath addLineToPoint:CGPointMake(lineView.frame.size.width, lineView.frame.size.height)];
    // 闭合到初始点路径
    [maskPath closePath];
    
    
    
    // 2.6将折线走势路径赋shapeLayer
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame         = lineView.frame;
    shapeLayer.fillColor     = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor   = [UIColor greenColor].CGColor;
    shapeLayer.path          = linePath.CGPath;
    shapeLayer.lineJoin      = kCALineJoinRound;
    shapeLayer.lineCap       = kCALineCapRound;
    shapeLayer.opacity       = 0.6;  // 透明度
    
    
    // 2.7添加渐变色图层
    CAGradientLayer * gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = lineView.frame;
    gradientLayer.colors = [NSArray arrayWithObjects:(id)[[UIColor greenColor] CGColor], (id)[[UIColor whiteColor] CGColor] ,nil];
    gradientLayer.locations =  @[@(0), @(1)];
    // 从上往下渐变
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
    
    
    // 渐变图层遮罩层】
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame         = lineView.bounds;
    maskLayer.path          = maskPath.CGPath;  // 【将上面遮罩路径赋给遮罩图层
    
    gradientLayer.mask      = maskLayer;
    gradientLayer.opacity   = 0;  // 后期添加透明度动画变为0.3
    
    
    // 添加动画【折线链接动画】
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = 1;
    //    animation.delegate=self;
    [shapeLayer addAnimation:animation forKey:@"pathStroke"];
    
    // 遮罩层透明度动画
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = [NSNumber numberWithFloat:0];
    opacityAnimation.toValue = [NSNumber numberWithFloat:0.3];
    opacityAnimation.duration = 0.5;
    opacityAnimation.beginTime = CACurrentMediaTime()+1; // 延时1秒执行
    opacityAnimation.removedOnCompletion = NO;          //动画结束了禁止删除
    opacityAnimation.fillMode = kCAFillModeForwards;  //停在动画结束处
    [gradientLayer addAnimation:opacityAnimation forKey:nil];
    
    // 注意遮罩层和路径层先后添加顺序
    [lineView.layer addSublayer:gradientLayer];
    [lineView.layer addSublayer:shapeLayer];
    
    
  }
    
    
    
    
     /* *******  第二条折线  *********/
    {
    
        // 2.1创建直线路径
        UIBezierPath *linePath = [UIBezierPath bezierPath];
        linePath.lineWidth     = 2;
        // 2.2创建渐变色遮罩路径
        UIBezierPath *maskPath = [UIBezierPath bezierPath];
        maskPath.lineWidth     = 1;
        // 起点为坐标左下角顶点
        [maskPath moveToPoint:CGPointMake(0, lineView.frame.size.height)];
        
        
        // 存储拐点位置
        NSMutableArray *pointArray = [NSMutableArray array];
        
        for (int i = 0; i<self.dataArray2.count; i++) {
            
            // x值固定为，竖线间隔
            CGPoint point;
            
            point.x= weightBit*i;
            
            CGFloat pointHeight = ([self.dataArray2[i]floatValue]/2.5) * chartView.frame.size.height;
            point.y = chartView.frame.size.height -pointHeight;
            
            // 2.3添加折线路径
            if (i == 0){
                // 起点
                [linePath moveToPoint:point];
                
            }else{
                [linePath addLineToPoint:point];
                
            }
            
            // 2.4添加渐变遮罩路径
            [maskPath addLineToPoint:point];
            
            // 存储拐点位置
            [pointArray addObject:NSStringFromCGPoint(point)];
            
            
        }
        
        // 2.5遮罩终点右下角顶点
        [maskPath addLineToPoint:CGPointMake(lineView.frame.size.width, lineView.frame.size.height)];
        // 闭合到初始点路径
        [maskPath closePath];
        
        
        
        // 2.6将折线走势路径赋shapeLayer
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame         = lineView.frame;
        shapeLayer.fillColor     = [UIColor clearColor].CGColor;
        shapeLayer.strokeColor   = [UIColor redColor].CGColor;
        shapeLayer.path          = linePath.CGPath;
        shapeLayer.lineJoin      = kCALineJoinRound;
        shapeLayer.lineCap       = kCALineCapRound;
        shapeLayer.opacity       = 0.6;  // 透明度
        
        
        // 2.7添加渐变色图层
        CAGradientLayer * gradientLayer = [CAGradientLayer layer];
        gradientLayer.frame = lineView.frame;
        gradientLayer.colors = [NSArray arrayWithObjects:(id)[[UIColor redColor] CGColor], (id)[[UIColor whiteColor] CGColor] ,nil];
        gradientLayer.locations =  @[@(0), @(1)];
        // 从上往下渐变
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(0, 1);
        
        
        // 渐变图层遮罩层】
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame         = lineView.bounds;
        maskLayer.path          = maskPath.CGPath;  // 【将上面遮罩路径赋给遮罩图层
        
        gradientLayer.mask      = maskLayer;
        gradientLayer.opacity   = 0;  // 后期添加透明度动画变为0.3
        
        
        // 添加动画【折线链接动画】
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        animation.fromValue = @0;
        animation.toValue = @1;
        animation.duration = 1;
        //    animation.delegate=self;
        [shapeLayer addAnimation:animation forKey:@"pathStroke"];
        
        // 遮罩层透明度动画
        CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
        opacityAnimation.fromValue = [NSNumber numberWithFloat:0];
        opacityAnimation.toValue = [NSNumber numberWithFloat:0.3];
        opacityAnimation.duration = 0.5;
        opacityAnimation.beginTime = CACurrentMediaTime()+1; // 延时1秒执行
        opacityAnimation.removedOnCompletion = NO;          //动画结束了禁止删除
        opacityAnimation.fillMode = kCAFillModeForwards;  //停在动画结束处
        [gradientLayer addAnimation:opacityAnimation forKey:nil];
        
        // 注意遮罩层和路径层先后添加顺序
        [lineView.layer addSublayer:gradientLayer];
        [lineView.layer addSublayer:shapeLayer];
    
    
    
    }
    
    


}






// 添加【重现】按钮
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
    [button addTarget:self action:@selector(straightLineChart) forControlEvents:UIControlEventTouchUpInside];
    [self.titleView addSubview:button];
    
}





@end
