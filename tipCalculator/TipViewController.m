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
    
    NSString* savedBill = [defaults objectForKey:@"savedBill"];
    if (savedBill) {
        self.billTextField.text = savedBill;
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"savedBill"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    [self updateValues];
    [self.billTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(UITapGestureRecognizer *)sender {
//    [self.view endEditing:YES];
    [self updateValues];
}

- (IBAction)onValueChanged:(UISegmentedControl *)sender {
    [self updateValues];
}

- (IBAction)onBillEdited:(UITextField *)sender {
    [self updateValues];
}

- (void)updateValues {
    float billAmount = [self.billTextField.text floatValue];
    
    NSArray *tipValues = @[@(0.15), @(0.2), @(0.25)];
    float tipAmount = [tipValues[self.tipControl.selectedSegmentIndex] floatValue] * billAmount;
    float totalAmount = billAmount + tipAmount;
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle: NSNumberFormatterCurrencyStyle];
    
    self.tipLabel.text = [numberFormatter stringFromNumber:@(tipAmount)];
    self.totalLabel.text = [numberFormatter stringFromNumber:@(totalAmount)];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [self.tipControl setSelectedSegmentIndex: [defaults integerForKey:@"defaultTipAmount"]];
    [self updateValues];
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"view did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.billTextField.text forKey:@"savedBill"];
    [defaults synchronize];
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"view did disappear");
}

@end
