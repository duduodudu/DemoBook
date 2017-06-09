//
//  EOCAutoDictionary.h
//  DemoBook
//
//  Created by apple on 2017/6/6.
//  Copyright © 2017年 duWeiQuan. All rights reserved.
//

#import "MyNSObject.h"

@interface EOCAutoDictionary : MyNSObject
/**  */
@property (nonatomic,strong) NSString *string ;
@property (nonatomic,strong) NSNumber *number ;

@property (nonatomic,strong) NSDate *date ;

@property (nonatomic,strong) id opaqueObject ;


@end
