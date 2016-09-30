//
//  ListViewController.m
//  LoginApp
//
//  Created by ilabafrica on 11/08/2016.
//  Copyright © 2016 ilabafrica. All rights reserved.
//

#import "ListViewController.h"
#import "Events.h"


@interface ListViewController ()

@end

@implementation ListViewController{
    NSArray *event;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    Events *eve1=[Events new];
    eve1.name=@"Cook Out";
    eve1.details=@"At Ole Sereni";
    eve1.image=@"cook.jpg";
    
    Events *eve2=[Events new];
    eve2.name=@"Motor Racing";
    eve2.details=@"At Chaka Ranch";
    eve2.image=@"motor.jpeg";
    
    Events *eve3=[Events new];
    eve3.name=@"Golfers Party";
    eve3.details=@"At Safari Park";
    eve3.image=@"golf.jpeg";
    
    Events *eve4=[Events new];
    eve4.name=@"Grace weds Evans";
    eve4.details=@"At Diani Beach";
    eve4.image=@"download.jpeg";
    
    
    event=[NSArray arrayWithObjects:eve1,eve2,eve3,eve4, nil];
    
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

-(NSInteger) tableView:(UITableView *) tableView numberOfRowsInSection: (NSInteger) section
{
    return[event count];
    
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *cellIdentifier = @"eventItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell==nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    Events *lang = ((Events*) event[indexPath.row]);
    cell.textLabel.text =lang.name;
    [cell.detailTextLabel setText:lang.details];
    
    cell.imageView.image = [UIImage imageNamed:lang.image];
    
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSInteger index = [self.myTableView indexPathForSelectedRow].row;
    
    if([segue.identifier isEqualToString: @"eventIdentifier"]){
        [(PreviewViewController *) segue.destinationViewController setEvents:
         [self objectInListAtIndex: index]];
        
    }}

-(Events *)objectInListAtIndex: (NSInteger) index{
    return [event objectAtIndex: index];
}


@end
