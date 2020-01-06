//
//  ViewController.m
//  HangmanObjC
//
//  Created by Macbook on 17/07/2019.
//  Copyright © 2019 TP. All rights reserved.
//

#import "ViewController.h"
#import "CountriesVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.navigationController.navigationBar.hidden = true;
}

- (void)viewWillAppear:(BOOL)animated
{
     self.navigationController.navigationBar.hidden = true;
}

- (IBAction)contriesButtonTouched:(id)sender
{
    CountriesVC * view = [self.storyboard instantiateViewControllerWithIdentifier:@"CountriesVC"];
    view.type = @"Countries";
    [self.navigationController pushViewController:view animated:YES];
    
}
- (IBAction)animalButtonTouched:(id)sender
{
    CountriesVC * view = [self.storyboard instantiateViewControllerWithIdentifier:@"CountriesVC"];
    view.type = @"Animals";
    [self.navigationController pushViewController:view animated:YES];
}
- (IBAction)fruitsButtonTouched:(id)sender
{
    CountriesVC * view = [self.storyboard instantiateViewControllerWithIdentifier:@"CountriesVC"];
    view.type = @"Fruits";
    [self.navigationController pushViewController:view animated:YES];
}


@end
