//
//  ViewController.m
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 1. 23..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)awakeFromNib
{
    self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"contentController"];
    
    self.menuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"menuController"];
}


@end
