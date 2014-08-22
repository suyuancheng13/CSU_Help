//
//  CSU_assitViewController.m
//  CSU_assit
//
//  Created by MagicStudio on 13-7-14.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "CSU_assitViewController.h"
#import "Freshmen.h"
#include "pictureHeader.h"

dispatch_queue_t mainviewQueue;
@implementation CSU_assitViewController 
@synthesize uId = _uId;
@synthesize basicInfo = _basicInfo;
@synthesize roomInfo = _roomInfo;
@synthesize roommate = _roommate;
@synthesize roommatesInfo = _roommatesInfo;
- (void)dealloc
{
    [scrollView release];
    [mapView release];
    [changsha release];
    [_tableView release];
    [_roommate release];
    [_basicInfo release];    
    [data release]; 
    [freshmen release];
    [about release];
    [procollege release];
    [csu release];
    [activity release];
    [mapView release];
    [personalInfoView release];
    [classInfoView release];
    [super dealloc];
    
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    dispatch_queue_create("mainview", nil);
//    dispatch_async(mainviewQueue, ^
//                   {
//                       introduce *intro = [[introduce alloc]initWithViewController:self animation:UIModalTransitionStyleCrossDissolve delay:2];
//                       
//                    //   [self setView:intro];
////                       UIViewController *controller = [[UIViewController alloc]init];
////                       UIImageView *wel = [[UIImageView alloc]initWithImage:[UIImage imageNamed:welcome]];
////                       //[self setView:wel];
////                       [controller setView:wel];
//                       [self.navigationController pushViewController:intro animated:YES];
////                       [controller release];
//                       
//                   });
    // the side menu
   // data = [NSArray arrayWithObjects:@"Login",@"Personal info",@"search",@"help",@"About",@"Login out", nil];
    data = [NSArray arrayWithObjects:@"帮助",@"关于", nil];
    if([[NSUserDefaults standardUserDefaults]objectForKey:@"UID"])
    {
        _uId = (NSString *)[[NSUserDefaults standardUserDefaults]objectForKey:@"UID"];
    }
    if([[NSUserDefaults standardUserDefaults]objectForKey:@"PERSONALINFO"])
    {
        _basicInfo = (NSMutableArray *)[[NSUserDefaults standardUserDefaults]objectForKey:@"PERSONALINFO"];
    }
    else
    {
        _basicInfo = [[NSMutableArray alloc]initWithCapacity:6];
    }
    _roomInfo = [[NSMutableString alloc]init ];
    _roommate = [[NSMutableArray alloc]initWithCapacity:4];
    
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectZero];
    [scrollView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    [scrollView setAutoresizesSubviews:YES];
    [scrollView setScrollEnabled:YES];
    [scrollView setHidden:NO];
    [scrollView setDelegate: self];
    [scrollView setPagingEnabled:YES];
    [scrollView setShowsHorizontalScrollIndicator:NO];
    [scrollView setShowsHorizontalScrollIndicator:NO];

    CGRect frame1 ;
    frame1.origin.x = 0;
    frame1.origin.y = 0;
    frame1.size.width =0.9* [UIScreen mainScreen].bounds.size.width;
    frame1.size.height = [UIScreen mainScreen].bounds.size.height;
    _tableView = [[UITableView alloc] initWithFrame:frame1];
    UIImageView *imageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:leftSide]];
    [_tableView setBackgroundView:imageview];
    [_tableView setHidden:NO];
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
    [_tableView setScrollEnabled:NO];
    
    CGRect frame2;
    frame2.origin.x = 0;//frame1.size.width;
    frame2.origin.y = 0;
    frame2.size.width = [UIScreen mainScreen].bounds.size.width;
    frame2.size.height = [UIScreen mainScreen].bounds.size.height;
    mainView = [[UIView alloc]initWithFrame:frame2];

    [mainView setHidden:NO];
    [mainView setOpaque:YES];
    [mainView addGestureRecognizer:[[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)] autorelease]];
    
    //add the navigaiton bar
    UINavigationBar *navi = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, frame2.size.width, 45)];
    UINavigationItem *item = [[UINavigationItem alloc] init];    
    UIBarButtonItem *item_button = [[UIBarButtonItem alloc] initWithTitle:@"More" style:UIBarButtonItemStyleBordered target:self action:@selector(left)];
    [item setLeftBarButtonItem:item_button];
    [[item leftBarButtonItem]setStyle:UIBarButtonItemStyleBordered];
    [navi setItems:[NSArray arrayWithObjects:item, nil]];
    [item setTitle:@"中南生活助手"];
    
      UIImageView *img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:mainViewBack]];
    [img setFrame:[UIScreen mainScreen].bounds];
    [mainView addSubview:img];
    [img release];
    [self mainaddView];
    [mainView addSubview:navi];
    
