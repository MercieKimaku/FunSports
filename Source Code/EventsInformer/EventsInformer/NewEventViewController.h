//
//  NewEventViewController.h
//  EventsInformer
//
//  Created by AnthonyB on 23/09/2016.
//  Copyright © 2016 anto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewEventViewController : UIViewController <NSURLConnectionDelegate>
@property (weak, nonatomic) IBOutlet UITextField *eventName;
@property (weak, nonatomic) IBOutlet UITextField *eventAmount;

- (IBAction)addEvent:(id)sender;
@end
