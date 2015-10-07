//
//  ViewController.m
//  tipCalculator
//
//  Created by Gabriel Gayán on 10/7/15.
//  Copyright © 2015 Gabriel Gayán. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (strong, nonatomic) IBOutlet UIView *tipView;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tip Calculator";
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults registerDefaults:@{@"defaultTipAmount": @1}];
    [self.tipControl setSelectedSegmentIndex: [defaults integerForKey:@"defaultTipAmount"]];
    [self updateValues];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (IBAction)onValueChanged:(UISegmentedControl *)sender {
    [self updateValues];
}

- (void)updateValues {
    float billAmount = [self.billTextField.text floatValue];
    
    NSArray *tipValues = @[@(0.15), @(0.2), @(0.25)];
    float tipAmount = [tipValues[self.tipControl.selectedSegmentIndex] floatValue] * billAmount;
    float totalAmount = billAmount + tipAmount;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

- (void)viewWillAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [self.tipControl setSelectedSegmentIndex: [defaults integerForKey:@"defaultTipAmount"]];
    [self updateValues];
}

@end
