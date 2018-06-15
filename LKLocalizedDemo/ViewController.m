//
//  ViewController.m
//  LKLocalizedDemo
//
//  Created by CK on 2018/6/15.
//  Copyright © 2018年 LK. All rights reserved.
//

#import "ViewController.h"
#import "LKSecondViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UIButton *button;
@end

@implementation ViewController

- (UIButton *)button{
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(100, 100, 100, 20);
        [_button setTitle:LKLocalizedString(@"TEXT_BUTTON_TITLE") forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(jumpPageAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.title = LKLocalizedString(@"FIRST_PAGE_TITLE");
    
    [self.view addSubview:self.button];
}

- (void)jumpPageAction{
    LKSecondViewController *ctl = [[LKSecondViewController alloc] init];
    [self.navigationController pushViewController:ctl animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
