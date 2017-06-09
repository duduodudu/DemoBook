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

#import "TextObjA.h"
#import "TextObjB.h"
#import "TextObjC.h"
#import "TextObjD.h"

/** Block
 * 类型 
 * 属性
 * 参数
 */
typedef void(^BlockTypeA)();

@interface ViewController ()
@property (nonatomic,strong) NSMutableArray *array1 ;
@property (nonatomic,strong) NSMutableArray *array2 ;
@property (nonatomic,strong) NSMutableArray *array3 ;

@property (nonatomic,copy) void (^callback)();

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    EOCAutoDictionary *dict = [EOCAutoDictionary new];
    dict.date = [NSDate dateWithTimeIntervalSince1970:475372800];
    NSLog(@"dict.date = %@",dict.date );
    
    
    EOCRectangle *re = [[EOCRectangle alloc] init];
    NSLog(@"%@",re);
    
    TextObjA *a = [TextObjA new];
    TextObjB *b = [TextObjB new];
    TextObjC *c = [TextObjC new];
    TextObjD *d = [TextObjD new];
    
//        a.objB = b ;
//        b.objC = c ;
//        c.objD = d ;
//        d.objA = a ;


//        a.objC = c ;
//        a.objD = d ;
//    
//        c.objA = a ;
    
    
    NSMutableArray *objArray = [NSMutableArray arrayWithCapacity:100];
    for (int i = 0  ; i < 10 ; i ++) {
        TextObjA *aa = [[TextObjA alloc] init];
        aa.name = [NSString stringWithFormat:@"A %d",i] ;
        [objArray addObject:aa];
    }
    _array1 = objArray ;
    
    NSLog(@"-----------");
    NSMutableArray *objArray2 = [NSMutableArray arrayWithCapacity:100];
    for (int i = 0  ; i < 10 ; i ++) {
        @autoreleasepool {
            TextObjB *bb = [[TextObjB alloc] init];
            bb.name =  [NSString stringWithFormat:@"B %d",i] ;
            [objArray2 addObject:bb];
        }
        
    }
    _array2 = objArray2 ;
    NSLog(@"-----------");
    NSMutableArray *objArray3 = [NSMutableArray arrayWithCapacity:100];
    for (int i = 0  ; i < 10 ; i ++) {
        TextObjC *cc = [[TextObjC alloc] init];
        cc.name =  [NSString stringWithFormat:@"C %d",i]  ;
        [objArray3 addObject:cc];
    }
    _array3 = objArray3 ;
    
    NSLog(@"-");
    dispatch_after(3.0, dispatch_get_main_queue(), ^{
        NSLog(@"哈哈哈：");
    });
     NSLog(@"-");
    
    [self testNSEnumerator];
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

- (void)blockA:(void(^)())block {
    
}

- (void) testNSEnumerator {
    NSEnumerator *e = [_array1 objectEnumerator];
    TextObjA *obj  = nil ;
    while (obj = [e nextObject]) {
        NSLog(@"%@",obj.name);
    }
    
     NSLog(@"-----------");
    NSEnumerator *ee = [_array2 reverseObjectEnumerator];
    TextObjB *obj2   = nil ;
    while (obj2 = [ee nextObject]) {
        NSLog(@"%@",obj2.name);
    }
    
     NSLog(@"-----------");
    for (TextObjC *objc  in _array3) {
        NSLog(@"%@",objc.name );
    }
    
    
      NSLog(@"-----------");
    [_array1 enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"enumerate obj using block %@ ", [(TextObjA *)obj name]);
        if (idx == 5) {
            *stop  = YES ;
            NSLog(@"stop-");
        }
    }];
}


@end
