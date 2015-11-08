//
//  AppDelegate.h
//  Login With WeiXin
//
//  Created by air on 15/8/20.
//  Copyright (c) 2015年 demo.jaxer.wechat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXApi.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, WXApiDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSString *access_token;
@property (strong, nonatomic) NSString *openid;
@property (strong, nonatomic) NSString *nickname; // 用户昵称
@property (strong, nonatomic) NSString *headimgurl; // 用户头像地址

@end

