//
//  CircleInfomationView.h
//  ZiPeiYi
//
//  Created by YouXianMing on 16/1/4.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CircleInfomationView : UIView

/**
 *  数据
 */
//@property (nonatomic, strong) OpenInterestInfomationManager  *infoData;

//****以下数据在实际开发中建议放到一个对象中，成为其成员变量*****//
// 百分比
@property (nonatomic, strong) NSArray *percentArray;
// 颜色集
@property (nonatomic, strong) NSArray *colorsArray;
// 每一块信息（名字等）
@property (nonatomic, strong) NSArray *nameArray;

/**
 *  设置完了所有参数后才能够构建view
 */
- (void)buildView;

/**
 *  是否已经构建过view了
 *
 *  @return 是否已经构建过
 */
- (BOOL)haveBuildSubView;

/**
 *  显示数据(是否需要动画)
 *
 *  @param animated 是否需要执行动画
 */
- (void)showAnimated:(BOOL)animated;

@end
