//
//  login.h
//  CSU_assit
//
//  Created by MagicStudio on 13-7-24.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "server.h"

@interface login : UIViewController<UITextFieldDelegate,UIAlertViewDelegate> {
    
  
    UITextField *pwd;
    UITextField *username1;
    UIActivityIndicatorView *activityView;
    id              _delegate;
    UIAlertView *alertView;
    UIView *acview;

    UIButton *loginButton;
    
    UIImageView *backgroud;
}
@property (nonatomic, retain) IBOutlet UIImageView *backgroud;
@property (nonatomic, retain) IBOutlet UIButton *loginButton;

@property (nonatomic, retain) IBOutlet UITextField *pwd;
@property (nonatomic, retain) IBOutlet UITextField *username1;
@property(nonatomic,retain)  id  delegate;
- (IBAction)loginAction:(id)sender;
- (IBAction)endEdit:(id)sender;
- (BOOL)Login;
- (BOOL)getBasic;
- (void)alert:(NSString *)title message:(NSString *)message;
@end
