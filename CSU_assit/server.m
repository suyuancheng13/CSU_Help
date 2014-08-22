//
//  server.m
//  CSU_assit
//
//  Created by MagicStudio on 13-8-7.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "server.h"


@implementation server

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
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark- sever function
+ (NSString *)Login:(NSString *)user pwd:(NSString *)password
{
    NSString *message= [NSString stringWithFormat:@"userName=%@&passWord=%@",user,password];
    NSString *surl = [NSString stringWithFormat:@"http://my.its.csu.edu.cn/"];
    NSURL *url = [NSURL URLWithString:[surl stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    [theRequest addValue: @"text/xml; charset=utf-8"forHTTPHeaderField:@"Content-Type"];
    [theRequest setHTTPMethod:@"POST"];
    NSString *mslength = [NSString stringWithFormat:@"%d",[message length]];
     [theRequest addValue:mslength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPBody:[message dataUsingEncoding:NSUTF8StringEncoding]];
    NSURLResponse *reponse;
    NSError *error = nil;
    NSLog(@"%@",theRequest);
    //put数据之后的返回信息
    NSData *responseData = [NSURLConnection sendSynchronousRequest:theRequest returningResponse:&reponse error:&error];
    NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
//        NSString *soapMessage = [NSString stringWithFormat:
//                                 @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n "
//                                 @"<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n" 
//                                 @" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\"\n " 
//                                 @"xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
//                                 @"<soap:Body>\n"
//                                 @"<WebMethod:Login xmlns:WebMethod= \"http://Service\">\n" //namespace
//                                 @"<uid>%@</uid>\n"                        
//                                 @"<password>%@</password>\n"                        
//                                 @"</WebMethod:Login>\n"
//                                 @"</soap:Body>\n"
//                                 @"</soap:Envelope>\n" ,user,password];     
//        
//        //the service address
//        NSString *surl = [NSString stringWithFormat:@"http://198.74.97.66:8080/axis2/services/LoginService"];
//        NSURL *url = [NSURL URLWithString:[surl stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
//        NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
//        NSString *mslength = [NSString stringWithFormat:@"%d",[soapMessage length]];
//        [theRequest addValue: @"text/xml; charset=utf-8"forHTTPHeaderField:@"Content-Type"];
//        [theRequest addValue:@"\"http://schemas.xmlsoap.org/wsdl/LoginRequest\"" forHTTPHeaderField:@"soapAction"];
//        [theRequest addValue:mslength forHTTPHeaderField:@"Content-Length"];
//        [theRequest setHTTPMethod:@"POST"];
//        [theRequest setHTTPBody:[soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
//        
//        
//        NSURLResponse *reponse;
//        NSError *error = nil;
//        
//        //put数据之后的返回信息
//        NSData *responseData = [NSURLConnection sendSynchronousRequest:theRequest returningResponse:&reponse error:&error];
//        
//        if(error)
//        {
//            return @"error";
//        }
//        else
//        {
//            if(responseData)
//            {
//                NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
//                NSRange range = [responseString rangeOfString:@"uid"];
//                if (range.length)
//                {
//                    range.length = 6;
//                    range.location +=4;
//                    return [responseString substringWithRange:range];
//                }else
//                {
//                   return @"failed";
//                }         
//                [responseString release];
//                return YES;
//            }
//        }
    
}

+(NSMutableArray *)getBasic:(NSString *)uid
{
    NSMutableArray *infoList = [[NSMutableArray alloc]initWithCapacity:6];
    NSString *soapMessage = [NSString stringWithFormat:
                             @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n "
                             @"<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"" 
                             @" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" " 
                             @"xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                             @"<soap:Body>\n"
                             @"<WebMethod:getUserBasic xmlns:WebMethod = \"http://Service\">" 
                             @"<uid>%@</uid>\n"                       
                             @"</WebMethod:getUserBasic>\n"
                             @"</soap:Body>"
                             @"</soap:Envelope>" ,uid];     
    
    //the service address
    NSString *surl = [NSString stringWithFormat:@"http://198.74.97.66:8080/axis2/services/getUserBasicService"];
    NSURL *url = [NSURL URLWithString:[surl stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    NSString *mslength = [NSString stringWithFormat:@"%d",[soapMessage length]];
    [theRequest addValue: @"text/xml; charset=utf-8"forHTTPHeaderField:@"Content-Type"];
    [theRequest addValue:@"\"http://schemas.xmlsoap.org/wsdl/getUserBasicRequest\"" forHTTPHeaderField:@"soapAction"];
    [theRequest addValue:mslength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody:[soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLResponse *reponse;
    NSError *error = nil;
    
    //put数据之后的返回信息
    NSData *responseData = [NSURLConnection sendSynchronousRequest:theRequest returningResponse:&reponse error:&error];
    if(error)
    {
       
    }
    else
    {
        if(responseData)
        {
            NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
            NSRange range = [responseString rangeOfString:@"<ns:return>"];
            
            if (range.length)
            {
                range.length = [responseString length]-range.location;
                NSString *tem = [responseString substringWithRange:range];
                
                int  i = 0 ;
                while(i<6)
                {
                    
                    NSRange rangeStart = [tem rangeOfString:@"<ns:return>"];
                    NSRange rangeEnd = [tem rangeOfString:@"</ns:return>"];
                    NSRange rangeo;
                    rangeo.location = rangeStart.location+rangeStart.length;
                    rangeo.length = rangeEnd.location - rangeo.location;
                    NSString *str = [tem substringWithRange:rangeo];
                    [infoList insertObject:str atIndex:i++];
                    rangeo.location = rangeEnd.location + rangeEnd.length;
                    rangeo.length = [tem length]-rangeo.location;
                    tem = [tem substringWithRange:rangeo];
                    
                    
                }
               
            }
            [responseString release];
        }
    }
    return infoList;
    

}
+ (NSMutableArray *)getRoommate:(NSString *)roomId
{
    NSMutableArray * roommates = [[NSMutableArray alloc]initWithCapacity:4];
    NSString *soapMessage = [NSString stringWithFormat:
                             @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n "
                             @"<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"" 
                             @" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" " 
                             @"xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                             @"<soap:Body>\n"
                             @"<WebMethod:getRoommate xmlns:WebMethod = \"http://Service\">" 
                             @"<roomid>%@</roomid>\n"                       
                             @"</WebMethod:getRoommate>\n"
                             @"</soap:Body>"
                             @"</soap:Envelope>" ,roomId];     
    
    //the service address
    NSString *surl = [NSString stringWithFormat:@"http://198.74.97.66:8080/axis2/services/getRoommateService"];
    NSURL *url = [NSURL URLWithString:[surl stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    NSString *mslength = [NSString stringWithFormat:@"%d",[soapMessage length]];
    [theRequest addValue: @"text/xml; charset=utf-8"forHTTPHeaderField:@"Content-Type"];
    [theRequest addValue:@"\"http://schemas.xmlsoap.org/wsdl/getRoommateRequest\"" forHTTPHeaderField:@"soapAction"];
    [theRequest addValue:mslength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody:[soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLResponse *reponse;
    NSError *error = nil;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:theRequest returningResponse:&reponse error:&error];
    
    NSString *re = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    if(responseData)
    {
        NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
        NSRange range = [responseString rangeOfString:@"<ns:return>"];
        NSMutableString *result = [[NSMutableString alloc]init];
        if (range.length)
        {
            range.length = [responseString length]-range.location;
            NSString *tem = [responseString substringWithRange:range];
            
            int  i = 0 ;
            while(i<2)
            {
                // [result appendFormat:@"\n"];
                NSRange rangeStart = [tem rangeOfString:@"<ns:return>"];
                NSRange rangeEnd = [tem rangeOfString:@"</ns:return>"];
                NSRange rangeo;
                rangeo.location = rangeStart.location+rangeStart.length;
                rangeo.length = rangeEnd.location - rangeo.location;
                NSString *str = [tem substringWithRange:rangeo];
               [roommates insertObject:str atIndex:i++];//keep  info
                rangeo.location = rangeEnd.location + rangeEnd.length;
                rangeo.length = [tem length]-rangeo.location;
                tem = [tem substringWithRange:rangeo];
                
                
            }
        }
    }
    return roommates;
}
+ (NSMutableString *)getRoom:(NSString *)roomId
{
    NSString *soapMessage = [NSString stringWithFormat:
                             @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n "
                             @"<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"" 
                             @" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" " 
                             @"xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                             @"<soap:Body>\n"
                             @"<WebMethod:getRoom xmlns:WebMethod = \"http://Service\">" 
                             @"<roomid>%@</roomid>\n"                       
                             @"</WebMethod:getRoom>\n"
                             @"</soap:Body>"
                             @"</soap:Envelope>" ,roomId];     
    
    //the service address
    NSString *surl = [NSString stringWithFormat:@"http://198.74.97.66:8080/axis2/services/getRoomService"];
    NSURL *url = [NSURL URLWithString:[surl stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    NSString *mslength = [NSString stringWithFormat:@"%d",[soapMessage length]];
    [theRequest addValue: @"text/xml; charset=utf-8"forHTTPHeaderField:@"Content-Type"];
    [theRequest addValue:@"\"http://schemas.xmlsoap.org/wsdl/getRoomRequest\"" forHTTPHeaderField:@"soapAction"];
    [theRequest addValue:mslength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody:[soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLResponse *reponse;
    NSError *error = nil;
    
    //put数据之后的返回信息
    NSData *responseData = [NSURLConnection sendSynchronousRequest:theRequest returningResponse:&reponse error:&error];
    
    NSString *re = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    if(responseData)
    {
        NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
        NSRange range = [responseString rangeOfString:@"<ns:return>"];
        NSMutableString *result = [[NSMutableString alloc]init];
        if (range.length)
        {
            range.length = [responseString length]-range.location;
            NSString *tem = [responseString substringWithRange:range];
            
            int  i = 0 ;
            while(i++<2)
            {
                [result appendFormat:@"\n"];
                NSRange rangeStart = [tem rangeOfString:@"<ns:return>"];
                NSRange rangeEnd = [tem rangeOfString:@"</ns:return>"];
                NSRange rangeo;
                rangeo.location = rangeStart.location+rangeStart.length;
                rangeo.length = rangeEnd.location - rangeo.location;
                NSString *str = [tem substringWithRange:rangeo];
                [result appendFormat:str];
                rangeo.location = rangeEnd.location + rangeEnd.length;
                rangeo.length = [tem length]-rangeo.location;
                tem = [tem substringWithRange:rangeo];
                
                
            }
        }
        return result;

        
    }

}
@end
