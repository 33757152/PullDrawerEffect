//
//  ZJJView.h
//  PullDrawerEffect
//
//  Created by 张锦江 on 2018/3/7.
//  Copyright © 2018年 ZJJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJJView : UIView

/**
 点击左上角头像按钮展开左视图
 */
- (void)leftClickHeadImageView;

/**
  从左向右 滑动
 */
- (void)leftToRightPanGestureWithOffset:(float)offset_x;


/**
 从右向左 滑动
 */
- (void)rightToLeftPanGestureWithOffset:(float)offset_x;



/**
 结束滑动
 */
- (void)panMoveEndedWithOffset:(float)offset_x;



@end
