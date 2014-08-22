//
//  personalInfo.h
//  CSU_assit
//
//  Created by MagicStudio on 13-8-3.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "server.h"

@interface personalInfo : UIViewController<UITableViewDelegate,UITableViewDataSource> {
    UITableView     *tableView;
    id              _delegate;
    UIToolbar *toolBar;
    UIBarButtonItem *toolbar;
    NSMutableArray         *infoList;
    UIActivityIndicatorView *activityView;
    UIView          *acview;
    int             index;
    UITableView *tableviewr;
    UITextField *textField;
    
    int             showKeyboard;
    int             row;
}
@property (nonatomic, retain) IBOutlet UITableView *tableviewr;
@property (nonatomic, retain) IBOutlet UITextField *textField;

- (IBAction)done:(id)sender;
@property(nonatomic,retain)id   delegate;
@property (nonatomic, retain) IBOutlet UIToolbar *toolBar;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *toolbar;

- (id)initWithInfo:(NSMutableArray *)info;
- (NSMutableArray*)getBaseInfo;
- (void)alert:(NSString *)title message:(NSString*)message;
- (void)Edit;
- (void)keyboardWillShow:(NSNotification *)notification;
@end
