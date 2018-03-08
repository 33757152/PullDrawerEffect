//
//  ThirdViewController.m
//  PullDrawerEffect
//
//  Created by 张锦江 on 2018/3/7.
//  Copyright © 2018年 ZJJ. All rights reserved.
//

#import "ThirdViewController.h"
#import "ZJJView.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"动态";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemEdit) target:self action:@selector(leftClick)];
    
    
    
    
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    [self.view addGestureRecognizer:gesture];
    
}

- (void)panGesture:(UIPanGestureRecognizer *)gesture {
    CGPoint translatedPoint = [gesture translationInView:self.view];
    if (translatedPoint.x<0) {
        [[ZJJView alloc] rightToLeftPanGestureWithOffset:translatedPoint.x];
    }else if (translatedPoint.x>0) {
        [[ZJJView alloc] leftToRightPanGestureWithOffset:translatedPoint.x];
    }
    if (gesture.state == UIGestureRecognizerStateEnded) {
        [[ZJJView alloc] panMoveEndedWithOffset:translatedPoint.x];
    }
}


- (void)leftClick {
    
    [[ZJJView alloc] leftClickHeadImageView];
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
