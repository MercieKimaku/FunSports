//
//  ViewController.m
//  MusicApp
//
//  Created by ilabadmin on 8/12/16.
//  Copyright © 2016 softikoda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)playVideo:(id)sender {
 NSString *path=[[NSBundle mainBundle] pathForResource:@"werrason" ofType:@"mp4"];
    moviePlayer = [[MPMoviePlayerViewController alloc]initWithContentURL:[NSURL fileURLWithPath:path]];
    [self presentModalViewController:moviePlayer animated:NO];
}

- (IBAction)playAudio:(UIButton *)sender {
    NSString *buttonText=sender.titleLabel.text;
    
    NSString *path=[[NSBundle mainBundle] pathForResource:@"mbiliabel" ofType:@"mp3"];
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
    if([buttonText isEqualToString:@"Play Audio"]){
   [audioPlayer play];
        [sender setTitle:@"Pause Audio" forState:UIControlStateNormal];
    }
    else if([buttonText isEqualToString:@"Pause Audio"]){
      [audioPlayer pause];
        [sender setTitle:@"Play Audio" forState:UIControlStateNormal];
    }
}

@end
