//
//  FeedInCell.m
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 1. 29..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import "FeedInCell.h"
#import "FeedItem.h"
#import "UIViewController+MJPopupViewController.h"
#import "PetCMainViewController.h"
#import <UIImageView+AFNetworking.h>


@interface FeedInCell()
{

    NSArray *height;
    int i;
}

@property (weak, nonatomic) IBOutlet UIImageView *petImageView;

@property (weak, nonatomic) IBOutlet UIView *labelView;
@property (weak, nonatomic) IBOutlet UIImageView *tagImageView;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *familyNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentsLabel;
@property (weak, nonatomic) IBOutlet UILabel *likeLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end


@implementation FeedInCell


-(void)setFeed:(FeedItem *)item index:(int)index
{

   height = @[@100,@95,@70,@80,@105];
    self.likeLabel.text= [NSString stringWithFormat:@"Like %ld",item.postLike];
    self.commentsLabel.text = [NSString stringWithFormat:@"Comments %ld",item.postReply];
    self.nameLabel.text = item.userName;
    self.familyNameLabel.text = item.familyName;
    self.dateLabel.text = [NSString stringWithFormat:@"%@",item.postTime];

    NSURL *postUrl = [NSURL URLWithString:item.postImage];
    NSURL *userImage = [NSURL URLWithString:item.profileImage];


    [self.petImageView setImageWithURL:postUrl];

    NSData *temp = [NSData dataWithContentsOfURL:postUrl];
    UIImage *tmpImg = [UIImage imageWithData:temp];

    CGFloat heightRatio=0.0;

    CGFloat newHeight=0.0;


    if(tmpImg.size.height > tmpImg.size.width)
    {
        heightRatio = tmpImg.size.height/170;
        newHeight = tmpImg.size.height/heightRatio;

    }

    CGFloat ratio = tmpImg.size.height/tmpImg.size.width;

    CGFloat y = ((250-newHeight*(ratio))/2);
    NSLog(@"y %f",y);
    self.petImageView.frame = CGRectMake(0,y,150 , newHeight*(ratio*1.5));



    [self.profileImageView setImageWithURL:userImage];
    self.profileImageView.layer.cornerRadius = 20.0f;
    self.profileImageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
    self.profileImageView.layer.shouldRasterize = YES;
    self.profileImageView.clipsToBounds = YES;
    


    _tagImageView.layer.cornerRadius = 100.0f;

    _profileImageView.image = [UIImage imageNamed:item.profileImage];
    _profileImageView.frame = CGRectMake(0, 0, 50,50);
    _profileImageView.layer.cornerRadius = 20.0f;
    _profileImageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    _profileImageView.layer.masksToBounds = YES;
    _profileImageView.layer.borderColor = [UIColor blackColor].CGColor;
    _profileImageView.layer.shouldRasterize = YES;
    _profileImageView.clipsToBounds = YES;
   // _petImageView.frame = CGRectMake(0,30, 120,[[height objectAtIndex:size]intValue]);



}



-(void)layoutSubviews {







  _petImageView.frame = CGRectMake(0,0, 120,[[height objectAtIndex:i]intValue]);
    //_gabView.frame = CGRectMake(0, _petImageView.frame.size.height, 120,5);
    _labelView.frame = CGRectMake(0, _petImageView.frame.size.height+5, 120, 125);


}

-(CGSize)returnCellSize
{
    CGSize retVal=CGSizeMake(120, _petImageView.frame.size.height+130);

    return retVal;
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
