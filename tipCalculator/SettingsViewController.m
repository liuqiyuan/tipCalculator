//
//  SettingsViewController.m
//  tipCalculator
//
//  Created by Qiyuan Liu on 1/22/15.
//  Copyright (c) 2015 Yahoo!. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultSegmentController;
+ (int) getDefaultSetting;
@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.defaultSegmentController.selectedSegmentIndex = [SettingsViewController getDefaultSetting];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onSegmentChange:(UISegmentedControl *)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.defaultSegmentController.selectedSegmentIndex forKey:@"defaultPercentage"];
    [defaults synchronize];
}

//load data from use settings
+ (int) getDefaultSetting {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int intValue = [defaults integerForKey:@"defaultPercentage"];
    return intValue;
}

@end
