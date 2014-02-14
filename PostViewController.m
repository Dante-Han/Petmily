//
//  PostViewController.m
//  ProjectPETMILY
//
//  Created by Ethan Hansa on 2014. 1. 31..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import "PostViewController.h"
#import <PopoverView.h>
#import <AFNetworking.h>
#import <UIImageView+AFNetworking.h>

#define SEND_URL @"http://pettest.0164740237.cloulu.com/postwrite"

@interface PostViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextFieldDelegate,UIActionSheetDelegate>
{
    int dy;

}

-(void)selectTag:(NSString*)tag;

@property (strong,nonatomic) NSString* postTag;
@property (strong,nonatomic) UIImage * postImg;
@property (strong,nonatomic) NSString* petStar;
@property (strong,nonatomic) NSString *userId;
@property (strong,nonatomic) NSString* postOpen;
@property (strong,nonatomic) NSString *postTxt;

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (weak, nonatomic) IBOutlet UIImageView *cameraImageView;
@property (weak, nonatomic) IBOutlet UIButton *addClick;

@property (weak, nonatomic) IBOutlet UIView *selectCamera;

@end

@implementation PostViewController
{
    BOOL photoFlag;
}

- (IBAction)postClick:(id)sender {
    self.postTxt = self.textField.text;
    self.postOpen= [NSString stringWithFormat:@"%c",'a'];
    self.petStar = [NSString stringWithFormat:@"n"];
    [self refresh];

}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)addClick:(id)sender {

//    self.petImage.hidden = NO;

    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"취소" destructiveButtonTitle:nil otherButtonTitles:@"사진 촬영", @"앨범에서 불러오기", nil];
    sheet.tag = 2;
    [sheet showInView:self.view];

}

- (IBAction)tab:(id)sender {

    [UIView beginAnimations:@"ani_scale" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDuration:0.2];
    self.selectCamera.transform=CGAffineTransformMakeScale(0, 0);
    [UIView commitAnimations];
     self.selectCamera.hidden =YES;

    [[self firstResponderTextField] resignFirstResponder];


 //   self.

}
- (IBAction)petStarSwitch:(id)sender {



}

- (IBAction)AllTag:(id)sender {
    [self selectTag:@"all"];

}
- (IBAction)WithTag:(id)sender {
    [self selectTag:@"with"];
}
- (IBAction)CuteTag:(id)sender {
        [self selectTag:@"cute"];
}
- (IBAction)LoveTag:(id)sender {
        [self selectTag:@"love"];
}
- (IBAction)FunTag:(id)sender {
        [self selectTag:@"fun"];
}

-(void)selectTag:(NSString*)tag
{
    self.postTag=tag;

}
- (IBAction)lockSwitch:(id)sender {

}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"오류" message:@"카메라" delegate:nil cancelButtonTitle:@"확인" otherButtonTitles:nil];
            [alert show];
            return;
        }
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
        imagePicker.delegate = self;
        imagePicker.allowsEditing = YES;
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentModalViewController:imagePicker animated:YES];
    }
    if (buttonIndex == 1) {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
        imagePicker.delegate = self;
        imagePicker.allowsEditing = YES;
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentModalViewController:imagePicker animated:YES];


    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{

    UIImage *editedImage = [info objectForKey:UIImagePickerControllerEditedImage];
    UIImage *originalImage = [info objectForKey:UIImagePickerControllerEditedImage];

    UIImage *usingImage = (nil == editedImage)? originalImage :editedImage;
    //  self.imageView.image = usingImage;
    self.postImg = usingImage;

    //   NSLog(@"%d", imageCount);

    [self imageString:self.postImg];

            self.cameraImageView.hidden = NO;
        self.cameraImageView.image = self.postImg;
    [picker dismissModalViewControllerAnimated:YES];


}

-(UITextField*)firstResponderTextField{
    for(id child in self.view.subviews)
    {
        if([child isKindOfClass:[UITextField class]])
        {
            UITextField *textField = (UITextField *)child;
            if(textField.isFirstResponder)
            {
                return textField;
            }
        }
    }
    return nil;
}

-(void)imageString:(UIImage*)image
{

}

-(void)keyboardWillShow:(NSNotification*)noti{
    UITextField *firstResponder = (UITextField*)[self firstResponderTextField];
    int y = firstResponder.frame.origin.y+ firstResponder.frame.size.height +5;
    int viewHeight = self.view.frame.size.height;

    NSDictionary *userInfo = [noti userInfo];
    CGRect rect = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey]CGRectValue];
    int keyboardHeight=(int)rect.size.height;

    float animationDuration = [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey]floatValue];

    if(keyboardHeight>(viewHeight-y))
    {
        [UIView animateWithDuration:animationDuration animations:^{
            dy = keyboardHeight -(viewHeight-y);
            self.view.center= CGPointMake(self.view.center.x, self.view.center.y-dy);
        }];
    }
        else
    {
        dy = 0;
    }
}
-(void)viewDidAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
-(void)keyboardWillHide:(NSNotification*)noti
{
    if(dy>0)
    {
        float animationDuration = [[[noti
                                     userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey]floatValue];
        [UIView animateWithDuration:animationDuration animations:^{self.view.center = CGPointMake(self.view.center.x, self.view.center.y+dy                                                                            );}];
    }
}

-(void)refresh
{




        NSData *imageData = UIImageJPEGRepresentation(self.postImg, 0.5);

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
/*    NSMutableSet *contentTypes = [NSMutableSet setWithSet:manager.responseSerializer.acceptableContentTypes];
    [contentTypes addObject:@"application/json"];*/
//    manager.responseSerializer.acceptableContentTypes = contentTypes;

    [manager.operationQueue waitUntilAllOperationsAreFinished];
    NSDictionary *parameters = @{@"post_txt":self.postTxt,
                                 @"tag_name":self.postTag,
                                 @"user_id":self.userId,
                                 @"post_open":self.postOpen,
                                 @"post_star":self.petStar
                                 };

    [manager POST:SEND_URL parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData){

//        if(self.postImg)
//        [formData appendPartWithFormData:imageData name:@"post_img"];


        [formData appendPartWithFileData:imageData name:@"post_img" fileName:@"upload.jpeg" mimeType:@"multipart/form-data"];

        
    }success:^(AFHTTPRequestOperation *operation, id responseObject) {

        NSDictionary *tempDic;

        tempDic =responseObject;

    }
          failure:
     ^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error:%@",error);
     }];
    
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *currentDate;
    int year;
    int month;
    int day;
    NSDate *date=[NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components =[calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:date];

    self.userId = [NSString stringWithFormat:@"aaa"];

    self.postTag = @"null";
    
    year = (int)[components year];
    month = (int)[components month];
    day = (int)[components day];
    
    currentDate = [NSString stringWithFormat:@"%d년 %d월 %d일",year,month,day];
    
    self.dateLabel.text = currentDate;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
