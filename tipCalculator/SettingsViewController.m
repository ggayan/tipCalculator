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

@end
