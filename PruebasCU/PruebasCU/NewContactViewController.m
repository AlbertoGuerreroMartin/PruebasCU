//
//  NewContactViewController.m
//  PruebasCU
//
//  Created by Alejandro Fernandez on 01/04/14.
//  Copyright (c) 2014 self.edu. All rights reserved.
//

#import "NewContactViewController.h"
#import "PCUContact.h"
#import "PCUContactsListViewController.h"


@interface NewContactViewController ()

@end

@implementation NewContactViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)AddContactButton:(id)sender {
    
    PCUContact *contact= [[PCUContact alloc]init];
    
    contact.name = self.nameText.text;
    contact.phoneNumber = self.phoneText.text;
    contact.email = self.emailText.text;
    contact.notes = self.notesText.text;
    
    [_contactsList addObject:contact];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
    
}

- (IBAction)CancelAddContactButton:(id)sender {
    
    [self dismissViewControllerAnimated: YES completion:nil];
}
@end
