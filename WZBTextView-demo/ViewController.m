//
//  ViewController.m
//  WZBTextView-demo
//
//  Created by normal on 2016/11/14.
//  Copyright © 2016年 WZB. All rights reserved.
//

#import "ViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (nonatomic, strong) UITextView *tView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textView.placeholder = @"i love you";
    self.textView.maxHeight = 100.05;
    UITextView *textView = [[UITextView alloc] initWithFrame:(CGRect){0, 0, 200, 30}];
    [self.view addSubview:textView];
    textView.center = self.view.center;
    textView.placeholder = @"i love you";
    textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    textView.layer.borderWidth = 1;
    [textView autoHeightWithMaxHeight:100 textViewHeightDidChanged:^(CGFloat currentTextViewHeight) {
        CGRect frame = textView.frame;
        frame.size.height = currentTextViewHeight;
        [UIView animateWithDuration:0.2 animations:^{
            textView.frame = frame;
            textView.center = self.view.center;
        }];
    }];
    self.tView = textView;
    UIButton *button = [[UIButton alloc] initWithFrame:(CGRect){20, 30, 50, 25}];
    [self.view addSubview:button];
    [button setTitle:@"添加图片" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(addImage) forControlEvents:UIControlEventTouchUpInside];
}

- (void)addImage {
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypePhotoLibrary] || [UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeSavedPhotosAlbum]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        picker.mediaTypes = [[NSArray alloc] initWithObjects:(NSString *)kUTTypeImage,nil];
        
        picker.delegate = self;
        
        [self presentViewController:picker animated:YES completion:nil];
    } else {
        NSLog(@"设备不支持相册或者图库");
    }
}

// 当得到照片后，调用该方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]){
        UIImage *theImage = nil;
        if ([picker allowsEditing]){
            theImage = [info objectForKey:UIImagePickerControllerEditedImage];
        } else {
            theImage = [info objectForKey:UIImagePickerControllerOriginalImage];
        }
        if (theImage) {
            [self.tView addImage:theImage];
        }
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
