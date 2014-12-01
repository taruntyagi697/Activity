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

#import "Activity.h"
#import <QuartzCore/QuartzCore.h>

#define UIColorWithRGBA(r,g,b,a)\
[UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

// Colors for Activity Styles
#define AppStoreBlueTintColor UIColorWithRGBA(0, 52, 255, 1)
#define MusicRedTintColor     UIColorWithRGBA(255, 0, 69, 1)

#define TorquoiseTintColor    UIColorWithRGBA(26, 188, 156, 1)
#define GreenSeaTintColor     UIColorWithRGBA(22, 160, 133, 1)

#define EmeraldTintColor      UIColorWithRGBA(46, 204, 113, 1)
#define NephritisTintColor    UIColorWithRGBA(39, 174, 96, 1)

#define PeterRiverTintColor   UIColorWithRGBA(52, 152, 219, 1)
#define BelizeHoleTintColor   UIColorWithRGBA(41, 128, 185, 1)

#define AmethystTintColor     UIColorWithRGBA(155, 89, 182, 1)
#define WisteriaTintColor     UIColorWithRGBA(142, 68, 173, 1)

#define WetAsphaltTintColor   UIColorWithRGBA(52, 73, 94, 1)
#define MidnightBlueTintColor UIColorWithRGBA(44, 62, 80, 1)

#define SunFlowerTintColor    UIColorWithRGBA(241, 196, 15, 1)
#define OrangeTintColor       UIColorWithRGBA(243, 156, 18, 1)

#define CarrotTintColor       UIColorWithRGBA(230, 126, 34, 1)
#define PumpkinTintColor      UIColorWithRGBA(211, 84, 0, 1)

#define AlizarinTintColor     UIColorWithRGBA(231, 76, 60, 1)
#define PomegranateTintColor  UIColorWithRGBA(192, 57, 43, 1)

// Default Values
#define DefaultActivityStyle         ActivityStyleAppStoreBlue
#define DefaultRingColor             AppStoreBlueTintColor
#define DefaultCirculatorColor       [UIColor whiteColor]
#define DefaultRingThickness         1.0f
#define DefaultRingSize              28.0f
#define DefaultDurationForRevolution 1.0f

#if !__has_feature(objc_arc)
#warning This file must be compiled with ARC enabled. Either set '-fobjc-arc' for this file in 'Build Phases -> Compile Sources' OR turn on ARC for your project.
#endif

@interface Activity ()
{
    UIView* ring;
    
    UIView* circulatorContainer;
    UIView* circulator;
    
    BOOL isAnimating;
}
@property(strong,nonatomic)UIDynamicAnimator* animator;

@end

@implementation Activity

#pragma mark - INIT

-(instancetype)initWithCoder:(NSCoder*)aDecoder
{
    if(self = [super initWithCoder:aDecoder]) {
        [self setUp];
    }
    
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]) {
        [self setUp];
    }
    
    return self;
}

-(instancetype)init
{
    if(self = [super init]) {
        [self setUp];
    }
    
    return self;
}

-(instancetype)initWithStyle:(StyleActivity)style
{
    if(self = [super init]) {
        self.style = style;
    }
    
    return self;
}

-(void)setUp
{
    [self resetValues];
    self.frame = CGRectMake(0, 0, _ringSize, _ringSize);
    
    CGFloat offset = _ringThickness, size = _ringSize-2*_ringThickness;
    ring = [[UIView alloc] initWithFrame:CGRectMake(offset, offset, size, size)];
    circulatorContainer.backgroundColor = [UIColor clearColor];
    
    ring.layer.cornerRadius = size/2.0;
    ring.layer.borderColor = _ringTintColor.CGColor;
    ring.layer.borderWidth = _ringThickness;
    [self addSubview:ring];
    
    circulatorContainer = [[UIView alloc] initWithFrame:self.bounds];
    circulatorContainer.backgroundColor = [UIColor clearColor];
    
    size = _ringThickness*4;
    circulator = [[UIView alloc] initWithFrame:
                  CGRectMake((self.bounds.size.width-size)/2, 0, size, size)];
    circulator.backgroundColor = DefaultCirculatorColor;
    
    circulator.layer.cornerRadius = size/2.0;
    
    [circulatorContainer addSubview:circulator];
    [self addSubview:circulatorContainer];
}

-(void)resetValues
{
    _style = DefaultActivityStyle;
    _ringTintColor = DefaultRingColor;
    _circulatorTintColor = DefaultCirculatorColor;
    _ringThickness = DefaultRingThickness;
    _ringSize = DefaultRingSize;
    _durationForOneRevolution = DefaultDurationForRevolution;
}

#pragma mark - Animation Start/Stop

