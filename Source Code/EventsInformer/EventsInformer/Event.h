//
//  Event.h
//  EventsInformer
//
//  Created by AnthonyB on 30/09/2016.
//  Copyright © 2016 anto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject
@property (nonatomic, strong) NSString *name; // name of event
@property (nonatomic, strong) NSString *date; // event description
@property (nonatomic, strong) NSString *image; // event logo
@property (nonatomic, strong) NSString *amount;

@end
