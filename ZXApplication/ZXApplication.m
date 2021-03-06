//
//  ZXApplication.m
//  ZXTools
//
//  Created by 张 玺 on 12-9-4.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

#import "ZXApplication.h"

@implementation ZXApplication

+(NSString *)documentPath
{
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
}
+(NSString *)appVersion
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

+(BOOL)isJailBreak
{
    int res = system("ls");
    if (res == 0)
        return YES;
    else
        return NO;
}
+(float)iOSVersion
{
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}
+(BOOL)isIpad
{
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}

+(NSString *)language
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *languages = [defaults objectForKey:@"AppleLanguages"];
    return [languages objectAtIndex:0];
}
+(BOOL)isIPhone5
{
    if([ZXApplication isIpad]) return NO;
    
    NSString *platform = [ZXApplication platform];
    
    if([platform compare:@"iPhone5,1"]== NSOrderedSame ||
       [platform compare:@"iPhone5,1"]== NSOrderedDescending )
        return YES;
    return NO;
}
+(NSString *)platform{
    
    size_t size;
    
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    
    char *machine = malloc(size);
    
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    
    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    
    free(machine);
    
    return platform;
}
+(void)rate:(NSString *)app
{
    NSString *url = [NSString stringWithFormat: @"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@",app];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

+(void)showInfo
{
    #ifdef DEBUG
    #else
        return;
    #endif
    
    
    NSLog(@"document:%@",[ZXApplication documentPath]);
    NSLog(@"%@",[ZXApplication isJailBreak]?@"越狱":@"没越狱");
    NSLog(@"app version:%@",[ZXApplication appVersion]);
    NSLog(@"iOS version:%f",[ZXApplication iOSVersion]);
    NSLog(@"is iPad : %@",[ZXApplication isIpad]?@"yes":@"no");
    NSLog(@"language : %@",[ZXApplication language]);
    NSLog(@"platform : %@",[ZXApplication platform]);
    NSLog(@"is Iphone5 : %@",[ZXApplication isIPhone5]?@"yes":@"no");
    
    NSLog(@"****************************************");
}
@end
