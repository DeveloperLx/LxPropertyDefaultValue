//
//  LxPropertyDefaultValue.m
//  LxPropertyDefaultValueDemo
//

#import "LxPropertyDefaultValue.h"
#import <objc/runtime.h>

const char * propertyTypeEncodingOf(objc_property_t property)
{
    const char * propertyAttributes = property_getAttributes(property);
    printf("propertyAttributes ------- %s\n", propertyAttributes);    //
    char buffer[strlen(propertyAttributes) + 1];
    strcpy(buffer, propertyAttributes);
    char *stringp = buffer;
    char *propertyAttribute;
    while ((propertyAttribute = strsep(&stringp, ","))) {
        
        if (propertyAttribute[0] != 'T') {
            continue;
        }
        else {
//            return (const char *)([NSData dataWithBytes:(propertyAttribute + 1) length:strlen(propertyAttribute) - 1].bytes);
            return [[[NSString alloc]initWithData:[NSData dataWithBytes:(propertyAttribute + 1) length:strlen(propertyAttribute) - 1] encoding:NSUTF8StringEncoding] cStringUsingEncoding:NSUTF8StringEncoding];
        }
    }
    
    return NULL;
}

BOOL isObjectFor(const char * objectPropertyTypeEncoding)
{
    return objectPropertyTypeEncoding[0] == '@' && strlen(objectPropertyTypeEncoding) > 1 && objectPropertyTypeEncoding[1] != '?';
}

BOOL isBlockFor(const char * objectPropertyTypeEncoding)
{
    return strlen(objectPropertyTypeEncoding) == 2 && objectPropertyTypeEncoding[0] == '@' && objectPropertyTypeEncoding[1] == '?';
}

Class classOf(const char * objectPropertyTypeEncoding)
{
    if (isObjectFor(objectPropertyTypeEncoding) == NO) {
        return nil;
    }
    
    NSString * className = [NSString stringWithUTF8String:[NSData dataWithBytes:(objectPropertyTypeEncoding + 2) length:strlen(objectPropertyTypeEncoding) - 3].bytes];
    
    return NSClassFromString(className);
}

NSDictionary * objectiveCTypeEncodingDictionary()
{
    return @{@"B":@"BOOL",
             @"c":@"char",
             @"C":@"unsigned char",
             @"s":@"short",
             @"S":@"unsigned short",
             @"i":@"int",
             @"I":@"unsigned int",
             @"l":@"long",
             @"L":@"unsigned long",
             @"q":@"long long",
             @"Q":@"unsigned long long",
             @"f":@"float",
             @"d":@"double",
             @"v":@"void",
             @"@":@"id",
             @"#":@"Class",
             @":":@"SEL",
             @"*":@"char *",
             @"?":@"unknown type",
             @"b":@"bit-fields",
             @"^":@"pointers",
             @"[]":@"arrays",
             @"{?}":@"structures",
             @"{CGPoint=dd}":@"CGPoint",
             @"{CGSize=dd}":@"CGSize",
             @"{CGRect={CGPoint=dd}{CGSize=dd}}":@"CGRect",
             @"{CGVector=dd}":@"CGVector",
             @"{CGAffineTransform=dddddd}":@"CGAffineTransform",
             @"{CATransform3D=dddddddddddddddd}":@"CATransform3D",
             @"{UIOffset=dd}":@"UIOffset",
             @"{UIEdgeInsets=dddd}":@"UIEdgeInsets",
             @"{_NSRange=QQ}":@"NSRange",
             @"(?)":@"unions",
             @"r":@"const",
             @"n":@"in",
             @"N":@"inout",
             @"o":@"out",
             @"O":@"bycopy",
             @"V":@"oneway"};
}

