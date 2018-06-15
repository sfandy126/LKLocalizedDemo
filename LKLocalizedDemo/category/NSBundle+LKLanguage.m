//
//  NSBundle+LKLanguage.m
//  LKLocalizedDemo
//
//  Created by CK on 2018/6/15.
//  Copyright © 2018年 LK. All rights reserved.
//

#import "NSBundle+LKLanguage.h"
#import <objc/runtime.h>

static const char *kLKBundleLanguageKey = "kLKBundleLanguageKey";

@interface LKBundle : NSBundle

@end

@implementation LKBundle

- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName {
    NSBundle *bundle = objc_getAssociatedObject(self, kLKBundleLanguageKey);
    return bundle ? [bundle localizedStringForKey:key value:value table:tableName] : [super localizedStringForKey:key value:value table:tableName];
}

@end


@implementation NSBundle (Language)

+ (void)setLanguage:(NSString *)language {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object_setClass([NSBundle mainBundle], [LKBundle class]);
    });
    
    objc_setAssociatedObject([NSBundle mainBundle], kLKBundleLanguageKey, language ? [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:language ofType:@"lproj"]] : nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
