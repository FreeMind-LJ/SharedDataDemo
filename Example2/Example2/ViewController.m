//
//  ViewController.m
//  Example2
//
//  Created by lujiangbin on 16/1/28.
//  Copyright © 2016年 lujiangbin. All rights reserved.
//

#import "ViewController.h"
#import "SSKeychain.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getByUIPasteboard:(id)sender
{
    UIPasteboard *pasteboard = [UIPasteboard pasteboardWithName:@"myPasteboard" create:NO];
    NSString *content = pasteboard.string;
    [self showContent:content];
}

- (IBAction)getByKeychain:(id)sender
{
    NSString *content = [SSKeychain passwordForService:@"myservice" account:@"jiangbin"];
    [self showContent:content];
}
- (IBAction)getByAppGroup:(id)sender {
    NSUserDefaults *myDefaults = [[NSUserDefaults alloc]
                                  initWithSuiteName:@"group.com.jiangbin.SharedData"];
    NSString *content = [myDefaults objectForKey:@"mykey"];
    [self showContent:content];
}

-(void)showContent:(NSString*)content
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"消息" message:content delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}

@end
