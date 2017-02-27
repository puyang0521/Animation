//
//  CurveLineController.m
//  A-C
//
//  Created by puyang on 2017/2/9.
//  Copyright © 2017年 puyang. All rights reserved.
//

#import "CurveLineController.h"

#import "DrawLine.h"
#import "UIBezierPath+curved.h"


#import "UIView+SetRect.h"
#import "WxHxD.h"
#import "UIFont+Fonts.h"
#import "NSString+HexColors.h"


@interface CurveLineController ()

@property (nonatomic, strong) NSArray *dataArrayCurve;  // 曲线拐点的数据

@end

@implementation CurveLineController

- (void)setup{

    [super setup];
    
    
    [self addTitleViewBtn];
    
    
    self.dataArrayCurve = [NSArray arrayWithObjects:@"0.3",@"0.2",@"0.7",@"1.1",@"1.2",@"1.9",@"1.5",@"0.3",@"1.2",@"0.5",@"1.1",@"2.2",@"1.4",@"1.5",@"0.3",@"1.2",@"0.7",@"0.8",@"0.2",@"1.5",@"1.5",@"1.3",@"1.2",@"1.2",@"1.8",@"2.4",@"1.8",@"1.5",@"2.3",@"1.2",@"0.7",@"1.4",@"2.2",@"1.8",@"1.1", nil];
    
    
    
    
    [self curveLineChart];
    




}


// 曲线
- (void)curveLineChart{
    
    // 1.【坐标系底图】
    UIView *chartView = [[UIView alloc]initWithFrame:CGRectMake(10, 150, self.view.frame.size.width-20, 200)];
    chartView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:chartView];
    
    
    
    
    //    // 添加竖实线(7根)
    //    CGFloat weightBit = (chartView.frame.size.width) /6 ;
    //    for (int i = 0; i<=8; i++) {
    //
    //        [self drawSolidLine:chartView xValue:weightBit*i lineLength:2  lineColor:[UIColor lightGrayColor]];
    //
    //    }
    
    
    
    
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
    
    
    
    
    
    
    // 2.【曲线线图】
    
    UIView *lineView = [[UIView alloc]initWithFrame:chartView.bounds];
    [chartView addSubview:lineView];
    
    // 2.1创建直线路径
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    linePath.lineWidth     = 2;
    // 2.2创建渐变色遮罩路径
    UIBezierPath *maskPath = [UIBezierPath bezierPath];
    maskPath.lineWidth     = 2;
    // 起点为坐标左下角顶点
    [maskPath moveToPoint:CGPointMake(0, lineView.frame.size.height)];
    
    
    // 存储拐点位置
    NSMutableArray *pointArray = [NSMutableArray array];
    
    CGFloat weightBit = (chartView.frame.size.width) /(self.dataArrayCurve.count-1);
    for (int i = 0; i<self.dataArrayCurve.count; i++) {
        
        // x值固定为，竖线间隔
        CGPoint point;
        
        point.x= weightBit*i;
        
        CGFloat pointHeight = ([self.dataArrayCurve[i]floatValue]/2.5) * chartView.frame.size.height;
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
    // 添加曲线圆角
    linePath = [linePath smoothedPathWithGranularity:10];
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
    shapeLayer.opacity       = 0.5;  // 透明度
    
    
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
    
    gradientLayer.mask     = maskLayer;
    
    
    //     添加动画【折线链接动画】
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = 2;
    //    animation.delegate=self;
    [shapeLayer addAnimation:animation forKey:@"pathStroke"];
    
    
    [lineView.layer addSublayer:shapeLayer];
    //    [lineView.layer addSublayer:gradientLayer];
    
    
    
    //    NSMutableArray * array  = [[NSMutableArray alloc] initWithObjects:NSStringFromCGPoint(itemSprite1position),nil];
    //
    //
    //    从数组中取值的过程是这样的：
    //    复制代码
    //    CGPoint point=CGPointFromNSString（[array o
    
    
    
    
    
    
    
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
    [button addTarget:self action:@selector(curveLineChart) forControlEvents:UIControlEventTouchUpInside];
    [self.titleView addSubview:button];
    
}

@end
