//
//  map.m
//  CSU_assit
//
//  Created by MagicStudio on 13-7-24.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "map.h"


@implementation map
@synthesize _map;

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
    [_map release];
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
    activityView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [activityView setCenter:[self.view center]];
    activityView.hidden = NO;
    [activityView startAnimating];
    [self.view addSubview:activityView];
}

- (void)viewDidUnload
{
    [_map release];
    [activityView release];
    [locationManager release];
    [self set_map:nil];
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
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(newLocation.coordinate, 500, 500);
    MKCoordinateRegion adjustRegion = [_map regionThatFits:viewRegion];
    [_map setRegion:adjustRegion animated:YES];
    [locationManager setDelegate: nil ];
    [locationManager stopUpdatingLocation];
    mapLocation *mapannot = [[mapLocation alloc]init];
  
    CLGeocoder *coder = [[CLGeocoder alloc]init];
    [coder reverseGeocodeLocation: newLocation completionHandler:^(NSArray *array, NSError *error) { 
        if (array.count > 0) { 
            CLPlacemark *placemark = [array objectAtIndex:0]; 
            mapannot.street = placemark.thoroughfare;
            mapannot.state = placemark.administrativeArea;
            mapannot.city = placemark.locality;
            mapannot.location =placemark.location.coordinate;
            [_map addAnnotation:mapannot];            
            [activityView stopAnimating];
            [activityView setHidden:YES];
        } 
     }]; 
    
}

//coder the geography info
//- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)placemark
//{
//   mapLocation *mapannot = [[mapLocation alloc]init];
//    mapannot.street = placemark.thoroughfare;
//    mapannot.state = placemark.administrativeArea;
//    mapannot.city = placemark.locality;
//    mapannot.location = geocoder.coordinate;
//    
//    [_map addAnnotation:mapannot];
//    
//    [activityView stopAnimating];
//    [activityView setHidden:YES];
//    
//}

#pragma  mark- map view delegate
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    // MKAnnotationView pin =[MKAnnotationView alloc]ini
    MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"PIN_ANNOTATION"];
    if(annotationView == nil) {
        annotationView = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                                          reuseIdentifier:@"PIN_ANNOTATION"] autorelease];
    }
    annotationView.canShowCallout = YES;
    annotationView.pinColor = MKPinAnnotationColorRed;
    annotationView.animatesDrop = YES;
    annotationView.highlighted = YES;
    annotationView.draggable = YES;
    annotationView.enabled = YES;
    annotationView.selected = YES;
    return annotationView;
}
- (void)mapViewDidFailLoadingMap:(MKMapView *)theMapView withError:(NSError *)error {
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"地图加载错误"
                          message:[error localizedDescription]
                          delegate:nil
                          cancelButtonTitle:@"Ok"
                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}

@end
