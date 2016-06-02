//
//  ZYTabBarController.m
//  TabBar中间凸起
//
//  Created by Mac on 16/6/2.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "ZYTabBarController.h"
#import "ZYTabBar.h"
@interface ZYTabBarController ()<ZYTabBarDelegate>

@end

@implementation ZYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    ZYTabBar* zyBar = (ZYTabBar*)self.tabBar;
    zyBar.zyDelegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)zyTabBar:(ZYTabBar *)tabBar clickAtMiddleItem:(UIButton *)button{
    if (!self.tabBar.isHidden) {
        NSLog(@"点到了");
        
        
        self.selectedIndex = 2;
        
        
    }
    
    NSLog(@"点到了====外头了");
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
