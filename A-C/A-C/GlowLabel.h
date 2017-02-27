//
//  GlowLabel.h
//  A-C
//
//  Created by puyang on 2017/2/8.
//  Copyright © 2017年 puyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GlowLabel : UILabel

/**
 *  Glow size, default is 0.f.
 */
@property (nonatomic) CGFloat glowSize;

/**
 *  Glow color, default is clear color.
 */
@property (nonatomic, strong) UIColor *glowColor;

/**
 *  Inner glow size, default is 0.f.
 */
@property (nonatomic) CGFloat innerGlowSize;

/**
 *  Inner glow color, default is clear color.
 */
@property (nonatomic, strong) UIColor *innerGlowColor;


@end
