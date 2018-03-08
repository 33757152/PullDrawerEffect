//
//  AppDelegate.m
//  PullDrawerEffect
//
//  Created by 张锦江 on 2018/3/7.
//  Copyright © 2018年 ZJJ. All rights reserved.
//

#import "AppDelegate.h"
#import "LeftViewController.h"
#import "ZJJBaseTabBarController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "Header.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    ZJJBaseTabBarController *tabbar = [ZJJBaseTabBarController shareInstance];
    
    UINavigationController *firstNav = [[UINavigationController alloc] initWithRootViewController:[[FirstViewController alloc] init]];
    firstNav.tabBarItem.title = @"消息";
    firstNav.tabBarItem.image = [[UIImage imageNamed:@"message"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UINavigationController *secondNav = [[UINavigationController alloc] initWithRootViewController:[[SecondViewController alloc] init]];
    secondNav.tabBarItem.title = @"联系人";
    secondNav.tabBarItem.image = [[UIImage imageNamed:@"people"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    UINavigationController *thirdNav = [[UINavigationController alloc] initWithRootViewController:[[ThirdViewController alloc] init]];
    thirdNav.tabBarItem.title = @"动态";
    thirdNav.tabBarItem.image = [[UIImage imageNamed:@"dynamic.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    tabbar.viewControllers = @[firstNav,secondNav,thirdNav];
    self.window.rootViewController = tabbar;
    
    LeftViewController *leftVC = [LeftViewController shareManager];
    leftVC.view.frame = CGRectMake(-OFFSET_X+50, 0, OFFSET_X, SCREEN_HEIGHT);
    [self.window addSubview:leftVC.view];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
