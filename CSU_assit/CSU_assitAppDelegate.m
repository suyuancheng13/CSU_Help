//
//  CSU_assitAppDelegate.m
//  CSU_assit
//
//  Created by MagicStudio on 13-7-14.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "CSU_assitAppDelegate.h"
#import "CSU_assitViewController.h"
#import "MainViewController.h"
#import "LetViewController.h"

@implementation CSU_assitAppDelegate


@synthesize window=_window;

@synthesize viewController=_viewController;
@synthesize naviController =  _naviController;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.    
    CSU_assitViewController *rootController = [ [CSU_assitViewController alloc] init ];
    [rootController setTitle:@"中南生活助手 "];
    _naviController = [[UINavigationController alloc]init];
    // _naviController = [[UINavigationController alloc]initWithRootViewController:rootController];
    [_naviController pushViewController:rootController animated:YES];
   // [_naviController.view setBackgroundColor:[UIColor redColor]];
    //	self.window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
    self.window.rootViewController = _naviController;
   // [self.window addSubview:_naviController.view];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

@end
