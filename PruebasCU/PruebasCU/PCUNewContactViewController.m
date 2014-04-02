//
//  NewContactViewController.m
//  PruebasCU
//
//  Created by Alejandro Fernandez on 01/04/14.
//  Copyright (c) 2014 self.edu. All rights reserved.
//

#import "PCUNewContactViewController.h"
#import "PCUContact.h"
#import "PCUContactsListViewController.h"


@interface PCUNewContactViewController ()

@end

@implementation PCUNewContactViewController

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
    
//    [self.contactsList addObject:contact];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)CancelAddContactButton:(id)sender {
    
    [self dismissViewControllerAnimated: YES completion:nil];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"* * * * * * * * *ViewControllerBase touchesBegan");
    
    [self.view endEditing:YES]; // dismiss the keyboard
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField {
    [textField resignFirstResponder];
    
    if (textField == self.nameText) {
        [self.phoneText becomeFirstResponder];
    } else if (textField == self.phoneText) {
        [self.emailText becomeFirstResponder];
    } else {
        [self.notesText becomeFirstResponder];
    }
    
    return NO;
}


@end
