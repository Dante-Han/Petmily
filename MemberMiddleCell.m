//
//  MemberMiddleCell.m
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 2. 4..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import "MemberMiddleCell.h"
#import "MyMemberInfo.h"
#import <UIImageView+AFNetworking.h>
@implementation MemberMiddleCell

-(void)setMyMember:(myMember *)member
{

    NSURL *imageURL = [NSURL URLWithString:member.profileImage];

    [self.imageView setImageWithURL:imageURL];

        self.imageView.layer.cornerRadius = 10.0;
        self.imageView.layer.shouldRasterize = YES;
        self.imageView.clipsToBounds = YES;
        self.imageView.layer.rasterizationScale = [UIScreen mainScreen].scale;

//     self.imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
       // self.imageView.layer.masksToBounds = YES;

/*        self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
        self.imageView.layer.borderWidth = 3.0f;*/




}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
