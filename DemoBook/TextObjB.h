//
//  TextObjB.h
//  DemoBook
//
//  Created by apple on 2017/6/9.
//  Copyright © 2017年 duWeiQuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyNSObject.h"
@class TextObjC ;
@interface TextObjB : MyNSObject

@property (nonatomic,strong) TextObjC *objC ;
@property (nonatomic,strong) NSString *name ;

@end
