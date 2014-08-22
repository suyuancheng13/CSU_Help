//
//  CSU_assitAppDelegate.h
//  CSU_assit
//
//  Created by MagicStudio on 13-7-14.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CSU_assitViewController;

@interface CSU_assitAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet CSU_assitViewController *viewController;
@property (nonatomic, retain) UINavigationController  *naviController;
 @end
