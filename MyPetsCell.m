//
//  MyPetsCell.m
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 2. 7..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import "MyPetsCell.h"
#import <UIImageView+AFNetworking.h>

@implementation MyPetsCell


-(void)setMyPet:(MyPets *)myPet
{
    self.userNameLabel.text =myPet.userName;
    self.likeLabel.text= [NSString stringWithFormat:@"Like %ld",myPet.postLike];
    self.commentsLabel.text = [NSString stringWithFormat:@"Comments %ld",myPet.postReply];
    self.nameLabel.text = myPet.userName;
    self.familyNameLabel.text = myPet.familyName;
    self.dateLabel.text = [NSString stringWithFormat:@"%@",myPet.postTime];

    NSURL *postUrl = [NSURL URLWithString:myPet.postImage];
    NSURL *userImage = [NSURL URLWithString:myPet.profileImage];


    [self.postImageView setImageWithURL:postUrl];
    [self.profileImageView setImageWithURL:userImage];
    self.profileImageView.layer.cornerRadius = 20.0f;
    self.profileImageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
    self.profileImageView.layer.shouldRasterize = YES;
    self.profileImageView.clipsToBounds = YES;

}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect
//{
//    _petImageView.frame = CGRectMake(0,30, 120,80);
//}

@end


