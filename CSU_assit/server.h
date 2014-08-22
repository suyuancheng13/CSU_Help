//
//  server.h
//  CSU_assit
//
//  Created by MagicStudio on 13-8-7.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface server : UIViewController {
    
}
+ (NSString *)Login:(NSString *)user pwd:(NSString *)password;
+ (NSMutableArray *)getBasic:(NSString *)uid;
+ (NSMutableString *)getRoom:(NSString *)roomId;
+ (NSMutableArray *)getRoommate:(NSString *)roomId;
@end
