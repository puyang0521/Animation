//
//  LoadMaskHelper.h
//  ZiPeiYi
//
//  Created by puyang on 16/11/14.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    
    HomePage,          //  主页
    StockTimesharing,  //  股票分时
    
} PageTye;

@interface LoadMaskHelper : NSObject

/**
 *  显示蒙版  （ 页面蒙版类型 要在那个view展示 延时几秒展示）
 */
+ (void)showMaskWithType:(PageTye)pageType onView:(UIView*)view delay:(NSTimeInterval)delay;

/**
 *  版本升级则重置蒙版，加载新蒙版
 */
+ (void)checkAPPVersion;

@end
