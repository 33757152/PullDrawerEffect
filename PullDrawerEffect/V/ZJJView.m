//
//  ZJJView.m
//  PullDrawerEffect
//
//  Created by 张锦江 on 2018/3/7.
//  Copyright © 2018年 ZJJ. All rights reserved.
//

#import "ZJJView.h"
#import "Header.h"
#import "ZJJBaseTabBarController.h"
#import "LeftViewController.h"
#import "ZJJColorView.h"

@interface ZJJView () {
    ZJJColorView *_colorView;
}

@end

@implementation ZJJView

- (void)leftClickHeadImageView {
    ZJJBaseTabBarController *tabbar = [ZJJBaseTabBarController shareInstance];
    LeftViewController *leftVC = [LeftViewController shareManager];
    if (!_colorView) {
        _colorView = [[ZJJColorView alloc] init];
    }
    [UIView animateWithDuration:0.2 animations:^{
        _colorView.alpha = 0.8;
        tabbar.view.frame = CGRectMake(OFFSET_X, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        leftVC.view.frame = CGRectMake(0, 0, OFFSET_X, SCREEN_HEIGHT);
    }];
}

- (void)leftToRightPanGestureWithOffset:(float)offset_x {
    ZJJBaseTabBarController *tabbar = [ZJJBaseTabBarController shareInstance];
    LeftViewController *leftVC = [LeftViewController shareManager];
    if (offset_x < OFFSET_X) {
        tabbar.view.frame = CGRectMake(offset_x, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        if (offset_x >= 50) {
            leftVC.view.frame = CGRectMake(-OFFSET_X + offset_x, 0, OFFSET_X, SCREEN_HEIGHT);
        }else {
            leftVC.view.frame = CGRectMake(-OFFSET_X + offset_x/3 + 35, 0, OFFSET_X, SCREEN_HEIGHT);
        }
        
    }
}

- (void)rightToLeftPanGestureWithOffset:(float)offset_x {
    
    
    
}

- (void)panMoveEndedWithOffset:(float)offset_x {
    ZJJBaseTabBarController *tabbar = [ZJJBaseTabBarController shareInstance];
    LeftViewController *leftVC = [LeftViewController shareManager];
    if (offset_x < SCREEN_WIDTH/3) {
        // result to left
        [UIView animateWithDuration:0.2 animations:^{
            tabbar.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            leftVC.view.frame = CGRectMake(-OFFSET_X+50, 0, OFFSET_X, SCREEN_HEIGHT);
            _colorView.alpha = 0;
        }];
    }else {
        // result to right
        if (!_colorView) {
            _colorView = [[ZJJColorView alloc] init];
        }
        [UIView animateWithDuration:0.2 animations:^{
            _colorView.alpha = 0.8;
            tabbar.view.frame = CGRectMake(OFFSET_X, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            leftVC.view.frame = CGRectMake(0, 0, OFFSET_X, SCREEN_HEIGHT);
        }];
        
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
