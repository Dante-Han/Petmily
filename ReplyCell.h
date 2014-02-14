//
//  ReplyCell.h
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 2. 11..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reply.h"

@interface ReplyCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *userDate;
@property (weak, nonatomic) IBOutlet UILabel *userComments;


-(void)setReply:(Reply*)reply;

@end
