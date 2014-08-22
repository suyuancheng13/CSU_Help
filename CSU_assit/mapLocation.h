//
//  mapLocation.h
//  CSU_assit
//
//  Created by MagicStudio on 13-7-24.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import<MapKit/MapKit.h>

@interface mapLocation : NSObject<MKAnnotation> {
    NSString   *_street;
    NSString    *_city; 
    NSString    *_state;
    CLLocationCoordinate2D      _location;
    
}
@property(nonatomic ,retain)NSString * street;
@property(nonatomic ,retain)NSString * city;
@property(nonatomic ,retain)NSString * state;
@property(nonatomic,readwrite)CLLocationCoordinate2D location;
@end