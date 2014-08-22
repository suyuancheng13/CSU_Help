//
//  classInfo.h
//  CSU_assit
//
//  Created by MagicStudio on 13-8-3.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "textView.h"
#import "server.h"
#import "room.h"
#include "pictureHeader.h"

@interface classInfo : UIViewController <UITableViewDelegate,UITableViewDataSource>{
    UITableView         *_tableView;
    NSArray             *_list;
    id                  _delegate;
    UIActivityIndicatorView *indicatoeView;
    NSMutableArray      *roommates;
    NSMutableArray      *roommatesInfo;
    room                *showRoom;
}
@property(nonatomic ,retain) id    delegate;
- (void)getRoom;
- (void)getRoommate;
- (NSMutableArray *)getBasic;

@end
