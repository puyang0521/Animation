//
//  RedAndGreenBarView.m
//  指纹开发
//
//  Created by puyang on 2016/12/19.
//  Copyright © 2016年 puyang. All rights reserved.
//

#import "RedAndGreenBarView.h"

@interface RedAndGreenBarView ()

@property (nonatomic, strong) NSMutableArray  *shapeLayerArray;  // 存储每条柱


@property (nonatomic, assign) CGFloat x;       // 手势坐标x
@property (nonatomic, assign) CGFloat y;       // 手势坐标y

@end


@implementation RedAndGreenBarView

// 初始化
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.shapeLayerArray  = [NSMutableArray array];
        
        
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
        
        barWith = (self.frame.size.width-self.barSpacing*(self.dataArray.count-1))/self.dataArray.count; // 右端与侧边没有间隙-1，有间隙-0
    }else{
        
        barWith = self.frame.size.width/self.dataArray.count;
        
    }
    
    
    for (int i = 0; i< self.dataArray.count; i++) {
        
        // 4.1计算每根柱子的x值
        
        CGFloat barX = i * barWith +self.barSpacing*(i+0); // 左端与侧边没有间隙+0，有间隙+1；
        
        // 4.2计算每根柱子的高度
        
        CGFloat barH = ([self.dataArray[i]floatValue] /100.0) * self.frame.size.height/2;
        
        // 4.3计算每根柱子的y值
        
        CGFloat barY = self.frame.size.height/2- barH;
        
        // 4.4创建柱状型的柱子
        
        UIView *barView = [[UIView alloc]initWithFrame:CGRectMake(barX, barY , barWith, barH )];
//        barView.backgroundColor =[UIColor colorWithRed:arc4random_uniform(256) /255.0 green:arc4random_uniform(256) /255.0 blue:arc4random_uniform(256) /255.0 alpha:0.5];
        [self addSubview:barView];
        barView.alpha = 0.5;
        if ([self.dataArray[i]floatValue]>=0) {
            barView.backgroundColor = [UIColor redColor];
        }else{
            barView.backgroundColor = [UIColor greenColor];
        }
        
        
        [self.shapeLayerArray addObject:barView];
        
        
        
        
    }
    
    
    
    self.transform = CGAffineTransformMakeScale(1, 0);
    
    
    [UIView animateWithDuration:0.5 animations:^{
        self.transform = CGAffineTransformMakeScale(1, 1);
        
    }];
    
    _finishedLoading = YES;
    
    
    [self refreshBarChart];
}



// 刷新柱状图
- (void)refreshBarChart{
    
    
    
    
}


// 处理坐标
- (void)dealTouches{
    


}

// 手势消失
- (void)touchesDismiss{


}

// 系统手势
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CGPoint point = [touches.anyObject locationInView:self];
    self.x = point.x;
    self.y = point.x;
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CGPoint point = [touches.anyObject locationInView:self];
    self.x = point.x;
    self.y = point.x;

    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self touchesDismiss];

}
@end
