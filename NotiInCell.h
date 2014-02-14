//
//  NotiInCell.h
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 2. 10..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NotiItem.h"

@interface NotiInCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *profileName;
@property (weak, nonatomic) IBOutlet UILabel *Ment;
@property (weak, nonatomic) IBOutlet UILabel *Date;


-(void)setNotification:(NotiItem*)item;


@end
