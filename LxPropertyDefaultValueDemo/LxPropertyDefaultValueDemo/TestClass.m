//
//  TestClass.m
//  LxPropertyDefaultValueDemo
//

#import "TestClass.h"
#import "LxPropertyDefaultValue.h"

@implementation TestClass

- (instancetype)init
{
    self = [super init];
    if (self) {
        LxSetupDefaultPropertyValue(self);        
    }
    return self;
}

@end
