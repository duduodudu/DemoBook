//
//  EOCRectangle.h
//  DemoBook
//
//  Created by apple on 2017/6/6.
//  Copyright © 2017年 duWeiQuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EOCRectangle : NSObject

@property (nonatomic,assign,readonly) float width ;
@property (nonatomic,assign,readonly) float heigth ;

-(id)initWithWidth:(float)width
         andHeight:(float)height ;

@end
