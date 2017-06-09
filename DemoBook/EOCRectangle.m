//
//  EOCRectangle.m
//  DemoBook
//
//  Created by apple on 2017/6/6.
//  Copyright © 2017年 duWeiQuan. All rights reserved.
//
//#ifdef DEBUG
//#define NSLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
//#else
//#define NSLog(FORMAT, ...) nil
//#endif



#import "EOCRectangle.h"
#import <objc/runtime.h>

@implementation EOCRectangle
- (instancetype)initWithWidth:(float)width andHeight:(float)height
{
    self = [super init];
    if (self) {
         NSLog(@"行数:%d :%s",__LINE__,__func__);
        _width = width ;
        _heigth = height ;
    }
    return self;
}
-(instancetype)init {
    NSLog(@"行数:%d :%s",__LINE__,__func__);
    return [self initWithWidth:5.0 andHeight:10.0];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        NSLog(@"行数:%d :%s",__LINE__,__func__);
        _width = [coder decodeFloatForKey:@"width"];
        _heigth = [coder decodeFloatForKey:@"height"];
    }
    return self;
}

-(NSString *)description {
    NSLog(@"-----------");
    NSLog(@"%@",[super description]);
    [self printAllPropertiesAndValues];
    NSLog(@"------------------");
    NSLog(@"%@",[self properties_aps]);
    return @"-----------" ;
}
// po命令
-(NSString *)debugDescription {
    return @"";
}
/// 获取所有的属性名字
+ (NSArray *)getAllProperties:(id)obj
{
    u_int count = 0 ;
    objc_property_t *properties  =class_copyPropertyList([obj class], &count);
    NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i<count; i++)
    {
        const char* propertyName = property_getName(properties[i]);
        NSString *propertyString = [NSString stringWithUTF8String: propertyName] ;
        NSLog(@"属性%@ = %@ \n",propertyString,[obj valueForKey:propertyString]);
        [propertiesArray addObject:[NSString stringWithUTF8String: propertyName]];
    }
    free(properties);
    return propertiesArray;
}
/// 获取所有的方法名字
+ (void)LogAllMethodsFromClass:(id)obj
{
    u_int count;
    //class_copyMethodList 获取类的所有方法列表
    Method *mothList_f = class_copyMethodList([obj class],&count) ;
    for (int i = 0; i < count; i++) {
        Method temp_f = mothList_f[i];
        // method_getImplementation  由Method得到IMP函数指针
//        IMP imp_f = method_getImplementation(temp_f);
        
        // method_getName由Method得到SEL
        SEL name_f = method_getName(temp_f);
        
        const char * name_s = sel_getName(name_f);
        // method_getNumberOfArguments  由Method得到参数个数
        int arguments = method_getNumberOfArguments(temp_f);
        // method_getTypeEncoding  由Method得到Encoding 类型
        const char * encoding = method_getTypeEncoding(temp_f);
        
        NSLog(@"方法名：%@\n,参数个数：%d\n,编码方式：%@\n",[NSString stringWithUTF8String:name_s],
              arguments,[NSString stringWithUTF8String:encoding]);
    }
    free(mothList_f);
    
}

//Model 到字典
- (NSDictionary *)properties_aps
{
    NSMutableDictionary *props = [NSMutableDictionary dictionary];
    unsigned int outCount = 0 , i = 0 ;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (i = 0; i < outCount ; i++)
    {
        objc_property_t property = properties[i];
        const char* char_f =property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        id propertyValue = [self valueForKey:(NSString *)propertyName];
        if (propertyValue)
            [props setObject:propertyValue forKey:propertyName];
    }
    free(properties);
    return props;
}

/// 获取所有的属性名字
- (void)printAllPropertiesAndValues
{
    NSLog(@"line:%04d method:%s",__LINE__ ,__func__ );
    u_int count = 0 ;
    objc_property_t *properties  =class_copyPropertyList([self class], &count);
    NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i < count; i ++)
    {
        const char* propertyName = property_getName(properties[i]);
        NSString *propertyString = [NSString stringWithUTF8String: propertyName] ;
        NSLog(@" %@ = %@ \n",propertyString,[self valueForKey:propertyString]);
        [propertiesArray addObject:[NSString stringWithUTF8String: propertyName]];
    }
    free(properties);
}


@end
