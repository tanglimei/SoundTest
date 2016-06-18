//
//  SoundView.m
//  Friend
//
//  Created by 唐丽梅 on 16/5/21.
//  Copyright © 2016年 my. All rights reserved.
//

#import "SoundViewButton.h"
#import "TTHeader.h"

@interface SoundViewButton ()

@property(nonatomic, strong)UIImageView* imageView;
@property(nonatomic, strong)UILabel* lblText;


@end

@implementation SoundViewButton

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"luyin_begin"]];
        [self addSubview:_imageView];
        _imageView.userInteractionEnabled = YES;
        
        [_imageView T_setSize:CGSizeMake(XF(100), XF(100))];
        [_imageView T_setPosition:CGPointMake(kScreenW/2, 20) atAnchorPoint:CGPointMake(0.5, 0)];
        
        _lblText = [[UILabel alloc]init];
        [self addSubview:_lblText];
        _lblText.text = @"开始录音";
        
        _lblText.textColor = [UIColor redColor];
        _lblText.font = [UIFont systemFontOfSize:XF(38)];
        _lblText.textAlignment = NSTextAlignmentCenter;
        
        [_lblText T_setSize:CGSizeMake(XF(200), XF(80))];
        [_lblText T_setPosition:CGPointMake(kScreenW/2, _imageView.T_bottom + 5) atAnchorPoint:CGPointMake(0.5, 0)];
        
        UIView * lineView = [[UIView alloc]init];
        [self addSubview:lineView];
        lineView.backgroundColor = TTColor(220, 220, 220);
        lineView.frame = CGRectMake(0, 0, kScreenW, 1);
        
        UIView * lineViewDown = [[UIView alloc]init];
        [self addSubview:lineViewDown];
        lineViewDown.backgroundColor = TTColor(220, 220, 220);
        lineViewDown.frame = CGRectMake(0, frame.size.height-1, kScreenW, 1);
        
        _longPressBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_longPressBtn];
        _longPressBtn.size = CGSizeMake(XF(400), frame.size.height);
        [_longPressBtn T_setPosition:CGPointMake(kScreenW/2, 0) atAnchorPoint:CGPointMake(0.5, 0)];
        [_longPressBtn addTarget:self action:@selector(tapButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)tapButton{
    if (self.delegate && [self.delegate respondsToSelector:@selector(tapTheRecordButton)]) {
        [self.delegate tapTheRecordButton];
    }
}

-(void)setText:(NSString *)text andIsDone:(BOOL)isDone{
    _lblText.text = text;
    if (isDone) {
        _imageView.image = [UIImage imageNamed:@"luyin_done"];
    }else{
        _imageView.image = [UIImage imageNamed:@"luyin_begin"];
    }
}

@end
