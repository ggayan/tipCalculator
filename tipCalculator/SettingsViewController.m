//
//  SettingsViewController.m
//  tipCalculator
//
//  Created by Gabriel Gayán on 10/7/15.
//  Copyright © 2015 Gabriel Gayán. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipControl;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadSettings];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadSettings {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [self.defaultTipControl setSelectedSegmentIndex: [defaults integerForKey:@"defaultTipAmount"]];
}

- (IBAction)saveSettings:(UISegmentedControl *)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSInteger tipSettings = self.defaultTipControl.selectedSegmentIndex;
    [defaults setInteger:tipSettings forKey:@"defaultTipAmount"];
    
    [defaults synchronize];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
    
    [UIView animateWithDuration:0.4 animations:^{
    } completion:^(BOOL finished) {
        // Do something here when the animation finishes.
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"view did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"view did disappear");
}

@end
