//
//  Web.h
//  CSU_assit
//
//  Created by MagicStudio on 13-8-18.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Web : UIViewController<UIWebViewDelegate>{
    UIWebView       *_webView;
    UIActivityIndicatorView   *actView;
}
@property(nonatomic,retain)id delegate;

@end
