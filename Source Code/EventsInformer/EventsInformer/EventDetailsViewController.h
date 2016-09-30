//
//  EventDetailsViewController.h
//  EventsInformer
//
//  Created by AnthonyB on 30/09/2016.
//  Copyright © 2016 anto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"

@interface EventDetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *eventPhoto;
@property (weak, nonatomic) IBOutlet UILabel *eventName;
@property (weak, nonatomic) IBOutlet UILabel *eventDate;
@property (weak, nonatomic) IBOutlet UILabel *eventAount;
@property (nonatomic, strong) Event *event;
@end
