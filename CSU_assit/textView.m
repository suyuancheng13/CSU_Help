//
//  aboutView.m
//  CSU_assit
//
//  Created by MagicStudio on 13-7-17.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "textView.h"


@implementation textView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(id)init:(NSString *)content
{
    self = [super init];
    _content = content;
    _imgView = nil;
    return self;
}

- (id) initWithImageView:(UIImageView *)img
{
    self = [super init];
    _imgView = img;
    return self;
}
- (void)dealloc
{
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
    // Do any additional setup after loading the view from its nib.
    if(nil == _imgView)
    {
    text = [[UITextView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [text setText:_content];
    [text setEditable:NO];
    //[text setZoomScale:2];
   // [text setFont:]]
     
    [self setView:text];
    }
    else
    {
        UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:_imgView.bounds];
        [scrollView addSubview:_imgView];
        [scrollView setScrollEnabled:YES];
         scrollView.bounces = NO;
        [scrollView setContentSize:CGSizeMake(310,_imgView.bounds.size.height*1.9)];
        // NSLog(@"%f",_imgView.bounds.size.height);
        [scrollView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
        [scrollView setAutoresizesSubviews:YES];
        [scrollView setHidden:NO];
        [scrollView setShowsHorizontalScrollIndicator:NO];
        [scrollView setShowsVerticalScrollIndicator:YES];
        //[scrollView setZoomScale:2];
        [scrollView setMinimumZoomScale:0.5];
        [scrollView setMaximumZoomScale:2.0];
        [scrollView setDelegate:self];
        [self.view addSubview:scrollView];
       /// [self.view ]
        [scrollView release];
        
    }
}

- (void)viewDidUnload
{
   [_content release];
   [text release];
    [_imgView release];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView     // return a view that will be scaled. if delegate returns nil, nothing happens
{
    return scrollView;
}
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view // called before the scroll view begins zooming its content
{
    
}
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale // scale between minimum and maximum. called after any 'bounce' animations
{
}

@end
