//
//  room.m
//  CSU_assit
//
//  Created by MagicStudio on 13-8-4.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "room.h"
#import "CSU_assitViewController.h"

@implementation room
@synthesize delegate = _delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithRoommates:(NSMutableArray *)roomates
{

    self = [super init];
   // roommatesInfo = [[NSMutableArray alloc]initWithCapacity:4];
    roommatesInfo = roomates;
    flag = 1;
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
//    if(1 != flag)
//    { 
//        roommatesInfo = [[NSMutableArray alloc]initWithCapacity:6];
//       // roommatesInfo = 
//    }
    _tableView = [[UITableView alloc]init ];
    [_tableView setEditing:NO];
    [_tableView setScrollEnabled:NO];
    [_tableView setDelegate: self];
    [_tableView setDataSource:self];
    
    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:roomateInfoback]];
    [_tableView setBackgroundView:img];
    [img release];
    [self setView:_tableView];
}

- (void)viewDidUnload
{
    [_tableView release];
    [roommatesInfo release];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
   
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma  mark- the datasource of tableview
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
   return @"Roommate Info";
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int count = [roommatesInfo count];
    return count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
   if(0 != [roommatesInfo count])
   {
       [cell.textLabel setText:[[roommatesInfo objectAtIndex:indexPath.row]objectAtIndex:0]];
   }
    return cell;
    
}
#pragma mark- tableview delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.row) {
        case 0:
            detailInfo = [[personalInfo alloc]initWithInfo:[roommatesInfo objectAtIndex:0]];break;
        case 1:
             detailInfo = [[personalInfo alloc]initWithInfo:[roommatesInfo objectAtIndex:1]];break;
        case 2:
             detailInfo = [[personalInfo alloc]initWithInfo:[roommatesInfo objectAtIndex:2]];break;
        case 3:
             detailInfo = [[personalInfo alloc]initWithInfo:[roommatesInfo objectAtIndex:3]];break;
        default:return;
    }
    detailInfo.delegate = self;
    [detailInfo setTitle:@"室友信息"];
    [( (CSU_assitViewController*)(self.delegate)).navigationController pushViewController:detailInfo animated:YES];
    [detailInfo release];
}

@end
