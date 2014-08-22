//
//  CSU_assitViewController.h
//  CSU_assit
//
//  Created by MagicStudio on 13-7-14.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Freshmen.h"
#import "textView.h"
#import "ctableView.h"
#import "procolloge.h"
#import "CSU.h"
#import "map.h"
#include "login.h"
#import "personalInfo.h"
#import "classInfo.h"
#include "pictureHeader.h"
#import "introduce.h"
#import "Web.h"

@interface CSU_assitViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,UIGestureRecognizerDelegate> {
    ctableView      *changsha;
    UITableView     *_tableView;
    UIView          *mainView;
    UIScrollView    *scrollView;
    CGPoint         down;
    CGPoint         up;
    Boolean         _left,_right;
    NSArray         *data;
    Freshmen        *freshmen;
    textView        *about;
    procolloge      *procollege;
    CSU             *csu;
    UIActivityIndicatorView *activity;
    map             *mapView;
    UIView *view;
    login           *loginView;
    personalInfo    *personalInfoView;
    classInfo       *classInfoView;
    Web             *web;
    
    NSString        *_uId;
    NSMutableArray  *_basicInfo;
    NSMutableString *_roomInfo;
    NSMutableArray  *_roommate;
    NSMutableArray  *_roommatesInfo;

}
@property(nonatomic,retain) NSString *uId;
@property(nonatomic,retain)NSMutableArray *basicInfo;
@property(nonatomic,retain)NSMutableString *roomInfo;
@property(nonatomic,retain)NSMutableArray *roommate;
@property(nonatomic,retain)NSMutableArray *roommatesInfo;
- (void)onTap:(id)sender;
- (void)left;
- (void)mainaddView;
- (void)overTimer;
@end
