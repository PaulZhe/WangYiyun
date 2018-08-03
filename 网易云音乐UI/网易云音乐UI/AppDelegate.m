//
//  AppDelegate.m
//  网易云音乐UI
//
//  Created by 小哲的DELL on 2018/7/24.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "AppDelegate.h"
#import "VCFind.h"
#import "VCVideo.h"
#import "VCMine.h"
#import "VCAccount.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    VCFind *vcFind = [[VCFind alloc] init];
    vcFind.title = @"发现";
    UIImage *imageFind = [UIImage imageNamed:@"网易云音乐_自制.png"];
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:@"发现" image:imageFind tag:1];
    vcFind.tabBarItem = tabBarItem;
    
    VCVideo *vcVideo = [[VCVideo alloc] init];
    vcVideo.title = @"视频";
    UIImage *imageVideo = [UIImage imageNamed:@"视频.png"];
    UITabBarItem *tabBarItem2 = [[UITabBarItem alloc] initWithTitle:@"视频" image:imageVideo tag:2];
    vcVideo.tabBarItem = tabBarItem2;
    
    VCMine *vcMine = [[VCMine alloc] init];
    vcMine.title = @"我的音乐";
    UIImage *imageMine = [UIImage imageNamed:@"音乐.png"];
    UITabBarItem *tabBarItem3 = [[UITabBarItem alloc] initWithTitle:@"我的" image:imageMine tag:3];
    vcMine.tabBarItem = tabBarItem3;
    
    VCAccount *vcAccount = [[VCAccount alloc] init];
    vcAccount.title =@"账户";
    UIImage *imageAccount = [UIImage imageNamed:@"账号.png"];
    UITabBarItem *tabBarItem4 = [[UITabBarItem alloc] initWithTitle:@"账号" image:imageAccount tag:4];
    vcAccount.tabBarItem = tabBarItem4;
    
    UITabBarController *tbController = [[UITabBarController alloc] init];
    
    UINavigationController *nController1 = [[UINavigationController alloc] initWithRootViewController:vcFind];
    nController1.navigationBar.barTintColor = [UIColor redColor];

    
    UINavigationController *nController2 = [[UINavigationController alloc] initWithRootViewController:vcVideo];
    nController2.navigationBar.barTintColor = [UIColor redColor];
    
    UINavigationController *nController3 = [[UINavigationController alloc] initWithRootViewController:vcMine];
    nController3.navigationBar.barTintColor = [UIColor redColor];
    
    UINavigationController *nController4 = [[UINavigationController alloc] initWithRootViewController:vcAccount];
    nController4.navigationBar.barTintColor = [UIColor redColor];
  
    //设置导航栏按钮
    UIBarButtonItem *item4 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"0.0"] style:UIBarButtonItemStylePlain target:self action:nil];
    UIBarButtonItem *item3 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"云"] style:UIBarButtonItemStylePlain target:self action:nil];

    vcMine.navigationItem.leftBarButtonItem = item3;
    vcAccount.navigationItem.rightBarButtonItem = item4;
    vcFind.navigationItem.rightBarButtonItem = item4;
    vcMine.navigationItem.rightBarButtonItem = item4;
    vcVideo.navigationItem.rightBarButtonItem = item4;
    vcAccount.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    vcMine.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    //设置导航栏标题颜色
    [vcAccount.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    [vcFind.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    [vcVideo.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    [vcMine.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    
    //设置根视图 
    NSArray *arrayVC = [NSArray arrayWithObjects:nController1,nController2,nController3,nController4,nil];

    tbController.viewControllers = arrayVC;
    
    self.window.rootViewController = tbController;
    
    tbController.tabBar.translucent = NO;
    
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
