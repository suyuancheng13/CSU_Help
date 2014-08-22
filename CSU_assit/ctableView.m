//
//  starCity.m
//  CSU_assit
//
//  Created by MagicStudio on 13-7-17.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "ctableView.h"
#import "CSU_assitViewController.h"

@implementation ctableView

@synthesize del = _del;
- (id)init:(NSArray *)name second:(NSArray *)filename header:(NSString *)header
{
   self = [super init];
    _tabletitle = [[NSArray alloc ]initWithArray: name];
    _filename = [[NSArray alloc ]initWithArray: filename];
    _header = header;
    return self;
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _root = [[UITableView alloc]init];
//    _tabletitle = [NSArray arrayWithObjects:@"旅游",@"饮食",@"购物",@"娱乐" ,nil];
//    _filename = [NSArray arrayWithObjects:@"tour",@"bite1",@"entertainment",@"shopping" ,nil];

    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:tablebackview]];
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
    [_text release];
    [_tabletitle release];
    [_filename release];
    
    
    [_textcontent release];
    
     [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
   
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

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
    return _header;    
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
      NSLog(@"%@",[_filename objectAtIndex:indexPath.row]);
     NSRange txt;
     txt = [[_filename objectAtIndex:indexPath.row] rangeOfString:@".jpg" ];
     UIImageView *img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[_filename objectAtIndex:indexPath.row]]];
    CGRect frame = img.bounds;
    frame.size.width = [UIScreen mainScreen].bounds.size.width;
   
    [img setFrame:frame];
    if(!txt.length)
    {
        _text = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[_filename objectAtIndex:indexPath.row] ofType: @"txt"] encoding:NSUTF8StringEncoding error:nil];
        _textcontent = [[textView alloc]init:_text];
    }
    else
    {
        
        _textcontent = [[textView alloc]initWithImageView:img];
    }
    [_textcontent setTitle:[_tabletitle objectAtIndex:indexPath.row]];
    [((CSU_assitViewController *)self.del).navigationController pushViewController:_textcontent animated:YES];
    [_textcontent release];
//        switch (indexPath.row) {
//        case 0:
//               // _filename =[NSArray arrayWithObject:nil];
//             //   NSLog(@"%@",[_filename objectAtIndex:indexPath.row]);
//               
//                if(!txt.length)
//                {
//                _text = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[_filename objectAtIndex:indexPath.row] ofType: @"txt"] encoding:NSUTF8StringEncoding error:nil];
//                _textcontent = [[textView alloc]init:_text];
//                }
//                else
//                {
//
//                    _textcontent = [[textView alloc]initWithImageView:img];
//                }
//                [_textcontent setTitle:[_tabletitle objectAtIndex:indexPath.row]];
//                [((CSU_assitViewController *)self.del).navigationController pushViewController:_textcontent animated:YES];
//                [_textcontent release];
//                break;
//        case 1:
//                if(!txt.length)
//                {
//                    _text = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[_filename objectAtIndex:indexPath.row] ofType: @"txt"] encoding:NSUTF8StringEncoding error:nil];
//                    _textcontent = [[textView alloc]init:_text];
//                }
//                else
//                {
//                    _textcontent = [[textView alloc]initWithImageView:img];
//                }
//                [_textcontent setTitle:[_tabletitle objectAtIndex:indexPath.row]];
//                [((CSU_assitViewController*)self.del).navigationController pushViewController:_textcontent animated:YES]; 
//                [_textcontent release];
//                break;
//        case 2:
//                if(!txt.length)
//                {
//                    _text = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[_filename objectAtIndex:indexPath.row] ofType: @"txt"] encoding:NSUTF8StringEncoding error:nil];
//                    _textcontent = [[textView alloc]init:_text];
//                }
//                else
//                {
//                    _textcontent = [[textView alloc]initWithImageView:img];
//                }
//               
//                [_textcontent setTitle:[_tabletitle objectAtIndex:indexPath.row]];
//                [((CSU_assitViewController *)self.del).navigationController pushViewController:_textcontent animated:YES]; 
//                [_textcontent release];
//                break;
//        case 3:
//                if(!txt.length)
//                {
//                _text = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[_filename objectAtIndex:indexPath.row] ofType: @"txt"] encoding:NSUTF8StringEncoding error:nil];
//                _textcontent = [[textView alloc]init:_text];
//                }
//                else
//                {
//                    _textcontent = [[textView alloc]initWithImageView:img];
//                }
//                [_textcontent setTitle:[_tabletitle objectAtIndex:indexPath.row]];
//                [((CSU_assitViewController *)self.del).navigationController pushViewController:_textcontent animated:YES]; 
//                [_textcontent release];
//                break;
//            case 4:
//                if(txt.length)
//                {
//                    _text = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[_filename objectAtIndex:indexPath.row] ofType: @"txt"] encoding:NSUTF8StringEncoding error:nil];
//                    _textcontent = [[textView alloc]init:_text];
//                }
//                else
//                {
//                    _textcontent = [[textView alloc]initWithImageView:img];
//                }
//                [_textcontent setTitle:[_tabletitle objectAtIndex:indexPath.row]];
//                [((CSU_assitViewController *)self.del).navigationController pushViewController:_textcontent animated:YES]; 
//                [_textcontent release];
//                break;
//
//            case 5:
//                if(txt.length)
//                {
//                    _text = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[_filename objectAtIndex:indexPath.row] ofType: @"txt"] encoding:NSUTF8StringEncoding error:nil];
//                    _textcontent = [[textView alloc]init:_text];
//                }
//                else
//                {
//                    _textcontent = [[textView alloc]initWithImageView:img];
//                }
//                [_textcontent setTitle:[_tabletitle objectAtIndex:indexPath.row]];
//                [((CSU_assitViewController *)self.del).navigationController pushViewController:_textcontent animated:YES]; 
//                [_textcontent release];
//                break;
//
//            case 6:
//                if(txt.length)
//                {
//                    _text = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[_filename objectAtIndex:indexPath.row] ofType: @"txt"] encoding:NSUTF8StringEncoding error:nil];
//                    _textcontent = [[textView alloc]init:_text];
//                }
//                else
//                {
//                    _textcontent = [[textView alloc]initWithImageView:img];
//                }
//                [_textcontent setTitle:[_tabletitle objectAtIndex:indexPath.row]];
//                [((CSU_assitViewController *)self.del).navigationController pushViewController:_textcontent animated:YES]; 
//                [_textcontent release];
//                break;
//
//            
//        default:
//            break;
//    }
}

@end
