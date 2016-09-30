//
//  ViewController.h
//  MusicApp
//
//  Created by ilabadmin on 8/12/16.
//  Copyright © 2016 softikoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController{
AVAudioPlayer *audioPlayer;
    MPMoviePlayerViewController *moviePlayer;
    //AVPlayerViewController *movieplayer1;
}
- (IBAction)playVideo:(id)sender;
- (IBAction)playAudio:(UIButton *)sender;


@end

