//
//  main.m
//  CSU_assit
//
//  Created by MagicStudio on 13-7-14.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSU_assitAppDelegate.h"
int main(int argc, char *argv[])
{
//    int a = 100;
//    int re = a&-a;
//    NSLog(@"%d",re);
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, NSStringFromClass([CSU_assitAppDelegate  class]));
    [pool release];
    return retVal;
}
