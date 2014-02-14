//
//  ReplyCell.m
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 2. 11..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import "ReplyCell.h"
#import "Reply.h"
#import <UIImageView+AFNetworking.h>

@implementation ReplyCell

-(void)setReply:(Reply*)reply
{

    NSURL *userImageURL = [NSURL URLWithString:reply.userImage];

    [self.imageView setImageWithURL:userImageURL];
    self.userName.text = reply.userName;
    self.userComments.text = reply.reTxt;
    self.userDate.text =[NSString stringWithFormat:@"%@",reply.reTime];


}


@end
