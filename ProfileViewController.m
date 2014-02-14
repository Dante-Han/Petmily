//
//  ProfileViewController.m
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 2. 5..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import "ProfileViewController.h"
#import "GBPathImageView.h"
#import <UIView+REFrostedViewController.h>
#import <REFrostedViewController.h>



@interface ProfileViewController ()

@end

@implementation ProfileViewController

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

    

    self.profileImageView.frame = CGRectMake(0, 0, 0, 184.0f);
    self.profileImageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        self.profileImageView.image = [UIImage imageNamed:@"image11.jpg"];
       self.profileImageView.layer.masksToBounds = YES;
    self.profileImageView.layer.cornerRadius = 50.0;
    self.profileImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.profileImageView.layer.borderWidth = 3.0f;
    self.profileImageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
    self.profileImageView.layer.shouldRasterize = YES;
    self.profileImageView.clipsToBounds = YES;


    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
