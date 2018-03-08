//
//  ZJJCustomView.m
//  ZJJLateralSlide
//
//  Created by 张锦江 on 2017/7/21.
//  Copyright © 2017年 ZJJ. All rights reserved.
//

#import "ZJJCustomView.h"

@implementation ZJJCustomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (UIButton *)customButtonWithTarget:(SEL)selector withObject:(id)object {
    UIButton *openButton = [UIButton buttonWithType:UIButtonTypeSystem];
    openButton.frame = CGRectMake(20, 22, 40, 40);
    [openButton setBackgroundImage:[UIImage imageNamed:@"head.jpg"] forState:UIControlStateNormal];
    openButton.layer.cornerRadius = 20.0f;
    openButton.clipsToBounds = YES;
    [openButton addTarget:object action:selector forControlEvents:UIControlEventTouchUpInside];
    return openButton;
}

+ (UIView *)customLittleItemFrame:(CGRect)rect withImage:(UIImage *)name withText:(NSString *)title withTarget:(SEL)selector withObject:(id)object {
    UIView *cellView = [[UIView alloc] initWithFrame:rect];
    cellView.backgroundColor = [UIColor clearColor];
    // image
    UIImageView *imageView = [[UIImageView alloc] initWithImage:name];
    imageView.frame = CGRectMake(12, 2, 40, 40);
    imageView.backgroundColor = [UIColor clearColor];
    [cellView addSubview:imageView];
    // label
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 44, 64, 20)];
    label.text = title;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    [cellView addSubview:label];
    // button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 0, 64, 64);
    button.backgroundColor = [UIColor clearColor];
    [button addTarget:object action:selector forControlEvents:UIControlEventTouchUpInside];
    [cellView addSubview:button];
    return cellView;
}


@end