//    [[self.navigationController navigationItem]setLeftBarButtonItem:item_button];
//    [[self.navigationController navigationBar]setHidden:NO];
    
    [scrollView addSubview:_tableView];
    [scrollView addSubview:mainView];
    [self setView:scrollView];
    //[self.view addSubview:scrollView];
    up = down = CGPointZero;
    
      
    [navi release];
    [item_button release];
    [item release];
    [imageview release];
   
    }
- (void)viewWillAppear:(BOOL)animated
{
 
    
    activity = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activity.frame =CGRectMake([mainView center].x-20,[mainView center].y-50 ,50, 50);
   [[self.navigationController navigationBar]setHidden:YES];

    
}
- (void)viewDidAppear:(BOOL)animated
{
//[self.navigationController pushViewController:self animated:YES];
}
- (void)mainaddView
{
 
    float width = [UIScreen mainScreen].bounds.size.width-10;
    float height = [UIScreen mainScreen].bounds.size.height-45;
    float cap_w = width /3;
    float cap_h = height/3;
    int count =1,ind=0;
    NSArray *back = [NSArray arrayWithObjects:@"New.jpg",@"ClassInfo.jpg",@"PreCollege.jpg",@"Guid.jpg",@"CityFun.jpg",@"CSU.jpg",nil];
    NSArray *label = [NSArray arrayWithObjects:@"新生注册",@"班级信息",@"大学预备",@"校园导航",@"玩转长沙",@"认识中南", nil];
    for(int i =0;i<2;i++)
    {
        for(int j=0;j<3;j++)
        {
            UIButton *im_te = [[UIButton alloc]initWithFrame:CGRectMake(j*cap_w+10, 45+i*cap_h, cap_w-10, cap_h-10)];
            CGRect frame = [im_te bounds];
            UILabel *la = [[UILabel alloc]initWithFrame:CGRectMake(frame.origin.x,frame.size.height-30,cap_w-10, 30)];
            [la setText:[label objectAtIndex: ind++]];
            la.backgroundColor = [UIColor clearColor];
            [im_te setImage:[UIImage imageNamed:[back objectAtIndex:ind-1]] forState: UIControlStateNormal];
            [im_te setTag:count++];
            [im_te setHidden:NO];
            [im_te addTarget:self action:@selector(onTap:) forControlEvents:UIControlEventTouchDown];
            [mainView addSubview:im_te];
            
            [im_te release];
            [la release];
        }
    }

}
- (void)viewDidUnload
{
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    //initial the view of the controller
    [_roommatesInfo release];
    [_roomInfo release];
    [scrollView release];
    [mapView release];
    [changsha release];
    [_tableView release];
    [_basicInfo release];
    [_roommate release];    
    [data release]; 
    [freshmen release];
    [about release];
    [procollege release];
    [csu release];
    [activity release];
    [mapView release];
    [personalInfoView release];
    [classInfoView release];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [data count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
   return @"Welcome";    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    [ [cell textLabel ] setText:[data objectAtIndex:indexPath.row] ];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
//        case 0:
//            //login
//            if(NULL !=self.uId)
//            {
//                UIAlertView *alerV= [[UIAlertView alloc]initWithTitle:@"You are online" message:@"You are online" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//                [alerV show];
//                [alerV release];
//            }
//            else
//            {
//                loginView = [[login alloc]initWithNibName:@"login" bundle:nil];
//                [loginView setTitle:@"Login"];
//                loginView.delegate = self;
//                [self.navigationController pushViewController:loginView animated:YES];
//                [[self.navigationController navigationBar]setHidden:NO];
//                [loginView release];
//            }
//            break;
//        case 1:
//            //show the personal info
//            if(NULL ==self.uId)
//            {
//                UIAlertView *alerV= [[UIAlertView alloc]initWithTitle:@" Please Login Firstly" message:@"You haven't logined" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//                [alerV show];
//                [alerV release];
//            }
//            else
//            {
//                personalInfoView = [[personalInfo alloc]init];
//                [personalInfoView setTitle:@"PersonalInfo"];
//                personalInfoView.delegate = self;
//                [self.navigationController pushViewController:personalInfoView animated:YES];
//                [personalInfoView release];   
//            }
//            break;
//        case 2:
//            //
////            if(NULL ==self.uId)
////            {
////                UIAlertView *alerV= [[UIAlertView alloc]initWithTitle:@" Please Login Firstly" message:@"You haven't logined" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
////                [alerV show];
////                [alerV release];
////            }
////            else
//            {
//                classInfoView  = [[classInfo alloc]init];
//                [classInfoView setTitle:@"查询信息"];
//                classInfoView.delegate = self;
//                [self.navigationController pushViewController:classInfoView animated:YES];
//                [[self.navigationController navigationBar]setHidden:NO];
//
//                [classInfoView release];
//            }
//            break;
        case 0:
            about = [[textView alloc]init:@"本应用主要包含六大模块：新生注册导航，班级信息，大学预备知识，校园导航，玩转长沙，认识中南！"];
            [about setTitle:@"Help"];
            [self.navigationController pushViewController:about animated:YES];
            [[self.navigationController navigationBar]setHidden:NO];

            [about release];

            break;
        case 1:
        
            about = [[textView alloc]init:@"本应用为中南大学知道科技（CSUIT）工作室研发产品\n应用特征：本应用主要是针对中南大学新生用户，可以帮助新生有效的了解中南大学及更快地融入校园生活！"];
            [about setTitle:@"About"];
            [self.navigationController pushViewController:about animated:YES];
            [[self.navigationController navigationBar]setHidden:NO];

            [about release];
            break;
//        case 5:
//         //login out is to clear the cookies
//            [[NSUserDefaults standardUserDefaults ]removeObjectForKey:@"UID"];
//            [[NSUserDefaults standardUserDefaults ]removeObjectForKey:@"PERSONALINFO"]; 
//            UIAlertView *Logout = [[UIAlertView alloc]initWithTitle:@"Logout" message:@"You have logouted" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//            [Logout show];
//            [Logout release];
//            break;
//        
        default:
            break;
    }
}


