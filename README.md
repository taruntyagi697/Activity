# Activity - iOS (Objective-C)

`Activity` is a `UIView` subclass that creates a customizable loading activity indicator like control.
* Mimics Apple loading indicator from `App Store` & `Music`

## Requirements

* iOS 7.0 or later. (Uses UIKit Dynamics)
* QuartzCore.framework
* ARC enabled.

## Installation
* Want a Pod for this, just add following line to your podfile-
```
pod 'Activity'
```
* You can directly copy the source files from Activity folder.

## How To Use

Configuring Activity is as simple as :
```objective-c
Activity* activity = [[Activity alloc] initWithStyle:ActivityStyleAppStoreBlue];
activity.frame = CGRectMake(50, 50, 30, 30);
[self.view addSubview:activity];
[activity startAnimating];
```

Activity takes it over from here. You just need to know start/stop animating.

## Properties

Activity comes with a property set for it's customization as needed :-

* `style` : Choose a style convenient to you from 'StyleActivity' enum

* `ringTintColor` : Color for ring displayed as loading circle

* `circulatorTintColor` : Color for small circulator traversing ring's circumference
    
* `ringThickness` : Thickness for Ring (Default : 1)

* `ringSize` : Diameter for Ring (Default : 28)

* `durationForOneRevolution` : Duration for completing one Revolution. (Default : 1)
    
## [UIColor colorWithPatternImage:] advantage
    
    Given that UIColor is capable of color patterns handling made from images, 
    Activity can be used to take advantage of this feature.

## How It Looks
![Screenshot] (https://raw.githubusercontent.com/taruntyagi697/Activity/master/Screenshot.png)
    
## Demo App
    Demo app includes almost all of the property usages through a pretty basic example.
    You can go through it to see these in action at first.
