//
//  ZJJCustomView.h
//  ZJJLateralSlide
//
//  Created by 张锦江 on 2017/7/21.
//  Copyright © 2017年 ZJJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJJCustomView : UIView

+ (UIButton *)customButtonWithTarget:(SEL)selector withObject:(id)object;

+ (UIView *)customLittleItemFrame:(CGRect)rect withImage:(UIImage *)name withText:(NSString *)title withTarget:(SEL)selector withObject:(id)object;

@end
