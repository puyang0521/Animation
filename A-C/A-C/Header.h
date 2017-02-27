//
//  Header.h
//  A-C
//
//  Created by puyang on 2017/2/7.
//  Copyright © 2017年 puyang. All rights reserved.
//

#ifndef Header_h
#define Header_h

/* 第三方 */


/* 网络数据 */


/* 工具类 */



/* 屏幕适配 */
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenHeightRate ([[UIScreen mainScreen] bounds].size.height / 667.0)
#define ScreenWidthRate ([UIScreen mainScreen].bounds.size.width / 375.0)
//6 plus 736  6s/6 667  5s 568

/* 系统版本 */



/* 文件路径 */
#define recourcesPath [[NSBundle mainBundle] resourcePath]

/* 颜色  */
#define SetColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define CutLineColor [Utils colorWithHexString:@"#ececec"]

/* 文本 */
#define LABEL_DEFAULT_TEXT   @"--"


/* 输出 */
#import "SimpleNSLog.h"

#define _md_get_weakSelf() __weak typeof(self) weakSelf = self

#endif /* Header_h */
