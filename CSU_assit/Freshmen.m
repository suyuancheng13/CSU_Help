//
//  Freshmen.m
//  CSU_assit
//
//  Created by MagicStudio on 13-7-16.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "Freshmen.h"


@implementation Freshmen

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [_rootView  release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    ///[self.navigationController setDelegate:self];
    float width = [UIScreen mainScreen].bounds.size.width-10;
    float height = [UIScreen mainScreen].bounds.size.height-50;
    float cap = 5;
    CGRect frame,frame1,frame2;
    // Do any additional setup after loading the view from its nib.
    UIImageView *imgview1 =[ [UIImageView alloc]initWithImage:[UIImage imageNamed:@"step1.jpg"]];
    frame.origin.x =cap;
    frame.origin.y = 0;
    frame.size.width = width;
    frame.size.height = height;
    [imgview1 setFrame:frame];
    
   
    frame1.origin.x =width+10+cap;
    frame1.origin.y = 0;
    frame1.size.width = width;
    frame1.size.height = height;
    //[imgview2 setFrame:frame1];
    UIImageView *imgview2 =[ [UIImageView alloc]initWithFrame:frame1 ];
    [imgview2 setImage:[UIImage imageNamed:@"step2.jpg"]];
 
    
    UIImageView *imgview3 =[ [UIImageView alloc]initWithImage:[UIImage imageNamed:@"step3.jpg"]];
    frame2.origin.x =2*width+20+cap;
    frame2.origin.y = 0;
    frame2.size.width = width;
    frame2.size.height = height;
    ;
    [imgview3 setFrame:frame2];
   
    UIImageView *imgview4 =[ [UIImageView alloc]initWithImage:[UIImage imageNamed:@"注册导航4.jpg"]];
    frame2.origin.x =3*width+30+cap;
    frame2.origin.y = 0;
    frame2.size.width = width;
    frame2.size.height = height;
    ;
    [imgview4 setFrame:frame2];
    _rootView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 10, 0)];
    [_rootView setContentSize:CGRectMake(0, 0, 4*width+40, 0).size];
    _rootView.bounces = NO;
    [_rootView setContentInset:UIEdgeInsetsZero];
    //[_rootView setScrollEnabled:YES];
    [_rootView setPagingEnabled:YES];
    [_rootView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    [_rootView setAutoresizesSubviews:YES];
    [_rootView setHidden:NO];
    [_rootView setDelegate: self];//scroll view 将uivewcontroller 设置自己作为代理
    [_rootView setShowsHorizontalScrollIndicator:NO];
    [_rootView setShowsHorizontalScrollIndicator:NO];
   
    [_rootView addSubview:imgview1];
    [_rootView addSubview:imgview2];
    [_rootView addSubview:imgview3];
    [_rootView addSubview:imgview4];
    [self setView:_rootView];
   
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
