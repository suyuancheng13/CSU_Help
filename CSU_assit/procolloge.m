//
//  procolloge.m
//  CSU_assit
//
//  Created by MagicStudio on 13-7-18.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "procolloge.h"
#import "CSU_assitViewController.h"


@implementation procolloge
@synthesize del=_del;

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
    _root = [[UITableView alloc]init];
    _tabletitle = [NSArray arrayWithObjects:@"入学指导",@"成长成才",@"学生权益",nil];
  //  _filename = [NSArray arrayWithObjects:@"tour",@"bite1",@"entertainment",@"shopping" ,nil];
    
    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:collogeback]];
    [_root setBackgroundView:img];
    [_root setScrollEnabled:NO];
    [_root setDelegate:self];
    [_root setDataSource:self];
    [_root setEditing:NO];
    [self setView:_root];
    [img release];
}

- (void)viewDidUnload
{
    [_root release];
    [_textcontent release];
    [_text  release];  
    [_tabletitle release]; 
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
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    
    return [_tabletitle count];
    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"study";    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    // if(indexPath.row < [_talbetitle count])
    
    [cell.textLabel setText:[_tabletitle objectAtIndex:indexPath.row]];
    return cell;
}
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            // _filename =[NSArray arrayWithObject:nil];
            //   NSLog(@"%@",[_filename objectAtIndex:indexPath.row]);
            _text = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"enter" ofType: @"txt"] encoding:NSUTF8StringEncoding error:nil];
            
            _textcontent = [[textView alloc]init:_text];
            [_textcontent setTitle:@"入学指导"];
            [((CSU_assitViewController *)self.del).navigationController pushViewController:_textcontent animated:YES];
            [_textcontent release];
            break;
        case 1:
            _text = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"growup" ofType: @"txt"] encoding:NSUTF8StringEncoding error:nil];
            _textcontent = [[textView alloc]init:_text];
            [_textcontent setTitle:@"成长成才"];
            [((CSU_assitViewController*)self.del).navigationController pushViewController:_textcontent animated:YES]; 
            [_textcontent release];
            break;
        case 2:
            _text = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"power" ofType: @"txt"] encoding:NSUTF8StringEncoding error:nil];
            _textcontent = [[textView alloc]init:_text];
            [_textcontent setTitle:@"权益"];
            [((CSU_assitViewController *)self.del).navigationController pushViewController:_textcontent animated:YES]; 
            [_textcontent release];
            break;
        default:
            break;
    }
}


@end
