//
//  PetCMainViewController.h
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 1. 24..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeedDelegate.h"
#import <REFrostedViewController.h>

@interface PetCMainViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDataSource, UITableViewDelegate,UICollectionViewDelegateFlowLayout>


{
    BOOL receiveData;
    BOOL searchFlag;

    BOOL familyFlag;

    BOOL notiFlag;
    BOOL burgerFlag;
}

@property (weak, nonatomic) IBOutlet UIView *searchContainer;

@property (readwrite,assign)BOOL receiveData;
@property (readwrite,assign)BOOL searchFlag;
@property (readwrite,assign)BOOL notiFlag;
@property (readwrite,assign)BOOL burgerFlag;
@property (readwrite,assign)BOOL familyFlag;

@end
