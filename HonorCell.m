//
//  HonorCell.m
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 1. 29..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import "HonorCell.h"
#import "HonorList.h"

@interface HonorCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation HonorCell


-(void)setList:(HonorList*)item
{
    self.imageView.image = [UIImage imageNamed:item.image];
    self.imageView.frame = CGRectMake(2,0,25, 25);
    self.imageView.layer.masksToBounds = YES;
    self.imageView.layer.cornerRadius = 25.0;
    self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imageView.layer.borderWidth = 3.0f;
    self.imageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
    self.imageView.layer.shouldRasterize = YES;
    self.imageView.clipsToBounds = YES;

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
