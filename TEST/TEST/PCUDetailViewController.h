//
//  PCUDetailViewController.h
//  TEST
//
//  Created by Guerrero Martin on 31/03/14.
//  Copyright (c) 2014 self.edu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PCUDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
