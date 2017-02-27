//
//  DrawLine.m
//  A-C
//
//  Created by puyang on 2017/2/9.
//  Copyright © 2017年 puyang. All rights reserved.
//

#import "DrawLine.h"

@implementation DrawLine



#pragma mark -- 虚线方法
/** 竖直方向虚线
 *  lineView:       需要绘制成虚线线的view
 *  lineLength:     虚线的宽度
 *  lineSpacing:    虚线的间距
 *  lineColor:      虚线的颜色
 **/
+ (void)drawDashLine:(UIView *)lineView xValue:(CGFloat)x lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = lineView.bounds;
    
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线高度
    [shapeLayer setLineWidth:0.5];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    //  虚线起点
    CGPathMoveToPoint(path, NULL, x, 0);
    //  虚线总长度（终点）
    CGPathAddLineToPoint(path, NULL,x, CGRectGetHeight(lineView.frame));
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}



/** 水平方向虚线
 *  lineView:       需要绘制成虚线的view
 *  lineLength:     虚线的宽度
 *  lineSpacing:    虚线的间距
 *  lineColor:      虚线的颜色
 **/
+ (void)drawDashLine:(UIView *)lineView yValue:(CGFloat)y lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = lineView.bounds;
    //    [shapeLayer setBounds:lineView.bounds];
    //    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线高度
    [shapeLayer setLineWidth:0.5];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    //  虚线起点
    CGPathMoveToPoint(path, NULL, 0, y);
    //  虚线总长度（终点）
    CGPathAddLineToPoint(path, NULL,CGRectGetWidth(lineView.frame), y);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}


/** 画虚线——给定起终两点，自定义方向
 *  lineView:       需要绘制成虚线的view
 *  startXY:        起始点XY坐标
 *  endXY:          终点XY坐标
 *  lineLength:     虚线的粗度
 *  lineSpacing:    虚线的间距
 *  lineColor:      虚线的颜色
 **/
+ (void)drawDashLine:(UIView *)lineView startPoint:(CGPoint)startXY endPoint:(CGPoint)endXY lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor{


    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = lineView.bounds;
    
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线高度
    [shapeLayer setLineWidth:0.5];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    //  虚线起点
    CGPathMoveToPoint(path, NULL, startXY.x, startXY.y);
    //  虚线总长度（终点）
    CGPathAddLineToPoint(path, NULL,endXY.x, endXY.y);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];



}



#pragma mark -- 实线方法
/** 竖直方向实线
 *  lineView:       需要绘制成实线的view
 *  lineLength:     实线的宽度
 *  lineColor:      实线的颜色
 **/
+ (void)drawSolidLine:(UIView *)lineView xValue:(CGFloat)x lineLength:(int)lineLength lineColor:(UIColor *)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = lineView.bounds;
    
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线高度
    [shapeLayer setLineWidth:0.5];
    [shapeLayer setLineJoin:kCALineJoinRound];
    
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    //  虚线起点
    CGPathMoveToPoint(path, NULL, x, 0);
    //  虚线总长度（终点）
    CGPathAddLineToPoint(path, NULL,x, CGRectGetHeight(lineView.frame));
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}



/** 水平方向实线
 *  lineView:       需要绘制成实线的view
 *  lineLength:     实线的宽度
 *  lineColor:      实线的颜色
 **/
+ (void)drawSolidLine:(UIView *)lineView yValue:(CGFloat)y lineLength:(int)lineLength lineColor:(UIColor *)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = lineView.bounds;
    //    [shapeLayer setBounds:lineView.bounds];
    //    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线高度
    [shapeLayer setLineWidth:0.5];
    [shapeLayer setLineJoin:kCALineJoinRound];
    
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    //  虚线起点
    CGPathMoveToPoint(path, NULL, 0, y);
    //  虚线总长度（终点）
    CGPathAddLineToPoint(path, NULL,CGRectGetWidth(lineView.frame), y);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}


/** 实线——给定起终两点，自定义方向
 *  lineView:       需要绘制成实线的view
 *  startXY:        起始点XY坐标
 *  endXY:          终点XY坐标
 *  lineLength:     实线的粗度
 *  lineColor:      实线的颜色
 **/
+ (void)drawSolidLine:(UIView *)lineView startPoint:(CGPoint)startXY endPoint:(CGPoint)endXY lineLength:(int)lineLength lineColor:(UIColor *)lineColor{


    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = lineView.bounds;
    
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线高度
    [shapeLayer setLineWidth:0.5];
    [shapeLayer setLineJoin:kCALineJoinRound];
    
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    //  虚线起点
    CGPathMoveToPoint(path, NULL, startXY.x, startXY.y);
    //  虚线总长度（终点）
    CGPathAddLineToPoint(path, NULL,endXY.x, endXY.y);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];




}


@end
