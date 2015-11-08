//
//  ViewController.m
//  Login With WeiXin
//
//  Created by air on 15/8/20.
//  Copyright (c) 2015年 demo.jaxer.wechat. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
@property (strong, nonatomic) UILabel *nickname; // 昵称
@property (strong, nonatomic) UIImageView *imageView; // 用户头像
@property (strong, nonatomic) UIButton *loginButton; // 登录按钮
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加观察者
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(display)
                                                 name:@"Note"
                                               object:nil];
    
    // 初始化昵称
    _nickname = [[UILabel alloc] initWithFrame:CGRectMake(120, 50, 60, 30)];
    [_nickname setBackgroundColor:[UIColor grayColor]];
    _nickname.textAlignment = NSTextAlignmentCenter; // 设置文字居中
    [self.view addSubview:_nickname];
    
    // 初始化头像
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    _imageView.backgroundColor = [UIColor yellowColor];
    _imageView.layer.cornerRadius = 50; // 设置为圆形
    _imageView.layer.masksToBounds = YES; // 若不加这句话，加载的图片还是矩形的。
    [self.view addSubview:_imageView];
    
    // 初始化登录按钮
    _loginButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 100, 30)];
    [_loginButton setTitle:@"微信登录" forState:UIControlStateNormal];
    _loginButton.backgroundColor = [UIColor blueColor];
    _loginButton.layer.cornerRadius = 5.0f;
    [_loginButton addTarget:self action:@selector(sendAuthRequest) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginButton];
}

// 授权登录
- (void)sendAuthRequest {
    SendAuthReq *req =[[SendAuthReq alloc ] init];
    req.scope = @"snsapi_userinfo"; // 此处不能随意改
    req.state = @"123"; // 这个貌似没影响
    [WXApi sendReq:req];
}

// 显示昵称和头像
- (void)display {
    AppDelegate *appdelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSString *str = appdelegate.nickname;
    NSLog(@"display.nickname = %@", str);
    [_nickname setText:str];
    
    NSString *url = appdelegate.headimgurl;
    NSLog(@"display.url = %@", url);
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:url]]];
    self.imageView.image = image;
}

@end