//
//  DrawLine.h
//  A-C
//
//  Created by puyang on 2017/2/9.
//  Copyright © 2017年 puyang. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface DrawLine : NSObject

/** 虚线——竖直方向
 *  lineView:       需要绘制成虚线线的view
 *  x:              虚线坐标x值
 *  lineLength:     虚线的粗度
 *  lineSpacing:    虚线的间距
 *  lineColor:      虚线的颜色
 **/
+ (void)drawDashLine:(UIView *)lineView xValue:(CGFloat)x lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;


/** 虚线——水平方向
 *  lineView:       需要绘制成虚线的view
 *  y:              虚线坐标y值
 *  lineLength:     虚线的粗度
 *  lineSpacing:    虚线的间距
 *  lineColor:      虚线的颜色
 **/
+ (void)drawDashLine:(UIView *)lineView yValue:(CGFloat)y lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;


/** 画虚线——给定起终两点，自定义方向
 *  lineView:       需要绘制成虚线的view
 *  startXY:        起始点XY坐标
 *  endXY:          终点XY坐标
 *  lineLength:     虚线的粗度
 *  lineSpacing:    虚线的间距
 *  lineColor:      虚线的颜色
 **/
+ (void)drawDashLine:(UIView *)lineView startPoint:(CGPoint)startXY endPoint:(CGPoint)endXY lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;



/** 实线——竖直方向
 *  lineView:       需要绘制成实线的view
 *  x:              实线坐标x值
 *  lineLength:     实线的粗度
 *  lineColor:      实线的颜色
 **/
+ (void)drawSolidLine:(UIView *)lineView xValue:(CGFloat)x lineLength:(int)lineLength lineColor:(UIColor *)lineColor;


/** 实线——水平方向
 *  lineView:       需要绘制成实线的view
 *  y:              实现坐标y值
 *  lineLength:     实线的粗度
 *  lineColor:      实线的颜色
 **/
+ (void)drawSolidLine:(UIView *)lineView yValue:(CGFloat)y lineLength:(int)lineLength lineColor:(UIColor *)lineColor;


/** 实线——给定起终两点，自定义方向
 *  lineView:       需要绘制成实线的view
 *  startXY:        起始点XY坐标
 *  endXY:          终点XY坐标
 *  lineLength:     实线的粗度
 *  lineColor:      实线的颜色
 **/
+ (void)drawSolidLine:(UIView *)lineView startPoint:(CGPoint)startXY endPoint:(CGPoint)endXY lineLength:(int)lineLength lineColor:(UIColor *)lineColor;



@end
