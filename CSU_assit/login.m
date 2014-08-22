//
//  login.m
//  CSU_assit
//
//  Created by MagicStudio on 13-7-24.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "login.h"
#import "Reachability.h"
#import "CSU_assitViewController.h"
#import "server.h"
@implementation login
@synthesize backgroud;
@synthesize loginButton;
@synthesize pwd;
@synthesize username1;
@synthesize delegate = _delegate;

dispatch_queue_t dispatch_queue;

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
    [pwd release];
    [username1 release];
    [loginButton release];
    [backgroud release];
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
 
    [pwd setEnabled:YES];
    [username1 setEnabled:YES];
    [pwd setDelegate:self];
    [username1 setDelegate:self];
    acview = [[UIView alloc]init];
    activityView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    acview.frame =CGRectMake([self.view center].x-100,[self.view center].y-100 ,200, 50);
    activityView.frame = CGRectMake(70,0 ,50, 50);
    
    [acview addSubview:activityView];
    [acview setHidden:YES];
    [acview setClipsToBounds:YES];
    [acview setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview: acview];
    [acview release];
   
}

- (void)viewDidUnload
{
   
    [self setPwd:nil];
    [self setUsername1:nil];
    [activityView release];
    [self setLoginButton:nil];
    [self setBackgroud:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//login in action
- (IBAction)loginAction:(id)sender {
    
    Reachability *reachAble = [Reachability reachabilityForInternetConnection];
    
    //TODO:fail to connect the network
    if([reachAble currentReachabilityStatus] ==NotReachable)
    {
        UIAlertView *alerView = [[UIAlertView alloc]initWithTitle:@"Network status" message:@"NO connection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alerView show];
        [alerView release];
        
    }
    else
    {
        //TODO: connect the network
        [acview setHidden:NO];
        [activityView setHidden:NO];
        [activityView startAnimating];
        [loginButton setEnabled:NO];
        [username1 setEnabled:NO];
        [pwd setEnabled:NO];
        [[self.delegate navigationController] setNavigationBarHidden:YES animated:YES];
        dispatch_queue = dispatch_queue_create("dispatch queue", nil);
        dispatch_async(dispatch_queue, ^{
            [self Login];
            
        }
        );

    }
 
}
- (BOOL)Login 
{
    NSString * message = [server Login:username1.text pwd:pwd.text];
    NSString *title ;
    if([message isEqualToString:@"error"]||[message isEqualToString:@"failed"])
    {
     title = @"登入失败";
    }
    else
    {
        title = @"登陆成功!";
        ((CSU_assitViewController *)(self.delegate)).uId = message;
        
        [[NSUserDefaults standardUserDefaults]setObject:message forKey:@"UID"]; 
        [self getBasic];
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [self alert:title message:nil];
    }
                   );
    return YES;
    
    

}
- (BOOL)getBasic
{
    ((CSU_assitViewController *)self.delegate).basicInfo = [server getBasic:((CSU_assitViewController *)self.delegate).uId];
    [[NSUserDefaults standardUserDefaults]setObject:((CSU_assitViewController *)self.delegate).basicInfo forKey:@"PERSONALINFO"];
    return  YES;
    
}
- (void)alert:(NSString *)title message:(NSString *)message
{
    NSLog(@"%@",message);
    //enable the ui
    [loginButton setEnabled:YES];
    [username1 setEnabled:YES];
    [pwd setEnabled:YES];
    [[self.delegate navigationController] setNavigationBarHidden:NO animated:YES];

    //hide the activitiview
    [acview setHidden:YES];
    [activityView stopAnimating];
    [activityView setHidden:YES];
    
    UIAlertView *alertViewo = nil;
    if([title isEqualToString:@"登陆成功!"] )
    {        
        alertViewo = [[UIAlertView alloc]
                      initWithTitle:title 
                      message:message 
                      delegate:self 
                      cancelButtonTitle:@"OK" 
                      otherButtonTitles:nil, nil];
        
    }
    else{
     alertViewo = [[UIAlertView alloc]
                              initWithTitle:title
                              message:@"check the connection ,username or password!"
                              delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil, nil];
    }
    [alertViewo show];
    [alertViewo release];
    return ;

}

//the alerview click  event to pop the view 
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(0 == buttonIndex )
    {
        [[self.delegate navigationController]popViewControllerAnimated:YES];
        
    }
}

//disappear the key board
- (IBAction)endEdit:(id)sender
{
    [sender resignFirstResponder];
}

//limit to 20 characters
//-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    if([string isEqualToString:@"\n"])
//    {
//        return YES;
//    }
//    NSString *tobestring = [textField.text  stringByReplacingCharactersInRange:range withString:string];
//    if([tobestring length]>=20)
//    {
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Input Error" message:@"Too long" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        [alert show];
//        [alert release];
//        return NO;
//    }
//    return YES;
//}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}
@end
