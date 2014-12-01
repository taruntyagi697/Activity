/**
 * The MIT License (MIT)
 *
 * Created by Tarun Tyagi on 01/12/14.
 * Copyright (c) 2014 Tarun Tyagi. All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 **/

#import <UIKit/UIKit.h>

typedef enum
{
    ActivityStyleAppStoreBlue = 1,
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
}StyleActivity;

@interface Activity : UIView

// Designated Initializer
-(instancetype)initWithStyle:(StyleActivity)style;

/*
 * Activity Style, Default is 'ActivityAppStoreBlue'
 * Doesn't compromise with style's default values at all
 * Overwrites all the other properties with Style's default values
 * Careful with setStyle: while customizing
**/
@property(assign,nonatomic)StyleActivity style;

// Colors for Ring & Circulator(smaller one, revolving around)
@property(strong,nonatomic)UIColor* ringTintColor;
@property(strong,nonatomic)UIColor* circulatorTintColor;

// thickness for Ring. Default is '1.0'
@property(assign,nonatomic)CGFloat ringThickness;

/**
 * ringSize is the width of view i.e. diameter of the ring, consider r = d/2. 
 * Default is '28.0'
**/
@property(assign,nonatomic)CGFloat ringSize;

// Duration for completing one Revolution. By Default '1.0'
@property(assign,nonatomic)CGFloat durationForOneRevolution;

// Animation control support
-(void)startAnimating;
-(void)stopAnimating;

@end
