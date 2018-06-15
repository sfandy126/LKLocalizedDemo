//
//  NSBundle+LKLanguage.h
//  LKLocalizedDemo
//
//  Created by CK on 2018/6/15.
//  Copyright © 2018年 LK. All rights reserved.
//

#import <Foundation/Foundation.h>

///国际语言本地化
#define LKLocalizedString(key) NSLocalizedStringFromTable(key, @"InfoPlist", nil)

static NSString *kLanguageKey = @"kLanguageKey";

static NSString *kChinese = @"zh-Hans";
static NSString *kEnglish = @"en";

@interface NSBundle (LKLanguage)

+ (void)setLanguage:(NSString *)language;

@end
