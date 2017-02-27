//
//  ButtonShowView.h
//  A-C
//
//  Created by puyang on 2017/2/14.
//  Copyright © 2017年 puyang. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^CallbackEvent) (NSInteger tag);

@interface ButtonShowView : UIView

// 最多支持两个按钮
@property (nonatomic, strong) NSArray         *buttonsTitleArray;
@property (nonatomic, strong) NSArray         *buttonsColorArray;
@property (nonatomic        ) NSString        *message;

//- (void)showButtonViewOn:(UIView*)contentView CallBack:(CallbackEvent)eventBlock;
- (void)showButtonViewOn:(UIView*)contentView;
/**
 *  事件回调
 */
@property (nonatomic, copy) CallbackEvent eventBlock;

/* 
 
     
    请指定初始化尺寸大小initWithFrame，用new方式初始化按钮没有点击事件，因为这样弹窗尺寸为（0.0，0.0，0.0，0.0）
     [[ButtonShowView alloc]initWithFrame:self.contentView.bounds];
 
 
 
 
 */


@end
