//
//  personalInfo.m
//  CSU_assit
//
//  Created by MagicStudio on 13-8-3.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "personalInfo.h"
#import "CSU_assitViewController.h"

dispatch_queue_t dispatch_queue;

@implementation personalInfo
@synthesize tableviewr;
@synthesize textField;
@synthesize delegate = _delegate;
@synthesize toolBar;
@synthesize toolbar;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (id)initWithInfo:(NSMutableArray *)info
{
    self = [super init];
    infoList = info;
    return self;
}
- (void)dealloc
{
    [tableviewr release];
    [toolbar release];
    [toolBar release];
    [textField release];
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
    //if(((CSU_assitViewController *)(self.delegate)).basicInfo)
    
   //[[NSMutableArray alloc]initWithCapacity:6];
    
  //  tableView = [[UITableView alloc]init ];
//    [tableView setDataSource:self];
//    [tableView setDelegate:self];
//    [tableView setScrollEnabled:NO];
//    [tableView setEditing:NO];
    UIBarButtonItem* rightUButon = [[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(Edit ) ];
    [self.navigationItem setRightBarButtonItem:rightUButon];
   // UIToolbar *toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-50, [UIScreen mainScreen].bounds.size.width, 50)];
  
   
   // UITextField *filed = [[UITextField alloc]initWithFrame:toolbar.bounds];
  //  NSArray *f = [[NSArray alloc]initWithObjects:filed, nil];
    //[toolbar setItems:f];
    //[tableView addSubview:toolbar];
    //[self.toolbarItems ]
    //[tableView set]
   
    activityView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityView.frame = CGRectMake([self.view center].x-25,[self.view center].y-150 ,50, 50);
    [tableView addSubview:activityView];
   
    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:personalInfoback]];
//    [tableView setBackgroundView:img];
//    [img release];
//    [tableView setHidden:NO];
    
    showKeyboard = 1;
    [textField setSecureTextEntry:YES];
    [tableviewr setDelegate:self];
    [tableviewr setDataSource:self];
    [tableviewr setDataSource:self];
    [tableviewr setDelegate:self];
    [tableviewr setScrollEnabled:NO];
    [tableviewr setEditing:NO];
    [tableviewr setBackgroundView:img];
     [tableviewr addSubview:activityView];
    [toolBar setHidden:YES];
    //[self.view addSubview:tableView];
    
    //regist the key board will appear action
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillHideNotification object:nil];
    
}

- (void)viewDidUnload
{
    [self setTableviewr:nil];
    [self setToolbar:nil];
    [self setToolBar:nil];
    [self setTextField:nil];
    [super viewDidUnload];
    [tableView release];
    [infoList release];
    [activityView release];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardWillShowNotification object:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    // it will not to get the info from the server if has searched 
    if(0 != [infoList count])
        return ;
    
    dispatch_queue = dispatch_queue_create("getbaseinfo", nil);
    [acview setHidden:NO];
    [activityView setHidden:NO];
    [activityView startAnimating];
    [[self.delegate navigationController] setNavigationBarHidden:YES animated:YES];

    dispatch_async(dispatch_queue, ^{
        [self getBaseInfo];
    });
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark- edit action
- (void)Edit
{
   // if([((CSU_assitViewController*)(self.delegate)).uId isEqualToString:(NSString *)[[NSUserDefaults standardUserDefaults]objectForKey:@"UID"]])
    if([[self.navigationItem rightBarButtonItem].title isEqualToString:@"Edit"])
    {
        
        [[self.navigationItem rightBarButtonItem]setTitle:@"Editting"];
        [tableviewr setEditing:YES];
        [[self navigationItem]setHidesBackButton:YES animated:YES];
    }
    else    if([[self.navigationItem rightBarButtonItem].title isEqualToString:@"Editting"])
    {
        [[self.navigationItem rightBarButtonItem]setTitle:@"Edit"];
        [tableviewr setEditing:NO];
        [toolBar setHidden:YES];
        [[self navigationItem]setHidesBackButton:NO animated:YES];        
    }
}
- (void)keyboardWillShow:(NSNotification *)notification
{
    NSDictionary *userInfo = [notification userInfo];
    NSValue *value = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGFloat endY = [value CGRectValue].size.height;
    CGRect frame = toolBar.frame;
    
    if(!showKeyboard)//hide the keyboard
    {
        frame.origin.y += endY;
        showKeyboard = 1;
    }
    else//show the keyboard
    {
        frame.origin.y -= endY;
    }
    [toolBar setFrame:frame];
}

- (IBAction)done:(id)sender {
    showKeyboard = 0;
    if(![textField.text isEqualToString:@""])
    {
        [infoList insertObject:textField.text atIndex:row];
        index = 0;
        [tableviewr reloadData];
        [textField setText:@""];
        [toolBar setHidden:YES];
    }
    [textField resignFirstResponder];
    
}
#pragma mark- get information from the service
- (NSMutableArray *)getBaseInfo
{
    if(0 ==[((CSU_assitViewController *)self.delegate).basicInfo count ])
    {
        infoList= ((CSU_assitViewController *)self.delegate).basicInfo = [server getBasic:((CSU_assitViewController *)self.delegate).uId];
        if(0 ==[((CSU_assitViewController *)self.delegate).basicInfo count ])
        {
            dispatch_async(dispatch_get_main_queue(), ^
                           {
                               [self alert:@"获取信息失败" message:nil];
                           });
        }
        else
        {
            dispatch_async(dispatch_get_main_queue(), ^
                           {
                               [self alert:@"get" message:nil];
                           });
            
        }
    }
    else
    {
        infoList = ((CSU_assitViewController *)self.delegate).basicInfo;
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [self alert:@"get" message:nil];
                       });

    }

}
- (void)alert:(NSString *)title message:(NSString *)message
{
    //enable the ui
    [[self.delegate navigationController] setNavigationBarHidden:NO animated:YES];
    
    //hide the activitiview
    [activityView stopAnimating];
    [activityView setHidden:YES];
    
    if([title isEqualToString:@"get"])
    {
         [tableView reloadData];
        return;
    }
     UIAlertView *alertViewo = nil;
        alertViewo = [[UIAlertView alloc]
                      initWithTitle:title
                      message:message
                      delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil, nil];
   
    [alertViewo show];
    [alertViewo release];
    return ;
    
}


#pragma mark- 
#pragma mark table data source
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:return @"Name:";break;
        case 1:return @"Class";break;
        case 2:return @"Academy";break;
        case 3:return @"QQ";break;
        case 4:return @"MobilePhone";break;
        default:break;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
   
    if(0 != [infoList count])
    {
    
        [cell.textLabel setText:[infoList objectAtIndex:index++]];
    }

    return cell;

}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 3||indexPath.section == 4)
        return YES;
    else
        return NO;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(UITableViewCellEditingStyleDelete == editingStyle)
    {
        [[tableView  cellForRowAtIndexPath:indexPath ].textLabel setText:@""];
    }
    if(UITableViewCellEditingStyleInsert == editingStyle)
    {
        [toolBar setHidden:NO];
        row = indexPath.section;
      //  [[tableviewr  cellForRowAtIndexPath:indexPath ].textLabel setText:@""];

    }
}

//the edit style
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleInsert;
}

@end
