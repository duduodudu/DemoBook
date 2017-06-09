//
//  TextObjC.m
//  DemoBook
//
//  Created by apple on 2017/6/9.
//  Copyright © 2017年 duWeiQuan. All rights reserved.
//

#import "TextObjC.h"
#import "TextObjD.h"
#import "TextObjA.h"
@implementation TextObjC
-(void)dealloc {
    NSLog(@"%4d %s",__LINE__ , __func__ );
}
@end
