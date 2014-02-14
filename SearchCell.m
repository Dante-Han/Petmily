//
//  SearchCell.m
//  ProjectPETMILY
//
//  Created by Ethan Hansa on 2014. 1. 31..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import "SearchCell.h"
#import "SearchInfo.h"

#import <UIImageView+AFNetworking.h>

@implementation SearchCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setUserSearch:(Search*)search
{


    NSURL *imageURL = [NSURL URLWithString:search.userImg];
    [self.imageView setImageWithURL:imageURL];
    self.imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;

    NSLog(@"setsearch");
    _imageView.layer.masksToBounds = YES;
    _imageView.layer.cornerRadius = 35.0;
    _imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    _imageView.layer.borderWidth = 3.0f;
    _imageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
    _imageView.layer.shouldRasterize = YES;
    _imageView.clipsToBounds = YES;

    self.upLabel.text = search.userName;

    if(search.famName == NULL)
    {
        self.downLabel.hidden =YES;
    }
    self.downLabel.text = search.famName;


}
-(void)setFamSearch:(Search *)search
{
    NSURL *imageURL = [NSURL URLWithString:search.famImg];
    [self.imageView setImageWithURL:imageURL];
    self.imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;

    NSLog(@"setsearch");
    _imageView.layer.masksToBounds = YES;
    _imageView.layer.cornerRadius = 35.0;
    _imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    _imageView.layer.borderWidth = 3.0f;
    _imageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
    _imageView.layer.shouldRasterize = YES;
    _imageView.clipsToBounds = YES;

    self.upLabel.text = search.famName;
//    self.downLabel.text = search.famName;
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
