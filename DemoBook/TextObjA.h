//
//  TextObjA.h
//  DemoBook
//
//  Created by apple on 2017/6/9.
//  Copyright © 2017年 duWeiQuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyNSObject.h"
@class TextObjB ;
@class TextObjC ;
@class TextObjD ;
@interface TextObjA : MyNSObject
@property (nonatomic,strong) TextObjB *objB ;
@property (nonatomic,strong) TextObjC *objC ;

@property (nonatomic,weak  ) TextObjD *objD ;

@property (nonatomic,strong) NSString *name ;

@end
