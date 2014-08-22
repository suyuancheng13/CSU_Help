//
//  introduce.h
//  CSU_assit
//
//  Created by MagicStudio on 13-8-15.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface introduce : UIViewController {
    
}
- (id)initWithViewController:(UIViewController *)controller animation:(UIModalTransitionStyle)transition delay:(NSTimeInterval)seconds;
- (void)timerFireMethod:(NSTimer *)theTimer;
@end
