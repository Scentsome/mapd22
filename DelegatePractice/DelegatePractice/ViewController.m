//
//  ViewController.m
//  DelegatePractice
//
//  Created by Michael on 01/03/2018.
//  Copyright © 2018 Zencher. All rights reserved.
//

#import "ViewController.h"
#import "InputViewController.h"
#import "Car.h"

@interface ViewController ()<InputViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

-(void)inputDidEnterText:(NSString *)string{
    self.label.text = string;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    Car * car = [Car new];
//    _label.text;
    car.price = 200;
    
    NSLog(@"%d",car.price);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    InputViewController * inputVC =  segue.destinationViewController;
    
    inputVC.delegate = self;
}

@end
