//
//  PCUContactsListViewController.m
//  PruebasCU
//
//  Created by Guerrero Martin on 31/03/14.
//  Copyright (c) 2014 self.edu. All rights reserved.
//

#import "PCUContactsListViewController.h"
#import "PCUContactDetailViewController.h"
#import "PCUNewContactViewController.h"
#import "PCUContactCell.h"
#import "PCUContact.h"

@interface PCUContactsListViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation PCUContactsListViewController
{
    
    }

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _contactsList = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
    [self.tableView reloadInputViews];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    PCUContact *contact = [[PCUContact alloc] init];
    
    contact.name = @"Alberto";
    contact.phoneNumber = @"639960473";
    contact.email = @"alberto170693@gmail.com";
    contact.notes = @"oushgohsdipgdjsipgdipgidohgipdahgb ad daoufghaiog afgoadbfousa fuosabf";
    
    [_contactsList addObject:contact];
    
    contact = [[PCUContact alloc] init];
    contact.name = @"Jatibum";
    contact.phoneNumber = @"723423947";
    contact.email = @"jatibum@gmail.com";
    contact.notes = @"79gb9f4b9fb49f4 f2497bf4nfipwe few0";
    
    [_contactsList addObject:contact];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _contactsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"contactCell";
    PCUContactCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.contactName.text = ((PCUContact*)_contactsList[indexPath.row]).name;
    cell.contactPhoneNumber.text = ((PCUContact*)_contactsList[indexPath.row]).phoneNumber;
    
    return cell;
}


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"contactDetailSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        PCUContact *contact = _contactsList[indexPath.row];
        ((PCUContactDetailViewController*) segue.destinationViewController).contact = contact;
    } else if ([[segue identifier] isEqualToString:@"newContactSegue"]) {
        ((PCUNewContactViewController*) segue.destinationViewController).contactsList = self.contactsList;
    }
}

@end
