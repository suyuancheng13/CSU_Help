//
//  campusInfo.m
//  CSU_assit
//
//  Created by MagicStudio on 13-7-18.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "campusInfo.h"
#import "CSU_assitViewController.h"


@implementation campusInfo

@synthesize del = _del;

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
//    _root = [[UITableView alloc]init];
//    _infoName= [ [NSArray alloc] init ];
//    _infoName = [ NSArray arrayWithObjects:@"学校介绍",@"学校概况",@"校园信息",nil];
//   // printf("%d", [_titles count]);
//   // _tabletitle = [NSArray arrayWithObjects:@"校园交通",@"中南大学作息时间",@"学习资源信息",nil];
//    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wzcs_back.png"]];
//    [_root setBackgroundView:img];
//    [_root setScrollEnabled:NO];
//    [_root setDelegate:self];
//    [_root setDataSource:self];
//    [_root setEditing:NO];
//    [self setView:_root];
//    [img release];
    float width = [UIScreen mainScreen].bounds.size.width-10;
    float height = [UIScreen mainScreen].bounds.size.height-50;
    float cap = 5;
    CGRect frame,frame1,frame2;
    // Do any additional setup after loading the view from its nib.
    UIImageView *imgview1 =[ [UIImageView alloc]initWithImage:[UIImage imageNamed:campusbackview1]];
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
    [imgview2 setImage:[UIImage imageNamed:campusbackview2]];
    
    
    UIImageView *imgview3 =[ [UIImageView alloc]initWithImage:[UIImage imageNamed:campusbackview3]];
    frame2.origin.x =2*width+20+cap;
    frame2.origin.y = 0;
    frame2.size.width = width;
    frame2.size.height = height;
    ;
    [imgview3 setFrame:frame2];
    
    UIImageView *imgview4 =[ [UIImageView alloc]initWithImage:[UIImage imageNamed:campusbackview4]];
    frame2.origin.x =3*width+30+cap;
    frame2.origin.y = 0;
    frame2.size.width = width;
    frame2.size.height = height;
    ;
    [imgview4 setFrame:frame2];
    _rootView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 10, 0)];
    //_rootView.
    [_rootView setContentSize:CGRectMake(0, 0, 4*width+40, 0).size];
    _rootView.bounces = NO;
    [_rootView setContentInset:UIEdgeInsetsZero];
    //[_rootView setScrollEnabled:YES];
    [_rootView setPagingEnabled:YES];
    [_rootView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    [_rootView setAutoresizesSubviews:YES];
    [_rootView setHidden:NO];
    [_rootView setDelegate: self];
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
    [_rootView release];
//    [_infoName release];
   
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#pragma mark - table data
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{   //printf("%d",[_tabletitle count]);
   // return [_infoName count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Campus Info";    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
   // [ cell.textLabel setText:[_infoName objectAtIndex:indexPath.row ] ];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    switch (indexPath.row) {
//        case 0:
//            _imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"campus1.png"]];
//            _showImg = [[textView alloc]initWithImageView:_imgView];
//            [_showImg setTitle:@" 校园交通"];
//            [((CSU_assitViewController *)((CSU *)self.del).del).navigationController pushViewController:_showImg animated:YES];
//            [_showImg release];
//            [_imgView release];
//            break;
//        case 1:
////            
////            [((CSU_assitViewController*)self.del).navigationController pushViewController:_textcontent animated:YES]; 
////            [_showImg release];
//            break;
//        case 2:
////            
////            [((CSU_assitViewController *)self.del).navigationController pushViewController:_textcontent animated:YES]; 
////            [_showImg release];
//            break;
//        default:
//            break;
//    }
}

@end
