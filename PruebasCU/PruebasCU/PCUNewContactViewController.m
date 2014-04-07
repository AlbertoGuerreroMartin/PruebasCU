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

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    
    [notificationCenter addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    [notificationCenter addObserver:self selector:@selector(keyboardWillDisappear:) name:UIKeyboardWillHideNotification object:nil];
}

-(void)viewWillDisappear:(BOOL)animated
{
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter removeObserver:self];
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
    
    [self.contactsList addObject:contact];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)CancelAddContactButton:(id)sender {
    
    [self dismissViewControllerAnimated: YES completion:nil];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES]; // dismiss the keyboard
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField {
    [textField resignFirstResponder];
    
    if (textField == self.nameText) {
        [self.phoneText becomeFirstResponder];
    } else if (textField == self.emailText){
        [self.notesText becomeFirstResponder];
    }
    
    return NO;
}



-(void) keyboardWillAppear:(NSNotification*) notification {
    // Verificamos si el UITextField 2 es el responder
    if ([self.notesText isFirstResponder]) {
        
        // Sacar el frame final del teclado de la notificacion
        // Este es el rectángulo que va a ocupar el teclado
        CGRect keyboardRect = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
        
        CGRect newRect = CGRectMake(self.view.frame.origin.x,
                                    self.view.frame.origin.y - keyboardRect.size.height/2 - 15,
                                    self.view.frame.size.width,
                                    self.view.frame.size.height);
        
        // Tiempo que va a durar la animación del teclado
        NSTimeInterval seconds = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
        
        // Crear mi bloque de animación para el textview
        [UIView animateWithDuration:seconds animations:^{
            
            // Cambiamos el frame del TextView para adaptarla al teclado que aparece
            self.view.frame = newRect;
            
        }];
    }
}


-(void) keyboardWillDisappear:(NSNotification*) notification {
    // Tiempo que va a durar la animación del teclado
    NSTimeInterval seconds = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // El frame original era...
    CGRect oldFrame = CGRectMake(0,
                                 0,
                                 self.view.frame.size.width,
                                 self.view.frame.size.height);
    
    // Dejamos la altura de la textview en su valor original
    [UIView animateWithDuration:seconds animations:^{
        
        self.view.frame = oldFrame;
        
    }];
}


@end
