//
//  ViewController.h
//  EventsInformer
//
//  Created by AnthonyB on 19/09/2016.
//  Copyright © 2016 anto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UpcomingEventsViewController.h"
@interface CategoriesViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *buttonMotorRacing;
@property (weak, nonatomic) IBOutlet UIButton *buttonPaintball;
@property (weak, nonatomic) IBOutlet UIButton *buttonSwimming;
@property (weak, nonatomic) IBOutlet UIButton *buttonCycling;
@property (nonatomic) NSString *categoryId;

@end

