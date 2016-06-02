//
//  ZYTabBar.m
//  TabBar中间凸起
//
//  Created by Mac on 16/6/2.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "ZYTabBar.h"

@implementation ZYTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.button];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self addSubview:self.button];
    }
    return self;
}



-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.button.center = CGPointMake(self.frame.size.width / 2.0, 0);
    [self bringSubviewToFront:self.button];
}


-(UIButton *)button{
    if (!_button) {
        _button = [UIButton buttonWithType:(UIButtonTypeSystem)];
        _button.frame = CGRectMake(0, 0, 60, 60);
        _button.backgroundColor = [UIColor yellowColor];
        [_button setTitle:@"爷" forState:(UIControlStateNormal)];
        _button.titleLabel.font = [UIFont systemFontOfSize:40];
        _button.layer.cornerRadius = _button.frame.size.width / 2.0;
        _button.layer.borderWidth = 2;
        _button.layer.borderColor = [UIColor greenColor].CGColor;
        [_button addTarget:self action:@selector(clicked:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    
    return _button;
}

-(void)clicked:(UIButton*)sender{
    if (self.zyDelegate && [self.zyDelegate respondsToSelector:@selector(zyTabBar:clickAtMiddleItem:)]) {
        
        [self.zyDelegate zyTabBar:self clickAtMiddleItem:self.button];
    }
}

/***************************************************/
//以上两个实现任何一个都可以使得超出父视图的控件响应
/***************************************************/

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    BOOL inside = [super pointInside:point withEvent:event];
//    判断有没有点到button内   将point转换到自身，判断转换后的点是否在button  frame内
    CGPoint touchPoint = [self convertPoint:point toView:self];
    if (CGRectContainsPoint(self.button.frame, touchPoint)) {
        return YES;
    }
    
    return inside;
}

/***************************************************/
//-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//
//    //    判断有没有点到button内   将point转换到自身，判断转换后的点是否在button  frame内
//    CGPoint touchPoint = [self convertPoint:point toView:self];
//    if (CGRectContainsPoint(self.button.frame, touchPoint)) {
//        return self.button;
//    }
//    
//    return [super hitTest:point withEvent:event];
//}
/***************************************************/

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
