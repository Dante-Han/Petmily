//
//  NotiInCell.m
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 2. 10..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import "NotiInCell.h"
#import "NotiInfo.h"
@implementation NotiInCell


-(void)setNotification:(NotiItem*)item
{
    self.imageView.image = [UIImage imageNamed:item.profileImage];
    self.Date.text =[NSString stringWithFormat:@"%@" ,item.notidate];
    self.Ment.text = item.comment;
    self.profileName.text = item.name;



}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
