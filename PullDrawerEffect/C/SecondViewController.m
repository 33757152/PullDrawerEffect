//
//  SecondViewController.m
//  PullDrawerEffect
//
//  Created by 张锦江 on 2018/3/7.
//  Copyright © 2018年 ZJJ. All rights reserved.
//

#import "SecondViewController.h"
#import "ZJJView.h"
#import "ZJJLazyViewController.h"
#import "ZJJCustomView.h"
#import "Header.h"

@interface SecondViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) NSArray *nameArray;


@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"联系人";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemEdit) target:self action:@selector(leftClick)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(addFriend)];
    [self.view addSubview:self.table];
    
    
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


- (UITableView *)table {
    if (!_table) {
        _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64-64) style:UITableViewStylePlain];
        _table.delegate = self;
        _table.dataSource = self;
    }
    return _table;
}

- (NSArray *)nameArray {
    if (!_nameArray) {
        _nameArray = @[@"我的好友",
                       @"朋友",
                       @"家人",
                       @"同学",
                       @"死党",
                       @"同事",
                       @"陌生人",
                       @"仇人"
                       ];
    }
    return _nameArray;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.nameArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.nameArray[indexPath.row];
    cell.detailTextLabel.text = @"0/0";
    return cell;
}

- (void)addFriend {
    [self goToDefaultVC];
}
- (void)goToDefaultVC {
    ZJJLazyViewController *lazyVC = [[ZJJLazyViewController alloc] init];
    [self.navigationController pushViewController:lazyVC animated:YES];
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
