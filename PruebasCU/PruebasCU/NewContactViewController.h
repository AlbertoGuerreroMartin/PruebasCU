//
//  NewContactViewController.h
//  PruebasCU
//
//  Created by Alejandro Fernandez on 01/04/14.
//  Copyright (c) 2014 self.edu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewContactViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *nameText;

@property (strong, nonatomic) IBOutlet UITextField *phoneText;

@property (strong, nonatomic) IBOutlet UITextField *emailText;
@property (strong, nonatomic) IBOutlet UITextView *notesText;
@end
