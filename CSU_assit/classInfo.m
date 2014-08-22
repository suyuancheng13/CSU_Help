//
//  classInfo.m
//  CSU_assit
//
//  Created by MagicStudio on 13-8-3.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "classInfo.h"
#import "CSU_assitViewController.h"

dispatch_queue_t dis_q;

@implementation classInfo
@synthesize delegate = _delegate;
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
    [_tableView release];
    [_list release];
    [indicatoeView release];
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
    
    roommatesInfo = [[NSMutableArray alloc]initWithCapacity:4];
    dis_q = dispatch_queue_create("classinfo", nil);
    _list = [[NSArray alloc]initWithObjects:@"室友信息",@"寝室信息", nil];
    indicatoeView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicatoeView.frame = CGRectMake([self.view center].x-25,[self.view center].y-150 ,50, 50);
    
    _tableView = [[UITableView alloc]init];
    [_tableView setDelegate:self];
    [_tableView setDataSource: self];
    [_tableView setEditing:NO];
    [_tableView setScrollEnabled:NO];
    [_tableView addSubview:indicatoeView];
    
    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:search]];
    [_tableView setBackgroundView:img];
    [self setView:_tableView];
    
    [[self.navigationController navigationBar]setHidden:NO];
    [img release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    [_tableView release];
    [_list release];
    [roommatesInfo release];
    [roommates release];
    [indicatoeView release];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#pragma mark- 
#pragma mark table data source
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
   return @"Search for";
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }

    [cell.textLabel setText:[_list objectAtIndex:indexPath.row]];
    return cell;
}
#pragma mark-
#pragma mark table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   // NSString *soapMessage;
    switch (indexPath.row) {
        case 0:
        {
//           if(0 != [((CSU_assitViewController*)(self.delegate)).roommate count])
            {
                //just for test
                NSMutableArray *tem = [NSMutableArray arrayWithObjects:@"suyuancheng",@"it",@"it",@"it",@"it",nil];

                [roommatesInfo removeAllObjects];
                [roommatesInfo insertObject:tem atIndex:0];   
                showRoom = [[room alloc]initWithRoommates:roommatesInfo];
                showRoom.delegate = ((CSU_assitViewController*)(self.delegate));
                [showRoom setTitle:@"室友信息"];
                [((CSU_assitViewController*)(self.delegate)).navigationController pushViewController:showRoom animated:YES];
                [showRoom release];
            
            }
//            else
//            {
//                [indicatoeView setHidden:NO];
//                [indicatoeView startAnimating];
//                [[self.delegate navigationController] setNavigationBarHidden:YES animated:YES];
//                
//                dispatch_async(dis_q, ^
//                               { [self getRoommate];}
//                               );
//            }
        }
            break;
        case 1:
        {
            if(![ ((CSU_assitViewController*)(self.delegate)).roomInfo isEqualToString:@""])
            {
                UIAlertView *room = [[UIAlertView alloc]initWithTitle:@"Room Info" message:((CSU_assitViewController*)(self.delegate)).roomInfo delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [room show];
                [room release];
                
            }
            else
            {
                [indicatoeView setHidden:NO];
                [indicatoeView startAnimating];
                [[self.delegate navigationController] setNavigationBarHidden:YES animated:YES];

                dispatch_async(dis_q, ^
                               { [self getRoom];}
                               );
            }
            
            break;
        }
            
    }
}

//get the roomate's sno
- (void)getRoommate
{
    roommates =((CSU_assitViewController *)self.delegate).roommate = [server getRoommate:[((CSU_assitViewController *)self.delegate).basicInfo objectAtIndex:5]];
    //get the detail information for every one in the room
    [self getBasic];
    ((CSU_assitViewController *)self.delegate).roommatesInfo = roommatesInfo ;
    
    [indicatoeView setHidden:YES];
    [indicatoeView stopAnimating];
    [[self.delegate navigationController] setNavigationBarHidden:NO animated:YES];
    
    //enter the show roomates interface
    showRoom = [[room alloc]initWithRoommates:roommatesInfo];
    showRoom.delegate = ((CSU_assitViewController*)(self.delegate));
    [showRoom setTitle:@"室友信息"];
    [((CSU_assitViewController*)(self.delegate)).navigationController pushViewController:showRoom animated:YES];
    [showRoom release];

}

//get the roommates' detail information
- (NSMutableArray *)getBasic
{
    NSMutableArray *info =[[NSMutableArray alloc]init];
    for(int i =0 ;i<[roommates count] ;i++)
    {
        info =  [server getBasic:[roommates objectAtIndex:i]];
        [roommatesInfo insertObject:info atIndex:i];
    }
    
    [info release];
}

//get the user's room
- (void)getRoom
{
    NSMutableString *result= [server getRoom:[((CSU_assitViewController *)self.delegate).basicInfo objectAtIndex:5]];
    ((CSU_assitViewController *)(self.delegate)).roomInfo = result;
    [[self.delegate navigationController] setNavigationBarHidden:NO animated:YES];
    
    [indicatoeView setHidden:YES];
    [indicatoeView stopAnimating];
    UIAlertView *room = [[UIAlertView alloc]initWithTitle:@"Room Info" message:result delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [room show];
    [room release];
    [result release];
   
}

@end