-(void)startAnimating
{
    if(_animator == nil)
    {
        isAnimating = YES;
        
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:circulatorContainer];
        UIDynamicItemBehavior* itemBehavior = [[UIDynamicItemBehavior alloc] init];
        [itemBehavior addItem:circulatorContainer];
        [itemBehavior setAngularResistance:0];
        [itemBehavior addAngularVelocity:((M_PI*2)/_durationForOneRevolution)
                                 forItem:circulatorContainer];
        [_animator addBehavior:itemBehavior];
    }
}

-(void)stopAnimating
{
    if(_animator != nil)
    {
        isAnimating = NO;
        
        [_animator removeAllBehaviors];
        _animator = nil;
    }
}

#pragma mark - Property Setters

-(void)setStyle:(StyleActivity)style
{
    if(style >= ActivityStyleAppStoreBlue || style <= ActivityStylePomegranate)
    {
        [self resetValues];
        _style = style;
        
        if(_style == ActivityStyleAppStoreBlue)
            _ringTintColor = AppStoreBlueTintColor;
        else if(_style == ActivityStyleMusicRed)
            _ringTintColor = MusicRedTintColor;
        
        else if(_style == ActivityStyleTorquoise)
            _ringTintColor = TorquoiseTintColor;
        else if(_style == ActivityStyleGreenSea)
            _ringTintColor = GreenSeaTintColor;
        
        else if(_style == ActivityStyleEmerald)
            _ringTintColor = EmeraldTintColor;
        else if(_style == ActivityStyleNephritis)
            _ringTintColor = NephritisTintColor;
        
        else if(_style == ActivityStylePeterRiver)
            _ringTintColor = PeterRiverTintColor;
        else if(_style == ActivityStyleBelizeHole)
            _ringTintColor = BelizeHoleTintColor;
        
        else if(_style == ActivityStyleAmethyst)
            _ringTintColor = AmethystTintColor;
        else if(_style == ActivityStyleWisteria)
            _ringTintColor = WisteriaTintColor;
        
        else if(_style == ActivityStyleWetAsphalt)
            _ringTintColor = WetAsphaltTintColor;
        else if(_style == ActivityStyleMidnightBlue)
            _ringTintColor = MidnightBlueTintColor;
        
        else if(_style == ActivityStyleSunFlower)
            _ringTintColor = SunFlowerTintColor;
        else if(_style == ActivityStyleOrange)
            _ringTintColor = OrangeTintColor;
        
        else if(_style == ActivityStyleCarrot)
            _ringTintColor = CarrotTintColor;
        else if(_style == ActivityStylePumpkin)
            _ringTintColor = PumpkinTintColor;
        
        else if(_style == ActivityStyleAlizarin)
            _ringTintColor = AlizarinTintColor;
        else if(_style == ActivityStylePomegranate)
            _ringTintColor = PomegranateTintColor;
        
        [self refreshActivity];
    }
}

-(void)setRingTintColor:(UIColor*)ringTintColor
{
    _ringTintColor = ringTintColor;
    [self refreshActivity];
}

-(void)setCirculatorTintColor:(UIColor*)circulatorTintColor
{
    _circulatorTintColor = circulatorTintColor;
    [self refreshActivity];
}

-(void)setRingThickness:(CGFloat)ringThickness
{
    _ringThickness = ringThickness;
    [self refreshActivity];
}

-(void)setRingSize:(CGFloat)ringSize
{
    _ringSize = ringSize;
    [self refreshActivity];
}

-(void)setDurationForOneRevolution:(CGFloat)durationForOneRevolution
{
    _durationForOneRevolution = durationForOneRevolution;
    [self refreshActivity];
}

#pragma mark - Refresh

-(void)refreshActivity
{
    BOOL needsToResumeAnimation = NO;
    if(isAnimating)
    {
        needsToResumeAnimation = YES;
        [self stopAnimating];
    }
    
    CGRect frame = self.frame;
    frame.size.width = frame.size.height = _ringSize;
    self.frame = frame;
    
    CGFloat offset = _ringThickness, size = _ringSize-2*_ringThickness;
    ring.frame = CGRectMake(offset, offset, size, size);
    
    ring.layer.cornerRadius = size/2.0;
    ring.layer.borderColor = _ringTintColor.CGColor;
    ring.layer.borderWidth = _ringThickness;
    
    circulatorContainer.frame = self.bounds;
    
    size = _ringThickness*4;
    circulator.frame = CGRectMake((self.bounds.size.width-size)/2, 0, size, size);
    circulator.backgroundColor = _circulatorTintColor;
    
    circulator.layer.cornerRadius = size/2.0;
    
    if(needsToResumeAnimation)
        [self startAnimating];
}

#pragma mark - Frame Validation

-(void)setFrame:(CGRect)frame
{
    frame.size.width = frame.size.height = MIN(_ringSize,frame.size.width);
    
    CGRect previousFrame = self.frame;
    previousFrame.size.width = previousFrame.size.height = frame.size.width;
    [super setFrame:frame];
}

@end
