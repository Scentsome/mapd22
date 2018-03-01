//
//  InputViewController.m
//  DelegatePractice
//
//  Created by Michael on 01/03/2018.
//  Copyright © 2018 Zencher. All rights reserved.
//

#import "InputViewController.h"

@interface InputViewController ()


@end

@implementation InputViewController
- (IBAction)send:(id)sender {
    self.dataBlock(self.inputField.text);
//    [self.delegate inputDidEnterText:self.inputField.text];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    void (^dataBlock)(NSString * data) ;
//    dataBlock = ^(NSString * data) {
//        NSLog(@"%@",data);
//    };
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
