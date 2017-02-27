//
//  AniChartViewBaseView.m
//  指纹开发
//
//  Created by puyang on 2016/12/13.
//  Copyright © 2016年 puyang. All rights reserved.
//

#import "AniChartViewBaseView.h"
@interface AniChartViewBaseView ()

@property (nonatomic, strong) NSMutableArray  *shapeLayerArray;  // 存储每条柱

@property (nonatomic, strong) NSArray         *colorsArray;  // 颜色集合

@end


@implementation AniChartViewBaseView

// 初始化
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.shapeLayerArray  = [NSMutableArray array];
        
        self.colorsArray = @[[UIColor colorWithRed:223/255.0 green:73/255.0 blue:53/255.0 alpha:1],
          [UIColor colorWithRed:243/255.0 green:143/255.0 blue:43/255.0 alpha:1],
          [UIColor colorWithRed:235/255.0 green:218/255.0 blue:89/255.0 alpha:1],
          [UIColor colorWithRed:115/255.0 green:216/255.0 blue:75/255.0 alpha:1],
          [UIColor colorWithRed:58/255.0 green:223/255.0 blue:210/255.0 alpha:1],
          [UIColor colorWithRed:32/255.0 green:172/255.0 blue:255.0/255.0 alpha:1],
          [UIColor colorWithRed:39/255.0 green:92/255.0 blue:170/255.0 alpha:1],
                             [UIColor colorWithRed:141/255.0 green:132/255.0 blue:240/255.0 alpha:1],[UIColor colorWithRed:223/255.0 green:73/255.0 blue:53/255.0 alpha:1],
                             [UIColor colorWithRed:243/255.0 green:143/255.0 blue:43/255.0 alpha:1],
                             [UIColor colorWithRed:235/255.0 green:218/255.0 blue:89/255.0 alpha:1],
                             [UIColor colorWithRed:115/255.0 green:216/255.0 blue:75/255.0 alpha:1],
                             [UIColor colorWithRed:58/255.0 green:223/255.0 blue:210/255.0 alpha:1],
                             [UIColor colorWithRed:32/255.0 green:172/255.0 blue:255.0/255.0 alpha:1],
                             [UIColor colorWithRed:39/255.0 green:92/255.0 blue:170/255.0 alpha:1],
                             [UIColor colorWithRed:141/255.0 green:132/255.0 blue:240/255.0 alpha:1]];
        
    }
    return self;
}



# pragma mark 公有方法
// 显示柱状图
- (void)showBarChart{
    
    
    if (self.dataArray == nil || self.dataArray.count==0){
        
        return;
        
    }
    
    
    
    // 计算柱条的宽度
    CGFloat barWith;
    if (self.barSpacing > 0) {
        
        barWith = (self.frame.size.width-(int)self.barSpacing*(self.dataArray.count+1))/self.dataArray.count;
    }else{
        
        barWith = self.frame.size.width/self.dataArray.count;
        
    }
    
    
    for (int i = 0; i< self.dataArray.count; i++) {
        
        // 4.1计算每根柱子的x值
        
        CGFloat barX = i * barWith +(int)self.barSpacing*(i+1);
        
        // 4.2计算每根柱子的高度
        
        CGFloat barH = ([self.dataArray[i]floatValue] /100.0) * self.frame.size.height;
        
        // 4.3计算每根柱子的y值
        
        CGFloat barY = self.frame.size.height- barH;
        
        // 4.4创建柱状型的柱子
        
        UIView *barView = [[UIView alloc]initWithFrame:CGRectMake(barX, self.frame.size.height, barWith,0)];
//        barView.backgroundColor =[UIColor colorWithRed:arc4random_uniform(256) /255.0 green:arc4random_uniform(256) /255.0 blue:arc4random_uniform(256) /255.0 alpha:0.8];
        
        barView.backgroundColor  = self.colorsArray[i];
        [self addSubview:barView];
       
        
        [self.shapeLayerArray addObject:barView];
        
        [UIView animateWithDuration:0.1 delay:0.08*(i+1) options:UIViewAnimationOptionBeginFromCurrentState animations:^{
           
            barView.frame = CGRectMake(barX, barY-20, barWith, barH+20);
            
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.05 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
               barView.frame = CGRectMake(barX, barY , barWith, barH );
            } completion:^(BOOL lastBarFinished) {
               
            }];
        }];
        
        
        
    }
  
    _finishedLoading = YES;
    
    
    [self refreshBarChart];
}

// 刷新柱状图
- (void)refreshBarChart{
    
    
    
    
}



@end
