//
//  PCUContactDetailViewController.h
//  PruebasCU
//
//  Created by Guerrero Martin on 31/03/14.
//  Copyright (c) 2014 self.edu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PCUContact.h"

@interface PCUContactDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *contactNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *contactPhoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *contactEmailLabel;
@property (weak, nonatomic) IBOutlet UITextView *contactNotesTextView;

@property (strong, nonatomic) PCUContact *contact;

@end