//
//  ViewController.m
//  Example1
//
//  Created by lujiangbin on 16/1/28.
//  Copyright © 2016年 lujiangbin. All rights reserved.
//

#import "ViewController.h"
#import "SSKeychain.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *sharedTextfield;

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

- (IBAction)setByUIPasteboard:(id)sender
{
    UIPasteboard *pasteboard = [UIPasteboard pasteboardWithName:@"myPasteboard" create:YES];
    pasteboard.string = _sharedTextfield.text;
}


- (IBAction)open:(id)sender {
    NSString *string = @"Example2://name=jiangbin#age=1";
    NSURL *url = [NSURL URLWithString:string];
    [[UIApplication sharedApplication] openURL:url];
}
- (IBAction)setKeyChain:(id)sender
{
    [_sharedTextfield resignFirstResponder];
    [SSKeychain deletePasswordForService:@"myservice" account:@"jiangbin"];
    [SSKeychain setPassword:_sharedTextfield.text forService:@"myservice" account:@"jiangbin"];
}
- (IBAction)setAppGroup:(id)sender
{
    [_sharedTextfield resignFirstResponder];
    NSUserDefaults *myDefaults = [[NSUserDefaults alloc]
                                  initWithSuiteName:@"group.com.jiangbin.SharedData"];
    [myDefaults setObject:_sharedTextfield.text forKey:@"mykey"];
}

@end
