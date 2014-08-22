//
//  Web.m
//  CSU_assit
//
//  Created by MagicStudio on 13-8-18.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "Web.h"


@implementation Web
@synthesize delegate;
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
    _webView = [[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _webView.scalesPageToFit = YES;
    [_webView setDelegate: self];
    NSString *surl=@"http://newcomer.its.csu.edu.cn/LogPrompt.aspx";
    NSURL *url = [[NSURL alloc]initWithString:surl];
    NSURLRequest *urlRes = [[NSURLRequest alloc]initWithURL:url];
    [_webView loadRequest:urlRes];
    actView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    actView.frame =CGRectMake(0, 0, 32, 32);
    [actView setCenter:_webView.center];
    [_webView addSubview:actView];
    [self setView:_webView];    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    [_webView release];
    [actView release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [actView startAnimating];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [actView stopAnimating];
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Request error" message:[error localizedDescription] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
}

@end
