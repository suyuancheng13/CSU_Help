//
//  map.h
//  CSU_assit
//
//  Created by MagicStudio on 13-7-24.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Mapkit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "mapLocation.h"
@interface map : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate,MKReverseGeocoderDelegate> {
    MKMapView           *_map;
    UIActivityIndicatorView *activityView;
    CLLocationManager   *locationManager;
    
}

@end
