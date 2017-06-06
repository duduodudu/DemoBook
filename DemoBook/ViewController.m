//
//  ViewController.m
//  DemoBook
//
//  Created by apple on 2017/6/6.
//  Copyright © 2017年 duWeiQuan. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "EOCAutoDictionary.h"
#import "EOCRectangle.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    EOCAutoDictionary *dict = [EOCAutoDictionary new];
    dict.date = [NSDate dateWithTimeIntervalSince1970:475372800];
    NSLog(@"dict.date = %@",dict.date );
    
    
    EOCRectangle *re = [[EOCRectangle alloc] init];
    NSLog(@"%@",re);
}

- (void)testNSError {
    NSError *error = [[NSError alloc] init];
//    error.domain ;
//    error.code ;
//    error.userInfo ;
    [self doSomething:&error];
    
    
//    @throw [NSException exceptionWithName:<#(nonnull NSExceptionName)#> reason:<#(nullable NSString *)#> userInfo:<#(nullable NSDictionary *)#>]
}
- (BOOL)doSomething:(NSError **)errer {
    
    return YES ;
}



@end