#pragma  mark- action handle
      
-(void)left
{
    CGRect frame = mainView.frame;
    if(frame.origin.x == 0)
    
        frame.origin.x = [[UIScreen mainScreen]bounds].size.width*0.9;
    else
        frame.origin.x = 0;
    [mainView setFrame:frame];
    return ;
    
}
- (void)overTimer
{
    //[view removeFromSuperview];
    [activity stopAnimating];
    [activity setHidden:YES];
}
- (void)onTap:(id)sender
{
    freshmen = [ [Freshmen alloc] init ];
    //[self.navigationController pushViewController:self animated:YES];
    int ind =((UIButton *)sender).tag;
    NSArray *name ;
    NSArray *filename;
    NSString *text;
    switch ( ind) 
    {
        case 1:
            [freshmen setTitle:@"新生注册导航"];
            [self.navigationController pushViewController:freshmen animated:YES];
            [[self.navigationController navigationBar]setHidden:NO];

            [freshmen release];
            break;
        case 2:
            //the class info
//            if(NULL ==self.uId)
//            {
//                UIAlertView *alerV= [[UIAlertView alloc]initWithTitle:@" Please Login Firstly" message:@"You haven't logined" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//                [alerV show];
//                [alerV release];
//            }
//            else
        {
            
                web  = [[Web alloc]init];
                [web setTitle:@"查询信息"];
                web.delegate = self;
                [self.navigationController pushViewController:web animated:YES];
            [[self.navigationController navigationBar]setHidden:NO];

                [classInfoView release];
            }
            break;
        case 3:
            name = [NSArray arrayWithObjects:@"一、入学指导",@"    适应军训",@"    适应学习",@"    适应生活",@"    入学安全",@"二、成长成才",@"三、学生权益",nil];
            filename = [NSArray arrayWithObjects:@"入学指导--开始.jpg",@"入学指导--适应军训.jpg",@"入学指导--适应学习.jpg",@"入学指导--适应生活.jpg",@"入学指导--入学安全.jpg",@"growup",@"power" ,nil];
            changsha = [[ctableView alloc]init:name second:filename header:@"Study"];
            // changsha =[[ctableView alloc]init];
            changsha.del =self;
            [changsha setTitle:@"大学预备知识"];
            [self.navigationController pushViewController:changsha animated:YES];
            [[self.navigationController navigationBar]setHidden:NO];

            [changsha release];
//             procollege = [[procolloge alloc] init];
//            procollege.del = self;
//            [procollege setTitle:@"大学预备知识"];
//            [self.navigationController pushViewController:procollege animated:YES];
//            [procollege release];
            break;
        case 4:
            mapView = [[map alloc]init];
            [mapView setTitle:@"校园导航"];
            [self.navigationController pushViewController:mapView animated:YES];
            [[self.navigationController navigationBar]setHidden:NO];

            [mapView release];
            break;
        case 5:
            name = [NSArray arrayWithObjects:@"旅游",@"饮食",@"娱乐",@"购物" ,nil];
            filename = [NSArray arrayWithObjects:@"tour",@"bite1",@"entertainment",@"shopping" ,nil];
            changsha = [[ctableView alloc]init:name second:filename header:@"City fun"];
            // changsha =[[ctableView alloc]init];
            changsha.del =self;
            [changsha setTitle:@"玩转长沙"];
            [self.navigationController pushViewController:changsha animated:YES];
            [[self.navigationController navigationBar]setHidden:NO];

            [changsha release];
            break;
        case 6:
            csu = [[CSU alloc]init];
            csu.del = self;
            [csu setTitle:@"认识中南"];
            [self.navigationController pushViewController:csu animated:YES];
            [[self.navigationController navigationBar]setHidden:NO];

            [csu release];

            break;
            
            
    }
    
}

