//
//  DetailPictureViewController.m
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 2. 14..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import "DetailPictureViewController.h"
#import <UIImageView+AFNetworking.h>

@interface DetailPictureViewController ()

{
    NSString *postImgURL;
}

@property (weak, nonatomic) IBOutlet UIImageView *detailPicture;

//-(void)setImageView:(NSNotification*)noti;


@end

@implementation DetailPictureViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    //[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(setImageView:) name:@"sendDetailImage" object:nil];


        //NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];



        
    }


    // Do any additional setup after loading the view from its nib.

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];


}
/*-(void)setImageView:(NSNotification*)noti
{
    NSDictionary *dic = [noti userInfo];
 //   2014-02-14 10:19:16.057 ProjectPETMILY[14260:70b] sendnoi <CFNotificationCenter 0x109405320 [0x101f6c800]>
    NSLog(@"noti %@",noti);


    postImgURL = [dic objectForKey:@"sendImg"];
    

        NSLog(@" receive %@",postImgURL);
    NSURL *postImage = [NSURL URLWithString:postImgURL];
    [self.detailPicture setImageWithURL:postImage];

}*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
