//
//  TTHeader.h
//  Friend
//
//  Created by 唐丽梅 on 16/4/11.
//  Copyright © 2016年 my. All rights reserved.
//

#ifndef TTHeader_h
#define TTHeader_h
//#import "DCNavigationController.h"
//#import "IWTextView.h"
//#import "UIBarButtonItem+Extension.h"
#import "UIView+TTFrame.h"
//#import "TTTools.h"
//#import <MJRefresh.h>
//#import <SDWebImage/SDWebImageManager.h>
//#import "UIImageView+WebCache.h"
//#import "UnReadImageView.h"
//#import "HttpTool.h"
//#import "UserData.h"
//#import "NSObject+ModelToDictionary.h"
//#import "HttpURL.h"
//#import <MJExtension.h>
//#import <MBProgressHUD/MBProgressHUD.h>
//
//#import "RongYunManager.h"
//#import <RongIMKit/RongIMKit.h>
//
//
//#import "MJPhotoBrowser.h"
//#import "MJPhoto.h"
//
//#import "CellFrameModel.h"
//
//#import "FriendListModel.h"
//#import "UITabBar+Extension.h"

//各种通知的名称
//通知隐藏评论View
#define kNotificationToHidePingLunView @"kNotificationToHidePingLunView"

#ifdef DEBUG // 调试状态, 打开LOG功能
#define TTLog(...) NSLog(__VA_ARGS__)
#else // 发布状态, 关闭LOG功能
#define TTLog(...)
#endif

#define font(x) [UIFont systemFontOfSize:x]
//iPhone6的尺寸//设置宽度和长度--》iPhone6转过来
#define XF(coordinate) ((coordinate)/2.88)
// 颜色
#define TTColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
//tableView的背景色
#define kTableViewBackColor [TTTools colorWithHexString:@"f9f9f9" alpha:1.0]
#define kRandomColor [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1]

#define font(x) [UIFont systemFontOfSize:x]

#define kNotiCenter [NSNotificationCenter defaultCenter]
// 描边线的颜色
#define kLayerLineColor [TTTools colorWithHexString:@"#dbdbdb" alpha:1.0].CGColor

//-------------------获取设备大小-------------------------
#define isiPhone4 CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(320, 480))
#define isiPhone5 CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(320, 568))
#define isiPhone6 CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(375, 667))
#define isiPhone6P CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(414, 736))

#define kScreenW [[UIScreen mainScreen]bounds].size.width
#define kScreenH [[UIScreen mainScreen]bounds].size.height

#endif /* TTHeader_h */
