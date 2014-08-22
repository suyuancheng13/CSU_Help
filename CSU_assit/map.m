//
//  map.m
//  CSU_assit
//
//  Created by MagicStudio on 13-7-24.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "map.h"


@implementation map

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
//Users/magicstudio/Desktop/CSU_assit/CSU_assit/成品/注册导航4.jpg [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _map.mapType =MKMapTypeStandard;
    _map.delegate = self;
    
    locationManager = [[CLLocationManager alloc]init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest; 
    [locationManager startUpdatingLocation];
    activityView.hidden = NO;
    [activityView startAnimating];
    [self.view addSubview:activityView];
}

- (void)viewDidUnload
{
    [_map release];
    [activityView release];
    [locationManager release];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#pragma mark- location mananget method

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(newLocation.coordinate, 2000, 2000);
    MKCoordinateRegion adjustRegion = [_map regionThatFits:viewRegion];
    [_map setRegion:adjustRegion animated:YES];
    [locationManager setDelegate: nil ];
    [locationManager stopUpdatingLocation];
    
    MKReverseGeocoder *reverseGrocoder = [[MKReverseGeocoder alloc]initWithCoordinate:newLocation.coordinate];
    [reverseGrocoder setDelegate:self];
    [reverseGrocoder start];   
    
}

//coder the geography info
- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)placemark
{
   mapLocation *mapannot = [[mapLocation alloc]init];
    mapannot.street = placemark.thoroughfare;
    mapannot.state = placemark.administrativeArea;
    mapannot.city = placemark.locality;
    mapannot.location = geocoder.coordinate;
    
    [_map addAnnotation:mapannot];
    
    [activityView stopAnimating];
    [activityView setHidden:YES];
    
}

#pragma  mark- map view delegate
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
   // MKAnnotationView pin =[[MKAnnotationView alloc]init];
}
@end
