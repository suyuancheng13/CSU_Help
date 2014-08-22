//
//  starCity.h
//  CSU_assit
//
//  Created by MagicStudio on 13-7-17.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "textView.h"
//#import"CSU_assitViewController.h"

@interface ctableView : UIViewController<UITableViewDelegate,UITableViewDataSource> {
    NSArray         *_tabletitle;
    NSArray         *_filename;
    id              _del;
    UITableView     *_root;
    textView        *_textcontent;
    NSString       *_text;
    NSString        *_header;
    
}
@property (nonatomic, retain) id del;
- (id)init:(NSArray *)name second:(NSArray *)filename header:(NSString *)header;
@end
