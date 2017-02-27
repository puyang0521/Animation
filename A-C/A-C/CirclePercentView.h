//
//  CirclePercentView.h
//  ZiPeiYi
//
//  Created by YouXianMing on 16/1/4.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CirclePercentView : UIView

/**
 *  线条的宽度
 */
@property (nonatomic) CGFloat  lineWidth;

/**
 *  旋转的角度
 */
@property (nonatomic) CGFloat  roateAngle;

/**
 *  百分比数据
 */
@property (nonatomic, strong) NSArray *percentArray;
/**
 *  颜色集合（大于或等于百分比个数）
 */
@property (nonatomic, strong) NSArray *colorsArray;

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
