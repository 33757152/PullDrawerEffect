//
//  ZJJBaseTabBarController.m
//  PullDrawerEffect
//
//  Created by 张锦江 on 2018/3/7.
//  Copyright © 2018年 ZJJ. All rights reserved.
//

#import "ZJJBaseTabBarController.h"

@interface ZJJBaseTabBarController ()

@end

static ZJJBaseTabBarController *tabbar = nil;

@implementation ZJJBaseTabBarController

+ (ZJJBaseTabBarController *)shareInstance {
    if (!tabbar) {
        tabbar = [[ZJJBaseTabBarController alloc] init];
    }
    return tabbar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
