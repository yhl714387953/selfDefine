//
//  ZYTabBar.h
//  TabBar中间凸起
//
//  Created by Mac on 16/6/2.
//  Copyright © 2016年 Mac. All rights reserved.
//


/***********************实现思路*************************/
/* 两种方法
    一、如果位置均分，(5个item就创建5个，中间的只占位使用)那么可以把中间的item图片置空，在中间加一个button，当然在button的回调里，要选中当前的item（当然这个事件在控制器里完成）
 
    还有一个问题就是，如果重写了下面的方法，那么push到别的页面，即使tabBar隐藏了，也能响应的，点击的时候要看看tabBar.hidden，isHidden了就不要处理了
    -(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
    
    如果还觉得麻烦，那就重写下面的方法，不会出现上述问题了
    -(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
 
 
 
 ==========
 当然，这个方法没有试过，哈哈，谁试过告诉我下，跪谢
 ==========
    二、直接在layout重写一下位置(5个item，创建几个都行，系统的item要重写位置<宽度啊，space都行>-->NSArray<UITabBarItem *> *items)
 
    当然 bringSubviewToFront  这个调用一下，哈哈，要不被上面的线挡住了
 */

/***********************实现思路*************************/



#import <UIKit/UIKit.h>
@class ZYTabBar;
@protocol ZYTabBarDelegate <UITabBarDelegate>
@optional
-(void)zyTabBar:(ZYTabBar*)tabBar clickAtMiddleItem:(UIButton*)button;

@end

@interface ZYTabBar : UITabBar

/** delegate */
@property (nonatomic, weak) id<ZYTabBarDelegate> zyDelegate;
/** 中间按钮 */
@property (nonatomic, strong) UIButton* button;

@end
