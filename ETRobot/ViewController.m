//
//  ViewController.m
//  ETRobot
//
//  Created by Liang Zhang on 15/4/18.
//  Copyright (c) 2015年 ET. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    
    NSMutableArray *_pressedButtons;
    
}

- (NSString *)stringForDirection:(JSDPadDirection)direction;

@end


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[self.aButton titleLabel] setText:@"A"];
    [self.aButton setBackgroundImage:[UIImage imageNamed:@"button"]];
    [self.aButton setBackgroundImagePressed:[UIImage imageNamed:@"button-pressed"]];
    
    [[self.bButton titleLabel] setText:@"B"];
    [self.bButton setBackgroundImage:[UIImage imageNamed:@"button"]];
    [self.bButton setBackgroundImagePressed:[UIImage imageNamed:@"button-pressed"]];
    
    [[self.cButton titleLabel] setText:@"C"];
    [self.cButton setBackgroundImage:[UIImage imageNamed:@"button"]];
    [self.cButton setBackgroundImagePressed:[UIImage imageNamed:@"button-pressed"]];

    [[self.dButton titleLabel] setText:@"D"];
    [self.dButton setBackgroundImage:[UIImage imageNamed:@"button"]];
    [self.dButton setBackgroundImagePressed:[UIImage imageNamed:@"button-pressed"]];
    
    _pressedButtons = [NSMutableArray new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)stringForDirection:(JSDPadDirection)direction
{
    NSString *string = nil;
    
    switch (direction) {
        case JSDPadDirectionNone:
            string = @"None";
            break;
        case JSDPadDirectionUp:
            string = @"Up";
            break;
        case JSDPadDirectionDown:
            string = @"Down";
            break;
        case JSDPadDirectionLeft:
            string = @"Left";
            break;
        case JSDPadDirectionRight:
            string = @"Right";
            break;
        case JSDPadDirectionUpLeft:
            string = @"Up Left";
            break;
        case JSDPadDirectionUpRight:
            string = @"Up Right";
            break;
        case JSDPadDirectionDownLeft:
            string = @"Down Left";
            break;
        case JSDPadDirectionDownRight:
            string = @"Down Right";
            break;
        default:
            string = @"None";
            break;
    }
    
    return string;
}

#pragma mark - JSDPadDelegate

- (void)dPad:(JSDPad *)dPad didPressDirection:(JSDPadDirection)direction
{
    NSLog(@"Changing direction to: %@", [self stringForDirection:direction]);
}

- (void)dPadDidReleaseDirection:(JSDPad *)dPad
{
    NSLog(@"Releasing DPad");
}

#pragma mark - JSButtonDelegate

- (void)buttonPressed:(JSButton *)button
{
    if ([_pressedButtons containsObject:button])
    {
        NSLog(@"Button is already being tracked as pressed");
        return;
    }
    
    if ([button isEqual:self.aButton])
    {
        [_pressedButtons addObject:self.aButton];
    }
    else if ([button isEqual:self.bButton])
    {
        [_pressedButtons addObject:self.bButton];
    }
}

- (void)buttonReleased:(JSButton *)button
{
    if ([_pressedButtons containsObject:button] == NO)
    {
        NSLog(@"Button has already been released");
        return;
    }
    
    if ([button isEqual:self.aButton])
    {
        [_pressedButtons removeObject:self.aButton];
    }
    else if ([button isEqual:self.bButton])
    {
        [_pressedButtons removeObject:self.bButton];
    }
}

#pragma mark - JSAnalogueStickDelegate

- (void)analogueStickDidChangeValue:(JSAnalogueStick *)analogueStick
{

}

@end
