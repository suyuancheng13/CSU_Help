//
//  procolloge.h
//  CSU_assit
//
//  Created by MagicStudio on 13-7-18.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "textView.h"

@interface procolloge : UIViewController<UITableViewDelegate,UITableViewDataSource> {
    id              _del;
    UITableView     *_root;
    textView        *_textcontent;
    NSString       *_text;  
    NSArray         *_tabletitle;    
}
@property (nonatomic, retain) id del;
@end
