//
//  SoundView.h
//  Friend
//
//  Created by 唐丽梅 on 16/5/21.
//  Copyright © 2016年 my. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SoundViewButtonDelegate <NSObject>

- (void)tapTheRecordButton;

@end

@interface SoundViewButton : UIView
@property(nonatomic, assign)id<SoundViewButtonDelegate> delegate;
@property(nonatomic, strong)UIButton* longPressBtn;

- (void)setText:(NSString *)text andIsDone:(BOOL)isDone;

@end
