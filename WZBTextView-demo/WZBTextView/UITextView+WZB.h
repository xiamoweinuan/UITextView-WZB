//
//  UITextView+WZB.h
//  WZBTextView-demo
//
//  Created by normal on 2016/11/14.
//  Copyright © 2016年 WZB. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
 currentTextViewHeight TextView高度变化通知
 */
typedef void(^textViewHeightDidChangedBlock)(CGFloat currentTextViewHeight);
/*
 currentTextCount 当前字数通知
 isInputReturn  是否输入return
 */
typedef void(^TextCountChangeBlock)(CGFloat currentTextCount,BOOL isInputReturn);

@interface UITextView (WZB)

/* 占位文字 */
@property (nonatomic, copy) NSString *wzb_placeholder;

/* 占位文字颜色 */
@property (nonatomic, strong) UIColor *wzb_placeholderColor;

/* 最大高度，如果需要随文字改变高度的时候使用 */
@property (nonatomic, assign) CGFloat wzb_maxHeight;

/* 最小高度，如果需要随文字改变高度的时候使用,默认最小高度就是textview初次高度 */
@property (nonatomic, assign) CGFloat wzb_minHeight;
/* 文本最大数量 */
@property (nonatomic, assign) NSInteger maxCountText;

/* 是否点击return是否关闭键盘 */
@property (nonatomic, assign) BOOL isReturnResignResponder;

/* 高度改变通知 */
@property (nonatomic, copy) textViewHeightDidChangedBlock wzb_textViewHeightDidChanged;

/* 文本字数改变 */
@property (nonatomic, copy) TextCountChangeBlock textCountChangeBlock;

/* 获取图片数组 */
- (NSArray *)wzb_getImages;

/* 自动高度的方法，maxHeight：最大高度 */
- (void)wzb_autoHeightWithMaxHeight:(CGFloat)maxHeight;

/* 自动高度的方法，maxHeight：最大高度， textHeightDidChanged：高度改变的时候调用 */
- (void)wzb_autoHeightWithMaxHeight:(CGFloat)maxHeight textViewHeightDidChanged:(textViewHeightDidChangedBlock)textViewHeightDidChanged;

-(void)addBlockTextCountChangeBlock:(TextCountChangeBlock)textCountChangeBlock;

/* 添加一张图片 image:要添加的图片 */
- (void)wzb_addImage:(UIImage *)image;

/* 添加一张图片 image:要添加的图片 size:图片大小 */
- (void)wzb_addImage:(UIImage *)image size:(CGSize)size;

/* 插入一张图片 image:要添加的图片 size:图片大小 index:插入的位置 */
- (void)wzb_insertImage:(UIImage *)image size:(CGSize)size index:(NSInteger)index;

/* 添加一张图片 image:要添加的图片 multiple:放大／缩小的倍数 */
- (void)wzb_addImage:(UIImage *)image multiple:(CGFloat)multiple;

/* 插入一张图片 image:要添加的图片 multiple:放大／缩小的倍数 index:插入的位置 */
- (void)wzb_insertImage:(UIImage *)image multiple:(CGFloat)multiple index:(NSInteger)index;

@end
