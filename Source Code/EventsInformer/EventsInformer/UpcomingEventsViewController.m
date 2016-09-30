//
//  UpcomingEventsViewController.m
//  EventsInformer
//
//  Created by AnthonyB on 29/09/2016.
//  Copyright © 2016 anto. All rights reserved.
//

#import "UpcomingEventsViewController.h"
#import "NewEventViewController.h"
#import "EventDetailsViewController.h"

@interface UpcomingEventsViewController (){
    NSMutableArray *myEvents;
    
    // A dictionary object
    NSDictionary *dict;
    
    // Define keys
    NSString *Event_id;
    NSString *Name;
    NSString *Date;
    NSString *Amount;
    NSString *Photo_url;
    NSString *TotalLikes;
    NSString *IsAttending;
    
}

@end


@implementation UpcomingEventsViewController
@synthesize upcomingEventsTable=_upcomingventsTable;
@synthesize category_id=_category_id;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // Key Definition
        Event_id= @"event_id";
        Name= @"name";
        Date= @"date";
        Amount= @"amount";
        Photo_url= @"photo_url";
    //_category_id=@"1";
    NSString *status=@"1";
    NSString *facebook_id=@"1";
  //  NSString *category_id =@"1";
    
    NSString *url=[NSString stringWithFormat:@"http://whuzgoin.com/FunMoments/event.php?category_id=%@&status=%@&facebook_id=%@",_category_id,status,facebook_id];
    
    myEvents = [[NSMutableArray alloc] init];
NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    
    NSObject *obj = [jsonObjects valueForKey:@"events"];
    
    NSLog(@"Returned data %@",obj);
    // values in foreach loop
    for (NSDictionary *dataDict in obj) {
        NSString *strEvent_id = [dataDict objectForKey:Event_id];
        NSString *strName = [dataDict objectForKey:Name];
        NSString *strDate= [dataDict objectForKey:Date];
        NSString *strAmount = [dataDict objectForKey:Amount];
        NSString *strPhoto_url = [dataDict objectForKey:Photo_url];
            //    NSString *strTel = [dataDict objectForKey:@"Tel"];
        dict = [NSDictionary dictionaryWithObjectsAndKeys:
                strEvent_id, Event_id,
                strName, Name,
                strDate, Date,
                strAmount, Amount,
                strPhoto_url,Photo_url,
                nil];
        [myEvents addObject:dict];
    }
    
    
//    // Working with the tab bar to move to other pages
//    UITabBarController *tbc = [self.storyboard instantiateViewControllerWithIdentifier:@"MainTabBar"];
//    if (tbc.selectedIndex==0) {
//        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle: nil];
//        
//      NewEventViewController *modalViewController = (NewEventViewController *)[mainStoryboard
//                                                                         instantiateViewControllerWithIdentifier: @"CBTab2ViewController"];
//        
//        [self presentViewController:modalViewController animated:YES completion:nil];
//       // [self presentViewController:tbc animated:YES completion:nil];
//    }
//      else if (tbc.selectedIndex==1) {
//            [self presentViewController:tbc animated:YES completion:nil];
//        }
//            else if (tbc.selectedIndex==2) {
//                [self presentViewController:tbc animated:YES completion:nil];
//            }
   }

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = NO;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return myEvents.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        // Use the default cell style.
        cell = [[UITableViewCell alloc] initWithStyle : UITableViewCellStyleSubtitle
                                            reuseIdentifier : CellIdentifier];
    }
    
    NSDictionary *tmpDict = [myEvents objectAtIndex:indexPath.row];
    
    // MemberID
    NSMutableString *text= [NSString stringWithFormat:@"%@",[tmpDict objectForKey:Name]];
    
    // Name & Tel
    NSMutableString *detail;
    detail = [NSString stringWithFormat:@"Date : %@ , Amount : %@ Photo_url : %@"
              ,[tmpDict objectForKey:Date]
              ,[tmpDict objectForKey:Amount]
              ,[tmpDict objectForKey:Photo_url]];
    
    cell.textLabel.text = text;
    cell.detailTextLabel.text= detail;
    
    //[tmpDict objectForKey:memberid]
    //[tmpDict objectForKey:name]
    //[tmpDict objectForKey:tel]
    return cell;
}

- (void)didReceiveMemoryWarning
{
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

@end