//show or hide the side menu 
- (void)pan:(UIPanGestureRecognizer *)sender
{  
    float cap = [[UIScreen mainScreen]bounds].size.width*0.9;
    float v_X = [sender velocityInView:mainView].x;//point /second
    if(v_X>0)
    {
        _left = YES;
    }
    else
    {
        _right = YES;
    }
    
    CGPoint point = [sender translationInView:mainView];
    [sender setTranslation:CGPointZero inView:mainView];
    
    float contentX = mainView.frame.origin.x;
    if(_left)
    {
        contentX +=point.x;
        if(contentX > cap)
        {
            contentX = cap;
        }
        else if(contentX < 0)
        {
            contentX = 0;
        }
    }
    else if(_right)
    {
        contentX += point.x;
        if(contentX >cap)
        {
            contentX = cap;
        }
        else if(contentX < 0)
        {
            contentX = 0;
        }
    }
      
      CGRect frame = mainView.frame;
      frame.origin.x = contentX;
      mainView.frame= frame;
      
      if(sender.state == UIGestureRecognizerStateCancelled || sender.state == UIGestureRecognizerStateEnded)
      {
          float v_X = [sender velocityInView:mainView].x;
          float diff = 0;
          float finishedX = 0;
          if(_left)
          {
              if(v_X > 0 && contentX >0.4*cap)
              {
                  diff = cap - contentX;
                  finishedX = cap;
             }
              else
              {
                  diff = contentX;
                  finishedX = 0;
                  
              }
          }
          else if(_right)
          {
              if(v_X > 0 && contentX <0.4*cap)
              {
                  diff = contentX;
                  finishedX = 0;
                
              }
              else
              {
                  diff = contentX + cap;
                  finishedX = 0;
                
              }
          }
          CGRect frame = mainView.frame;
          frame.origin.x = finishedX;
          mainView.frame= frame;
      }
      

      
}
      
@end
