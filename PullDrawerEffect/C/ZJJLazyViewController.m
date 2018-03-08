//
//  ZJJLazyViewController.m
//  ZJJLateralSlide
//
//  Created by 张锦江 on 2017/7/22.
//  Copyright © 2017年 ZJJ. All rights reserved.
//

#import "ZJJLazyViewController.h"
#import "Header.h"

@interface ZJJLazyViewController ()

@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation ZJJLazyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"你好!";
    [self.view addSubview:self.nameLabel];
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, SCREEN_WIDTH-100, 300)];
        _nameLabel.backgroundColor = [UIColor yellowColor];
        _nameLabel.text = [NSString stringWithFormat:@"sorry!客官\n由于他比较懒\n所以这里啥都没有\n请见谅呦亲!"];
        _nameLabel.textColor = [UIColor redColor];
        _nameLabel.numberOfLines = 0;
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.font = [UIFont systemFontOfSize:25.0f];
    }
    return _nameLabel;
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
