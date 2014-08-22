//
//  campusInfo.h
//  CSU_assit
//
//  Created by MagicStudio on 13-7-18.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "textView.h"
#include "pictureHeader.h"
@interface campusInfo : UIViewController<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource> {
    
//    id              _del;
//    UITableView     *_root;
//    NSString        *_text;  
//    NSArray         *_infoName;  
//    textView        *_showImg;
//    UIImageView     *_imgView;
     UIScrollView            *_rootView;
}
@property (nonatomic, retain) id del;
@end
