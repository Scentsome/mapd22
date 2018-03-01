//
//  InputViewController.h
//  DelegatePractice
//
//  Created by Michael on 01/03/2018.
//  Copyright © 2018 Zencher. All rights reserved.
//

#import <UIKit/UIKit.h>

//@protocol InputViewControllerDelegate
//-(void) inputDidEnterText:(NSString *) inputString;
//@end

@interface InputViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *inputField;
- (IBAction)send:(id)sender;
//@property id<InputViewControllerDelegate> delegate;
@property  void (^dataBlock)(NSString * data) ;
@end
