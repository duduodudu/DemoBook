//
//  TextObjC.h
//  DemoBook
//
//  Created by apple on 2017/6/9.
//  Copyright © 2017年 duWeiQuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyNSObject.h"
@class TextObjD ;
@class TextObjA ;
@interface TextObjC : MyNSObject

@property (nonatomic,strong) TextObjD *objD ;
@property (nonatomic,strong) TextObjA *objA ;

@property (nonatomic,strong) NSString *name ; 
@end
