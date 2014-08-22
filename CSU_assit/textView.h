//
//  aboutView.h
//  CSU_assit
//
//  Created by MagicStudio on 13-7-17.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface textView : UIViewController <UIScrollViewDelegate>{
    NSString *_content;
    UITextView *text;
    UIImageView *_imgView;
   
}
- (id) init:(NSString *)content;
- (id) initWithImageView:(UIImageView *)img;
@end
