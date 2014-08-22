//
//  mapLocation.m
//  CSU_assit
//
//  Created by MagicStudio on 13-7-24.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "mapLocation.h"


@implementation mapLocation
@synthesize state = _state;
@synthesize street = _street;
@synthesize city = _city;
@synthesize location = _location;
- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)dealloc
{
    [_city release];
    [_state release];
    [_street release] ;
    [super dealloc];
}

- (NSString *)title
{
    return @"Your location is:";
}
- (NSString *)subtitle
{
    NSMutableString *re = [[NSMutableString alloc]init];
    if(_street)
    {
        [re appendString:_street];
    }
    if(_street &&(_city||_state))
    {
        [re appendString:@"."];
    }
    if(_city)
    {
        [re appendString:_city];
    }
    if(_city && _state)
    {
        [re appendString:@","];
    }
    if(_state)
    {
        [re appendString:_state];
        
    }
    return re;
    
}
- (CLLocationCoordinate2D)coordinate
{
    return _location;
}
@end
