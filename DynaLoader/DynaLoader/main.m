//
//  main.m
//  DynaLoader
//
//  Created by Jason on 2017/12/18.
//  Copyright © 2017年 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicGreeter.h"
#import <objc/runtime.h>
#import <objc/message.h>

static void display(id self, SEL _cmd){
    NSLog(@"invoking method with selector %@ on %@ instance",NSStringFromSelector(_cmd),[self className]);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //创建类
        Class widgetClass = objc_allocateClassPair([NSObject class],"Widtget", 0);
        
        //添加函数
        const char *types = "v@:";
        class_addMethod(widgetClass, @selector(display), (IMP)display,types);
        
        //添加属性
        const char *height = "height";
        class_addIvar(widgetClass, height, sizeof(id), rint(log2(sizeof(id))),@encode(id));
        
        //注册类
        objc_registerClassPair(widgetClass);
        
        //创建类对象
        id widget = [[widgetClass alloc]init];
        
        //设置属性
        id value = [NSNumber numberWithInt:20];
        [widget setValue:value forKey:[NSString stringWithUTF8String:height]];
        NSLog(@"widget instance height =%@",[widget valueForKey:[NSString stringWithUTF8String:height]]);
        
        //设置属性
        NSNumber *width = [NSNumber numberWithInt:10];
        objc_setAssociatedObject(widget, @"width", width, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        id result = objc_getAssociatedObject(widget, @"width");
        NSLog(@"widget instance width =%@",result);
        
        
    }
    return 0;
}
