//
//  CircleBarView.h
//  ZiPeiYi
//
//  Created by YouXianMing on 16/1/4.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    
    /**
     *  小尺寸类型
     */
    kNormalType,
    
    /**
     *  大尺寸类型
     */
    kBigType,
    
    /**
     *  颜色-行业-百分比
     */
    kLineType,
    
} ECircleBarViewType;

@interface CircleBarView : UIView

/**
 *  数据
 */
//@property (nonatomic, strong) OpenInterestInfomation *openInterestInfomation;

//****以下数据在实际开发中建议放到一个对象中，成为其成员变量*****//
// 百分比
@property (nonatomic, strong) NSString *percent;
// 颜色
@property (nonatomic, strong) UIColor *color;
// 信息（名字等）
@property (nonatomic, strong) NSString *name;


/**
 *  构建视图
 *
 *  @param type 视图类型
 */
- (void)buildViewWithType:(ECircleBarViewType)type;

/**
 *  是否显示动画
 *
 *  @param animated 是否显示动画
 *  @param type     视图类型
 */
- (void)showAnimated:(BOOL)animated type:(ECircleBarViewType)type;




@end
