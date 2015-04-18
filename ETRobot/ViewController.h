//
//  ViewController.h
//  ETRobot
//
//  Created by Liang Zhang on 15/4/18.
//  Copyright (c) 2015年 ET. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSDPad.h"
#import "JSButton.h"
#import "JSAnalogueStick.h"

@interface ViewController : UIViewController <JSDPadDelegate, JSButtonDelegate, JSAnalogueStickDelegate>

@property (weak, nonatomic) IBOutlet JSDPad *dPad;
@property (weak, nonatomic) IBOutlet JSButton *bButton;
@property (weak, nonatomic) IBOutlet JSButton *aButton;
@property (weak, nonatomic) IBOutlet JSButton *cButton;
@property (weak, nonatomic) IBOutlet JSButton *dButton;
@property (weak, nonatomic) IBOutlet JSAnalogueStick *analogueStick;

@end

