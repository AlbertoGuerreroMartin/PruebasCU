//
//  PCUContactDetailViewController.m
//  PruebasCU
//
//  Created by Guerrero Martin on 31/03/14.
//  Copyright (c) 2014 self.edu. All rights reserved.
//

#import "PCUContactDetailViewController.h"

@interface PCUContactDetailViewController ()

@end

@implementation PCUContactDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.contactNameLabel.text = self.contact.name;
    self.contactPhoneLabel.text = [NSString stringWithFormat:@"Telefono: %@", self.contact.phoneNumber];
    self.contactEmailLabel.text = [NSString stringWithFormat:@"Email: %@", self.contact.email];
    self.contactNotesTextView.text = self.contact.notes;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
