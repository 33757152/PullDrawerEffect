//
//  FirstViewController.m
//  PullDrawerEffect
//
//  Created by 张锦江 on 2018/3/7.
//  Copyright © 2018年 ZJJ. All rights reserved.
//

#import "FirstViewController.h"
#import "Header.h"
#import "ZJJView.h"
#import "ZJJCustomView.h"
#import "ZJJDataModel.h"
#import "ZJJLazyViewController.h"

@interface FirstViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) NSArray *nameArray;
@property (nonatomic, strong) NSArray *detailArray;
@property (nonatomic, strong) NSArray *imageArray;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"消息";
    [self.view addSubview:self.table];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addFriend)];

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

- (NSArray *)nameArray {
    if (!_nameArray) {
        _nameArray = [ZJJDataModel obtainMessageName];
    }
    return _nameArray;
}

- (NSArray *)imageArray {
    if (!_imageArray) {
        _imageArray = [ZJJDataModel obtainMessageImage];
    }
    return _imageArray;
}

- (NSArray *)detailArray {
    if (!_detailArray) {
        _detailArray = [ZJJDataModel obtainMessageDetail];
    }
    return _detailArray;
}

- (UITableView *)table {
    if (!_table) {
        _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64-64) style:UITableViewStylePlain];
        _table.delegate = self;
        _table.dataSource = self;
    }
    return _table;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70.0f;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.nameArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    cell.imageView.image = [UIImage imageNamed:self.imageArray[indexPath.row]];
    cell.imageView.layer.cornerRadius = 30.0f;
    cell.imageView.clipsToBounds = YES;
    cell.textLabel.text = self.nameArray[indexPath.row];
    cell.detailTextLabel.text = self.detailArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self goToDefaultVC];
}

- (void)addFriend {
    [self goToDefaultVC];
}

- (void)goToDefaultVC {
    ZJJLazyViewController *lazyVC = [[ZJJLazyViewController alloc] init];
    [self.navigationController pushViewController:lazyVC animated:YES];
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
