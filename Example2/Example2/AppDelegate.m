//
//  AppDelegate.m
//  Example2
//
//  Created by lujiangbin on 16/1/28.
//  Copyright © 2016年 lujiangbin. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    if ([[url scheme] isEqualToString:@"Example2"]) {
        NSString *content = [url resourceSpecifier];
        //解析content获取数据
        //...
        return YES;
    }
    return NO;
}
@end
