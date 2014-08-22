//
//  room.h
//  CSU_assit
//
//  Created by MagicStudio on 13-8-4.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "personalInfo.h"
#include "pictureHeader.h"
@interface room : UIViewController <UITableViewDataSource,UITableViewDelegate>{
    UITableView *_tableView;
    id          _delegate;
    NSMutableArray  *roommatesInfo ;
    personalInfo    *detailInfo;
    int flag ;
}
@property(nonatomic,retain)id   delegate;
- (id)initWithRoommates:(NSMutableArray *)roomates;
@end
