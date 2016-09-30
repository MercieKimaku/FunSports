//
//  UpcomingEventsViewController.h
//  EventsInformer
//
//  Created by AnthonyB on 29/09/2016.
//  Copyright © 2016 anto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewEventViewController.h"
#import "MyEventsViewController.h"


@interface UpcomingEventsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *upcomingEventsTable;
@property (nonatomic) NSString *category_id;
//@property (nonatomic) NSString *status;
//@property (nonatomic) NSString *facebook_id;
//@property (nonatomic) NSArray *groupArray;
@end
