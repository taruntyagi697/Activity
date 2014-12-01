//
//  ViewController.m
//  iOS7LoadingActivity
//
//  Created by Tarun Tyagi on 01/12/14.
//  Copyright (c) 2014 Tarun Tyagi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    NSUInteger styles[18] =
    {
        ActivityStyleAppStoreBlue,
        ActivityStyleMusicRed,
        
        /*** Color References - http://flatuicolors.com/ ***/
        ActivityStyleTorquoise/*rgba(26, 188, 156, 1)*/,
        ActivityStyleGreenSea/*rgba(22, 160, 133, 1)*/,
        
        ActivityStyleEmerald/*rgba(46, 204, 113, 1)*/,
        ActivityStyleNephritis/*rgba(39, 174, 96, 1)*/,
        
        ActivityStylePeterRiver/*rgba(52, 152, 219, 1)*/,
        ActivityStyleBelizeHole/*rgba(41, 128, 185, 1)*/,
        
        ActivityStyleAmethyst/*rgba(155, 89, 182, 1)*/,
        ActivityStyleWisteria/*rgba(142, 68, 173, 1)*/,
        
        ActivityStyleWetAsphalt/*rgba(52, 73, 94, 1)*/,
        ActivityStyleMidnightBlue/*rgba(44, 62, 80, 1)*/,
        
        ActivityStyleSunFlower/*rgba(241, 196, 15, 1)*/,
        ActivityStyleOrange/*rgba(243, 156, 18, 1)*/,
        
        ActivityStyleCarrot/*rgba(230, 126, 34, 1)*/,
        ActivityStylePumpkin/*rgba(211, 84, 0, 1)*/,
        
        ActivityStyleAlizarin/*rgba(231, 76, 60, 1)*/,
        ActivityStylePomegranate/*rgba(192, 57, 43, 1)*/
    };
    
    for(int i=0; i<18; i++)
    {
        Activity* activity = [[Activity alloc] initWithStyle:(StyleActivity)(styles[i])];
        [self.view addSubview:activity];
        [activity performSelector:@selector(startAnimating) withObject:nil afterDelay:(i*0.1)];
        
        activity.frame = CGRectMake(i*40+10, 50, 30, 30);
    }
    
    // Works from Nib/Storyboard too
    [nibActivity startAnimating];
    
    /**
     * Only considers frame.origin.x, fram.origin.y, frame.size ignored
     * frame.size set automatically according to RingSize
     **/
    nibActivity.frame = CGRectMake(160, 300, 100, 100);
    
    // 100% Customizable
    nibActivity.ringThickness = 3;
    nibActivity.ringSize = 100;
    nibActivity.ringTintColor = [UIColor darkGrayColor];
    
    [nibActivity setCirculatorTintColor:[UIColor lightGrayColor]];
}

@end
