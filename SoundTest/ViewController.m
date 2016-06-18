//
//  ViewController.m
//  SoundTest
//
//  Created by 唐丽梅 on 16/6/18.
//  Copyright © 2016年 my. All rights reserved.
//

#import "ViewController.h"
#import "SoundViewButton.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface ViewController ()<SoundViewButtonDelegate,AVAudioRecorderDelegate>

@property(nonatomic, strong)SoundViewButton* soundViewButton;
@property(nonatomic, assign)NSInteger soundTime;
@property(nonatomic, assign)NSInteger totalTimeLength;
@property(nonatomic, strong)AVAudioRecorder* audioRecorder;
@property(nonatomic, strong)AVAudioPlayer* audioPlayer;
@property(nonatomic, strong)NSTimer* audioTimer;
@end

@implementation ViewController

//录音机
-(AVAudioRecorder *)audioRecorder{
    if (!_audioRecorder) {
        NSURL * url = [self getSavePath];
        NSDictionary *setting = [self getAudioSetting];
        NSError * error = nil;
        _audioRecorder = [[AVAudioRecorder alloc]initWithURL:url settings:setting error:&error];
        _audioRecorder.delegate = self;
        if (error) {
            NSLog(@"创建录音机时发生错误");
            return nil;
        }
    }
    return _audioRecorder;
}

//播放器
//-(AVAudioPlayer *)audioPlayer{
//    if (!_audioPlayer) {
//        
//    }
//    return _audioPlayer;
//}

-(NSTimer *)audioTimer{
    if (!_audioTimer) {
        _audioTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(addSoundTime:) userInfo:nil repeats:YES];
        self.soundTime = 0;
    }
    return _audioTimer;
}

//取得录音文件保存路径
- (NSURL *)getSavePath{
    NSString *urlStr=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    urlStr = [urlStr stringByAppendingPathComponent:[NSString stringWithFormat: @"11.%@", @"wav"]];
    NSURL * url = [NSURL fileURLWithPath:urlStr];
    return url;
}

//取得录音文件设置
- (NSDictionary *)getAudioSetting{
    NSMutableDictionary * dicM = [NSMutableDictionary dictionary];
    [dicM setObject:@(kAudioFormatLinearPCM) forKey:AVFormatIDKey];//设置录音格式
    [dicM setObject:@(44100.0) forKey:AVSampleRateKey];
    [dicM setObject:@(16) forKey:AVLinearPCMBitDepthKey];
    [dicM setObject:@(1) forKey:AVNumberOfChannelsKey];
    [dicM setObject:@(NO) forKey:AVLinearPCMIsBigEndianKey];
    [dicM setObject:@(NO) forKey:AVLinearPCMIsFloatKey];
    return dicM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _soundViewButton = [[SoundViewButton alloc]initWithFrame:CGRectMake(0, 100, 200, 200)];
    _soundViewButton.delegate = self;
    _soundViewButton.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_soundViewButton];
    
    
    UILongPressGestureRecognizer * longPresure = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressBtn:)];
    [_soundViewButton.longPressBtn addGestureRecognizer:longPresure];
}

- (void)longPressBtn:(UILongPressGestureRecognizer *)gesture{
    
    if (gesture.state == UIGestureRecognizerStateBegan) {
        self.soundTime = 0;
        self.totalTimeLength = 0;
        [self.soundViewButton setText:[NSString stringWithFormat:@"%lds",(long)self.soundTime] andIsDone:NO];
        [self.audioRecorder stop];
        [self.audioRecorder record];
        [self.audioTimer fire];
    }else if(gesture.state == UIGestureRecognizerStateEnded || gesture.state == UIGestureRecognizerStateCancelled || gesture.state == UIGestureRecognizerStateFailed){
        [self.audioRecorder stop];
        [self.audioTimer invalidate];
        self.audioTimer = nil;
        self.totalTimeLength = self.soundTime;
        NSLog(@"state - %ld",(long)gesture.state);
    }
}

- (void)addSoundTime:(NSTimer *)timer{
    self.soundTime += 1;
    if (self.soundTime <= 60) {
        if (self.soundTime == self.totalTimeLength) {
            [timer invalidate];
        }
        NSLog(@"soundTIme - %ld",(long)self.soundTime);
        [self.soundViewButton setText:[NSString stringWithFormat:@"%lds",(long)self.soundTime] andIsDone:NO];
    }else{
        [self.audioRecorder stop];
        [timer invalidate];
    }
}

- (void)tapTheRecordButton{
    NSURL * url = [self getSavePath];
    NSError * error = nil;
    _audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];
    _audioPlayer.numberOfLoops = 0;
    [_audioPlayer prepareToPlay];
    if (error) {
        NSLog(@"创建播放器时发生错误，错误信息：%@",error.localizedDescription);
    }
    [self.audioPlayer play];
    NSLog(@"录音播放中");
}

@end
