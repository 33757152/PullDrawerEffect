//
//  ZJJColorView.m
//  PullDrawerEffect
//
//  Created by 张锦江 on 2018/3/8.
//  Copyright © 2018年 ZJJ. All rights reserved.
//

#import "ZJJColorView.h"
#import "Header.h"
#import "ZJJBaseTabBarController.h"
#import "LeftViewController.h"

@implementation ZJJColorView

- (instancetype)init {
    self = [super init];
    if (self) {
        ZJJBaseTabBarController *tabbar = [ZJJBaseTabBarController shareInstance];
        self.backgroundColor = [UIColor lightGrayColor];
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        self.alpha = 0;
        self.userInteractionEnabled = YES;
        [tabbar.view addSubview:self];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)tapClick:(UITapGestureRecognizer *)gesture {
    ZJJBaseTabBarController *tabbar = [ZJJBaseTabBarController shareInstance];
    LeftViewController *leftVC = [LeftViewController shareManager];
    [UIView animateWithDuration:0.2 animations:^{
        tabbar.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        leftVC.view.frame = CGRectMake(-OFFSET_X+50, 0, OFFSET_X, SCREEN_HEIGHT);
        self.alpha = 0;
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
