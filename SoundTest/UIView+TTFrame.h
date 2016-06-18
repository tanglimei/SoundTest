//
//  UIView+TTFrame.h
//  TT
//
//  Created by lujunfeng on 15/4/13.
//  Copyright (c) 2015年 yrtd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (TTFrame)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;

- (id)T_initWithSize:(CGSize)size;

- (CGPoint)T_origin;
- (CGFloat)T_x;
- (CGFloat)T_y;
- (CGFloat)T_right;
- (CGFloat)T_bottom;

- (CGSize)T_size;
- (CGFloat)T_height;
- (CGFloat)T_width;

- (void)T_setSize:(CGSize)size;
- (void)T_setWidth:(CGFloat)width;
- (void)T_setHeight:(CGFloat)height;

- (void)T_setOrigin:(CGPoint)origin;
- (void)T_setX:(CGFloat)x;
- (void)T_setY:(CGFloat)y;

- (void)T_setAnchorPoint:(CGPoint)anchorPoint;
- (void)T_setPosition:(CGPoint)point atAnchorPoint:(CGPoint)anchorPoint;

- (UIViewController*)T_getMyVC; //获取当前视图的VC

@end
