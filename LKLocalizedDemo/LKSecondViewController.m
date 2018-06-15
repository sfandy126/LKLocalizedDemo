//
//  LKSecondViewController.m
//  LKLocalizedDemo
//
//  Created by CK on 2018/6/15.
//  Copyright © 2018年 LK. All rights reserved.
//

#import "LKSecondViewController.h"
#import "ViewController.h"

@interface LKSecondViewController ()<UIActionSheetDelegate>
@property (nonatomic,strong) UIButton *button;

@end

@implementation LKSecondViewController

- (UIButton *)button{
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(100, 100, 100, 20);
        [_button setTitle:LKLocalizedString(@"TEXT_SWITCH_TITLE") forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(switchAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.title = LKLocalizedString(@"SSECOND_PAGE_TITLE");
    [self.view addSubview:self.button];

}

- (void)switchAction{
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"简体中文",@"English", nil];
    [sheet showInView:self.view];
}


#pragma mark - - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *language = @"";
    if (buttonIndex==0) {//中文
        language = kChinese;
    }
    if (buttonIndex==1) {//英文
        language = kEnglish;
    }
    
    if (language.length>0 && ![[[NSUserDefaults standardUserDefaults] objectForKey:kLanguageKey] isEqualToString:language]) {
        [NSBundle setLanguage:language];
        [[NSUserDefaults standardUserDefaults] setObject:language forKey:kLanguageKey];
        
        ViewController *ctl = [[ViewController alloc] init];
        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:ctl];
        UIWindow *window = [UIApplication sharedApplication].delegate.window;
        window.rootViewController = navi;
        [window makeKeyAndVisible];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            LKSecondViewController *secCtl = [[LKSecondViewController alloc] init];
            [navi pushViewController:secCtl animated:NO];
        });
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
