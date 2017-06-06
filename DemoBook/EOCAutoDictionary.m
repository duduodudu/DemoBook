//
//  EOCAutoDictionary.m
//  DemoBook
//
//  Created by apple on 2017/6/6.
//  Copyright © 2017年 duWeiQuan. All rights reserved.
//

#import "EOCAutoDictionary.h"
#import <objc/runtime.h>

@interface EOCAutoDictionary ()
@property (nonatomic,strong) NSMutableDictionary *backingStore;
@end


@implementation EOCAutoDictionary
@dynamic string,number,date,opaqueObject ;

+(void)load {
    [self exchangeMethod];
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        _backingStore = [NSMutableDictionary new];
        NSLog(@"方法执行了:%s 行数：%d %@",__func__,__LINE__,NSStringFromSelector(_cmd));
    }
    return self;
}
/// getter 函数实现
id autoDictionaryGetter (id self ,SEL _cmd){
    /// get the blacking store from the object
    EOCAutoDictionary *typeSelf = (EOCAutoDictionary *)self;
    NSMutableDictionary *backStore = typeSelf.backingStore ;
    
    /// the key is simple the selector name
    NSString *key = NSStringFromSelector(_cmd);
    
    // return the value
    return [backStore objectForKey:key];
}
/// setter 函数实现
void autoDictionarySetter(id self , SEL _cmd, id value) {
    /// get the blacking Store from the object
    EOCAutoDictionary *typeSelf = (EOCAutoDictionary *)self;
    NSMutableDictionary *backingStore = (NSMutableDictionary *) typeSelf.backingStore ;
    
    ///
    NSString *selString = NSStringFromSelector(_cmd);
    NSMutableString *key = [selString mutableCopy];
    
    /// remove ":" at the end
    [key deleteCharactersInRange:(NSMakeRange(key.length - 1 , 1))];
   
    /// remove "set" prefix
    [key deleteCharactersInRange:(NSMakeRange(0, 3))];
    
    /// lowercase the first character
    NSString *lowercaseFirstChar = [[key substringToIndex:1] lowercaseString];
    [key replaceCharactersInRange:(NSMakeRange(0, 1)) withString:lowercaseFirstChar];
    
    /// set Value
    if (value) {
        [backingStore setObject:value forKey:key];
    } else {
        [backingStore removeObjectForKey:key];
    }
    
}



+(BOOL)resolveInstanceMethod:(SEL)sel
{
    NSString *selectorString = NSStringFromSelector(sel);
    if ([selectorString hasPrefix:@"set"]) {
        class_addMethod(self, sel, (IMP)autoDictionarySetter, "v@:@");
    } else {
        class_addMethod(self, sel, (IMP)autoDictionaryGetter, "@@:");
    }
    return YES ;
}
/// 交换方法
+ (void)exchangeMethod {
    Method method1 = class_getInstanceMethod(self.class, @selector(init));
    Method method2 = class_getInstanceMethod(self.class, @selector(myInit));
    method_exchangeImplementations(method1, method2);
    
}



- (instancetype)myInit{
    NSLog(@"这个方法执行:%s 行数：%d %@",__func__,__LINE__,NSStringFromSelector(_cmd));
    return [self myInit];
}



@end
