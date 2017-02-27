//
//  WaitButton.h
//
//  Created by puyang on 16/10/10.
//  Copyright © 2016年 puyang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^finishBlock)();

@interface WaitButton : UIView

// 完成回调
@property (nonatomic,copy) finishBlock finishBlock;

@end