void LxSetupDefaultPropertyValue(NSObject * object)
{
    @try {
        
        unsigned int outCount;
        objc_property_t *properties = class_copyPropertyList([object class], &outCount);
        
        for (int i = 0; i < outCount; i++) {
            
            objc_property_t property = properties[i];
            const char * propertyTypeEncoding = propertyTypeEncodingOf(property);
            NSString * propertyName = [NSString stringWithUTF8String:property_getName(property)];
//            NSLog(@"propertyTypeEncoding = %s", propertyTypeEncoding); //
            if (isObjectFor(propertyTypeEncoding)) {
                
                Class propertyClass = classOf(propertyTypeEncoding);
                
                if (propertyClass == [NSString class]) {
                    [object setValue:LX_STRING_DEFAULT_VALUE forKey:propertyName];
                }
                else if (propertyClass == [NSNumber class]) {
                    [object setValue:LX_NUMBER_DEFAULT_VALUE forKey:propertyName];
                }
                else if (propertyClass == [NSArray class] || propertyClass == [NSMutableArray class]) {
                    [object setValue:LX_ARRAY_DEFAULT_VALUE forKey:propertyName];
                }
                else if (propertyClass == [NSDictionary class] || propertyClass == [NSMutableDictionary class]) {
                    [object setValue:LX_DICTIONARY_DEFAULT_VALUE forKey:propertyName];
                }
                else if (propertyClass == [UIImage class]) {
                    [object setValue:LX_IMAGE_DEFAULT_VALUE forKey:propertyName];
                }
                else if (propertyClass == [UIColor class]) {
                    [object setValue:LX_COLOR_DEFAULT_VALUE forKey:propertyName];
                }
                else {
                    [object setValue:LX_OBJECT_DEFAULT_VALUE forKey:propertyName];
                }
            }
            else if (isBlockFor(propertyTypeEncoding)) {
                [object setValue:LX_BLOCK_DEFAULT_VALUE forKey:propertyName];
            }
            else {
                NSString * propertyTypeEncodingString = [NSString stringWithUTF8String:propertyTypeEncoding];
                NSString * typeName = [objectiveCTypeEncodingDictionary() valueForKey:propertyTypeEncodingString];
//                NSLog(@"%@, %s, %@", propertyName, propertyTypeEncoding, typeName); //
                if ([typeName isEqualToString:@"short"] || [typeName isEqualToString:@"unsigned short"]
                    || [typeName isEqualToString:@"int"] || [typeName isEqualToString:@"unsigned int"]
                    || [typeName isEqualToString:@"long"] || [typeName isEqualToString:@"unsigned long"]
                    || [typeName isEqualToString:@"long long"] || [typeName isEqualToString:@"unsigned long long"]) {
                    [object setValue:@(LX_INTEGER_DEFAULT_VALUE) forKey:propertyName];
                }
                else if ([typeName isEqualToString:@"float"] || [typeName isEqualToString:@"double"]) {
                    [object setValue:@(LX_FLOAT_DEFAULT_VALUE) forKey:propertyName];
                }
                else if ([typeName isEqualToString:@"BOOL"]) {
                    [object setValue:@(LX_BOOL_DEFAULT_VALUE) forKey:propertyName];
                }
                else if ([typeName isEqualToString:@"char"] || [typeName isEqualToString:@"unsigned char"]) {
                    [object setValue:@(LX_CHAR_DEFAULT_VALUE) forKey:propertyName];
                }
                else if ([typeName isEqualToString:@"CGPoint"]) {
                    [object setValue:[NSValue valueWithCGPoint:LX_POINT_DEFAULT_VALUE] forKey:propertyName];
                }
                else if ([typeName isEqualToString:@"CGSize"]) {
                    [object setValue:[NSValue valueWithCGSize:LX_SIZE_DEFAULT_VALUE] forKey:propertyName];
                }
                else if ([typeName isEqualToString:@"CGRect"]) {
                    [object setValue:[NSValue valueWithCGRect:LX_RECT_DEFAULT_VALUE] forKey:propertyName];
                }
                else if ([typeName isEqualToString:@"CGVector"]) {
                    [object setValue:[NSValue valueWithCGVector:LX_VECTOR_DEFAULT_VALUE] forKey:propertyName];
                }
                else if ([typeName isEqualToString:@"CGAffineTransform"]) {
                    [object setValue:[NSValue valueWithCGAffineTransform:LX_AFFINE_TRANSFORM_DEFAULT_VALUE] forKey:propertyName];
                }
                else if ([typeName isEqualToString:@"CATransform3D"]) {
                    [object setValue:[NSValue valueWithCATransform3D:LX_TRANSFORM_3D_DEFAULT_VALUE] forKey:propertyName];
                }
                else if ([typeName isEqualToString:@"UIOffset"]) {
                    [object setValue:[NSValue valueWithUIOffset:LX_OFFSET_DEFAULT_VALUE] forKey:propertyName];
                }
                else if ([typeName isEqualToString:@"UIEdgeInsets"]) {
                    [object setValue:[NSValue valueWithUIEdgeInsets:LX_INSETS_DEFAULT_VALUE] forKey:propertyName];
                }
                else if ([typeName isEqualToString:@"NSRange"]) {
                    [object setValue:[NSValue valueWithRange:LX_RANGE_DEFAULT_VALUE] forKey:propertyName];
                }
                else {
                
                }
            }
        }
        
        free(properties);
    }
    @catch (NSException *exception) {
        NSLog(@"LxSetupDefaultPropertyValue: throw exception: %@", exception.reason); //
    }
    @finally {
        
    }
}