//
//  AniChartViewBaseView.h
//  指纹开发
//
//  Created by puyang on 2016/12/13.
//  Copyright © 2016年 puyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AniChartViewBaseView : UIView
@property (nonatomic, strong) UIColor  *barColor;         // 柱的颜色
@property (nonatomic, assign) CGFloat  barSpacing;       // 柱间距（默认为0，没有柱间距）
@property (nonatomic, strong) NSArray  *dataArray;        // 数据值

@property (nonatomic)         BOOL     finishedLoading;  // cell防重载用


/**
 显示柱状图
 */
- (void)showBarChart;

/**
 数据变化时,刷新
 */
- (void)refreshBarChart;
@end
