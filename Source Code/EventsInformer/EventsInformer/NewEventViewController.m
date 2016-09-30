//
//  NewEventViewController.m
//  EventsInformer
//
//  Created by AnthonyB on 23/09/2016.
//  Copyright © 2016 anto. All rights reserved.
//

#import "NewEventViewController.h"

@interface NewEventViewController ()

@end

@implementation NewEventViewController
@synthesize eventName = _eventName;
@synthesize eventAmount = _eventAmount;
NSString *dateSelected;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addEvent:(id)sender {
    NSString *noteDataString = [NSString stringWithFormat:@"event_name=%@&amount=%@", _eventName.text, _eventAmount.text];
    NSData *postData=[noteDataString dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long) [postData length]];
    NSString *url= @"http://whuzgoin.com/FunMoments/addEvent.php";
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    [request setURL:[NSURL URLWithString: url]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if (!conn) {
        NSLog(@"Failed to connect to server");
    }
    
}

-(void) connection:(NSURLConnection *)connection didReceiveData:(nonnull NSData *)data{
    NSString *respondContent= [[NSString alloc]initWithData:data  encoding:NSUTF8StringEncoding];
    NSString *respond = @"";
    
    if ([respondContent isEqualToString:@"1"]) {
        
        respond= @"Delivered";
    }
    else{
        respond =@" Not Delivered";
    }
    
  //  UIViewAler
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"%@", error.localizedDescription);
}
-(void)connectionDidFinishLoading:(NSURLConnection *) connection{}



/*
- (IBAction)addEvent:(id)sender {
    NSString *noteDataString = [NSString stringWithFormat:@"name=%@&date=%@", _eventName.text, _eventAmount.text];
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    NSURL * url = [NSURL URLWithString:@"http://whuzgoin.com/FunMoments/addEvent.php"];
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setHTTPBody:[noteDataString dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLSessionDataTask * dataTask =[defaultSession dataTaskWithRequest:urlRequest completionHandler:^(NSData *dataRaw, NSURLResponse *header, NSError *error) {
        NSDictionary *json = [NSJSONSerialization
                              JSONObjectWithData:dataRaw
                              options:kNilOptions error:&error];
        NSString *status = json[@"status"];
        
        if([status isEqual:@"1"]){
            //Success
            NSLog(@"Succesfully saved to databse");
        } else {
            //Error
            
        }
    }];
    
    [dataTask resume];
}*/

@end
