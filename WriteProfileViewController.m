//
//  WriteProfileViewController.m
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 2. 10..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import "WriteProfileViewController.h"
#import <AFNetworking.h>
#import <UIImageView+AFNetworking.h>

#define ADD_PET_URL @"http://pettest.0164740237.cloulu.com/addpet"

@interface WriteProfileViewController ()<UITextFieldDelegate,UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    int dy;

}

@property (strong,nonatomic)NSString *pet_name;
@property (strong,nonatomic)NSString *pet_txt;
@property (strong,nonatomic)NSString *pet_kind;
@property (strong,nonatomic)NSString *pet_birth;
@property (strong,nonatomic)UIImage *pet_img;
@property (strong,nonatomic)NSString *pet_gender;
@property (strong,nonatomic)UIImageView *pet_imageView;

@property (weak, nonatomic) IBOutlet UITextField *petKind;


/*
pet_name : 펫 이름 // 한글; 5자리까지
pet_txt : 펫 상태메시지 // 한글 50자리까지
pet_kind : 펫 종  // 한글 5자리까지
pet_gender : 펫 성별     // 수컷 : m 암컷 : f 아무것도 안하면 g
pet_birth : 펫 생년월일   // 140213
pet_img : 펫 프로필 사진   // 파일*/

@property (weak, nonatomic) IBOutlet UITextField *petName;
@property (weak, nonatomic) IBOutlet UITextField *petMessage;
@property (weak, nonatomic) IBOutlet UITextField *petSex;
@property (weak, nonatomic) IBOutlet UITextField *petBirth;
@property (weak, nonatomic) IBOutlet UIImageView *petImageView;
-(void)refresh;

@end

@implementation WriteProfileViewController


- (IBAction)cancelClick:(id)sender {

}

- (IBAction)submitClick:(id)sender {


    self.pet_name = self.petName.text;
    self.pet_txt = self.petMessage.text;
    self.pet_kind= self.petKind.text;
    self.pet_birth = self.petBirth.text;
    self.pet_gender = self.petSex.text;

                      [self refresh];
    


}


-(void)refresh
{

/*    fam_id : 가족 id
    pet_name : 펫 이름 // 한글 5자리까지
    pet_txt : 펫 상태메시지 // 한글 50자리까지
    pet_kind : 펫 종  // 한글 5자리까지
    pet_gender : 펫 성별     // 수컷 : m 암컷 : f 아무것도 안하면 g
    pet_birth : 펫 생년월일   // 140213
    pet_img : 펫 프로필 사진   // 파일*/

    NSData *imageData = UIImageJPEGRepresentation(self.pet_img, 0.5);

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    /*    NSMutableSet *contentTypes = [NSMutableSet setWithSet:manager.responseSerializer.acceptableContentTypes];
     [contentTypes addObject:@"application/json"];*/
    //    manager.responseSerializer.acceptableContentTypes = contentTypes;

    [manager.operationQueue waitUntilAllOperationsAreFinished];
    NSDictionary *parameters = @{@"fam_id":@"aaa",
                                 @"pet_name":self.pet_name,
                                 @"pet_txt":self.pet_txt,
                                 @"pet_kind":self.pet_kind,
                                 @"pet_gender":self.pet_gender,
                                 @"pet_birth":self.pet_birth,
                                 };

    [manager POST:ADD_PET_URL parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData){

        //        if(self.postImg)
        //        [formData appendPartWithFormData:imageData name:@"post_img"];


        [formData appendPartWithFileData:imageData name:@"pet_img" fileName:@"addpet_" mimeType:@"multipart/form-data"];


    }success:^(AFHTTPRequestOperation *operation, id responseObject) {

        NSDictionary *tempDic;

        tempDic =responseObject;
        NSLog(@"response : %@",responseObject);

    }
          failure:
     ^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error:%@",error);
     }];
    
    
}


- (IBAction)cameraClick:(id)sender {

    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"취소" destructiveButtonTitle:nil otherButtonTitles:@"사진 촬영", @"앨범에서 불러오기", nil];
    sheet.tag = 2;
    [sheet showInView:self.view];


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
    self.self.pet_img = usingImage;

    //   NSLog(@"%d", imageCount);

//    [self imageString:self.pet_img];

    self.petImageView.hidden = NO;
    self.petImageView.image = self.pet_img;
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
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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


    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
