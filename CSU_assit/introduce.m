//
//  introduce.m
//  CSU_assit
//
//  Created by MagicStudio on 13-8-15.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "introduce.h"

#include "pictureHeader.h"
@implementation introduce

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (id)initWithViewController:(UIViewController *)controller animation:(UIModalTransitionStyle)transition delay:(NSTimeInterval)seconds {
	self = [super init];
	
	if (self) {
        
        [self.view addSubview:[[[UIImageView alloc] initWithImage:[UIImage imageNamed:welcome]] autorelease]];
		[controller setModalTransitionStyle:transition];
		[NSTimer scheduledTimerWithTimeInterval:seconds target:self selector:@selector(timerFireMethod:) userInfo:controller repeats:NO];
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
- (void)timerFireMethod:(NSTimer *)theTimer {
	[self presentModalViewController:[theTimer userInfo] animated:YES];
}


@end
