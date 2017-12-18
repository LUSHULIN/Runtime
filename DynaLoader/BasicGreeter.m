//
//  BasicGreeter.m
//  DynaLoader
//
//  Created by Jason on 2017/12/18.
//  Copyright © 2017年 Jason. All rights reserved.
//

#import "BasicGreeter.h"

@implementation BasicGreeter

- (NSString *)greeting:(NSString *)salutation {
    return [NSString stringWithFormat:@"%@,world",salutation];
    
}
@end
