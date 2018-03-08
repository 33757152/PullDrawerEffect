//
//  LeftViewController.m
//  PullDrawerEffect
//
//  Created by 张锦江 on 2018/3/7.
//  Copyright © 2018年 ZJJ. All rights reserved.
//

#import "LeftViewController.h"
#import "Header.h"
#import "LeftClickToViewController.h"
#import "ZJJBaseTabBarController.h"
#import "ZJJColorView.h"
#import "ZJJDataModel.h"


@interface LeftViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTable;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSArray *imagesArray;

@end

static LeftViewController *_leftVC = nil;

@implementation LeftViewController

+ (LeftViewController *)shareManager {
    if (!_leftVC) {
        _leftVC = [[LeftViewController alloc] init];
    }
    return _leftVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.myTable];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, OFFSET_X, 150)];
    imageView.image = [UIImage imageNamed:@"topInfo.jpg"];
    [self.view addSubview:imageView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touches began...");
}


- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [ZJJDataModel obtainDataOfList];
    }
    return _dataArray;
}

- (NSArray *)imagesArray {
    if (!_imagesArray) {
        _imagesArray = [ZJJDataModel obtainImagesOfData];
    }
    return _imagesArray;
}

- (UITableView *)myTable {
    if (!_myTable) {
        _myTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 150, OFFSET_X, SCREEN_HEIGHT-150) style:UITableViewStylePlain];
        _myTable.delegate = self;
        _myTable.dataSource = self;
        _myTable.backgroundColor = [UIColor whiteColor];
    }
    return _myTable;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:self.imagesArray[indexPath.row]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"------------>%ld",indexPath.row);
    ZJJBaseTabBarController *tabbar = [ZJJBaseTabBarController shareInstance];
    [UIView animateWithDuration:0.2 animations:^{
        for (UIView *subView in tabbar.view.subviews) {
            if ([subView isKindOfClass:[ZJJColorView class]]) {
                [subView setAlpha:0];
            }
        }
        tabbar.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        self.view.frame = CGRectMake(-OFFSET_X+50, 0, OFFSET_X, SCREEN_HEIGHT);
    }];

    LeftClickToViewController *vc = [[LeftClickToViewController alloc] init];
    [tabbar presentViewController:vc animated:YES completion:nil];
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
