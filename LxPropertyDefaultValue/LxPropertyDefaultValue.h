//
//  LxPropertyDefaultValue.h
//  LxPropertyDefaultValueDemo
//


#define LX_STRING_DEFAULT_VALUE             @""
#define LX_NUMBER_DEFAULT_VALUE             @0
#define LX_ARRAY_DEFAULT_VALUE              @[]
#define LX_DICTIONARY_DEFAULT_VALUE         @{}
#define LX_IMAGE_DEFAULT_VALUE              [UIImage new]
#define LX_COLOR_DEFAULT_VALUE              [UIColor whiteColor]
#define LX_OBJECT_DEFAULT_VALUE             nil
#define LX_INTEGER_DEFAULT_VALUE            0
#define LX_FLOAT_DEFAULT_VALUE              0.0
#define LX_BOOL_DEFAULT_VALUE               NO
#define LX_CHAR_DEFAULT_VALUE               '\0'
#define LX_POINT_DEFAULT_VALUE              CGPointZero
#define LX_SIZE_DEFAULT_VALUE               CGSizeZero
#define LX_RECT_DEFAULT_VALUE               CGRectZero
#define LX_VECTOR_DEFAULT_VALUE             ((CGVector){0, 0})
#define LX_AFFINE_TRANSFORM_DEFAULT_VALUE   CGAffineTransformIdentity
#define LX_TRANSFORM_3D_DEFAULT_VALUE       CATransform3DIdentity
#define LX_OFFSET_DEFAULT_VALUE             UIOffsetZero
#define LX_INSETS_DEFAULT_VALUE             UIEdgeInsetsZero
#define LX_RANGE_DEFAULT_VALUE              ((NSRange){0, 0})
#define LX_BLOCK_DEFAULT_VALUE              NULL


#import <UIKit/UIKit.h>

/**
 *  Not influence super class properties.
 */
void LxSetupDefaultPropertyValue(NSObject * object);
