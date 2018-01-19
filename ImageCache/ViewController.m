//
//  ViewController.m
//  ImageCache
//
//  Created by xxpang on 2018/1/19.
//  Copyright © 2018年 TS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (retain, nonatomic) UIImageView *imgView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0), ^{
        NSData *imgData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"https://i.loli.net/2018/01/19/5a6163f324673.gif"]];
        [imgData writeToFile:@"cache path" atomically:YES];
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage *img = [[UIImage alloc] initWithData:imgData];
            self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
            self.imgView.image = img;
            [self.view addSubview:self.imgView];
        });
    });
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
