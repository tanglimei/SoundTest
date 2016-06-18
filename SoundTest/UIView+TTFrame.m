//
//  UIView+TTFrame.m
//  TT
//
//  Created by lujunfeng on 15/4/13.
//  Copyright (c) 2015年 yrtd. All rights reserved.
//

#import "UIView+TTFrame.h"

@implementation UIView (TTFrame)
#pragma mark - Init
- (id)T_initWithSize:(CGSize)size
{
    CGRect rect = (CGRect){CGPointZero, size};
    return [self initWithFrame:rect];
}


#pragma mark - Get Property
- (CGPoint)T_origin
{
    return self.frame.origin;
}

- (CGFloat)T_x
{
    return self.T_origin.x;
}

- (CGFloat)T_y
{
    return self.T_origin.y;
}

- (CGFloat)T_right
{
    return self.T_x + self.T_width;
}

- (CGFloat)T_bottom
{
    return self.T_y + self.T_height;
}


- (CGSize)T_size
{
    return self.frame.size;
}

- (CGFloat)T_height
{
    return self.T_size.height;
}

- (CGFloat)T_width
{
    return self.T_size.width;
}


#pragma mark - Set Origin
- (void)T_setOrigin:(CGPoint)origin
{
    self.frame = (CGRect){origin, self.T_size};
}

- (void)T_setX:(CGFloat)x
{
    [self T_setOrigin:CGPointMake(x, self.T_y)];
}

- (void)T_setY:(CGFloat)y
{
    [self T_setOrigin:CGPointMake(self.T_x, y)];
}


#pragma mark - Set Size
- (void)T_setSize:(CGSize)size
{
    self.frame = (CGRect){self.T_origin, size};
}

- (void)T_setWidth:(CGFloat)width
{
    [self T_setSize:CGSizeMake(width, self.T_height)];
}

- (void)T_setHeight:(CGFloat)height
{
    [self T_setSize:CGSizeMake(self.T_width, height)];
}


#pragma mark - Set Anchor Point
- (void)T_setAnchorPoint:(CGPoint)anchorPoint
{
    [self T_setPosition:self.T_origin atAnchorPoint:anchorPoint];
}

- (void)T_setPosition:(CGPoint)point atAnchorPoint:(CGPoint)anchorPoint
{
    CGFloat x = point.x - anchorPoint.x * self.T_width;
    CGFloat y = point.y - anchorPoint.y * self.T_height;
    [self T_setOrigin:CGPointMake(x, y)];
}


- (UIViewController*)T_getMyVC
{
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
    
}

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size
{
    //    self.width = size.width;
    //    self.height = size.height;
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

@end
