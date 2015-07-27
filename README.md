# LxPropertyDefaultValue


######	Setup any custom object properties default value easily.

---
###	Installation
	You only need drag LxPropertyDefaultValue.h and LxPropertyDefaultValue.m to your project.
###	Support	
	Minimum support iOS version: iOS 6.0
###	Usage

	#import <UIKit/UIKit.h>
	
	@interface TestClass : NSObject
	
	@property (nonatomic,copy) NSString * string_p;
	@property (nonatomic,retain) NSNumber * number_p;
	@property (nonatomic,retain) NSArray * array_p;
	@property (nonatomic,retain) NSDictionary * dictionary_p;
	@property (nonatomic,retain) UIImage * image_p;
	@property (nonatomic,retain) UIColor * color_p;
	@property (nonatomic,retain) NSObject * object_p;
	
	@property (nonatomic) NSInteger integer_p;
	@property (nonatomic) CGFloat float_p;
	@property (nonatomic) BOOL bool_p;
	@property (nonatomic) char char_p;
	@property (nonatomic) CGPoint point_p;
	@property (nonatomic) CGSize size_p;
	@property (nonatomic) CGRect rect_p;
	@property (nonatomic) CGVector vector_p;
	@property (nonatomic) CGAffineTransform affineTransform_p;
	@property (nonatomic) CATransform3D transform3D_p;
	@property (nonatomic) UIOffset offset_p;
	@property (nonatomic) UIEdgeInsets edgeInsets_p;
	@property (nonatomic) NSRange range;
	
	@property (nonatomic,copy) void (^block_p)(CGFloat, UIImage *);
	
	@end
	
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
	
	//	Then:
	
	TestClass * test = [[TestClass alloc]init];
    
    NSLog(@"test.string_p = %@", test.string_p);
    NSLog(@"test.number_p = %@", test.number_p);
    NSLog(@"test.array_p = %@", test.array_p);
    NSLog(@"test.dictionary_p = %@", test.dictionary_p);
    NSLog(@"test.image_p = %@", test.image_p);
    NSLog(@"test.color_p = %@", test.color_p);
    NSLog(@"test.object_p = %@", test.object_p);
    
    NSLog(@"test.integer_p = %zi", test.integer_p);
    NSLog(@"test.float_p = %f", test.float_p);
    NSLog(@"test.bool_p = %d", test.bool_p);
    NSLog(@"test.char_p = %c", test.char_p);
    NSLog(@"test.point_p = %@", NSStringFromCGPoint(test.point_p));
    NSLog(@"test.size_p = %@", NSStringFromCGSize(test.size_p));
    NSLog(@"test.rect_p = %@", NSStringFromCGRect(test.rect_p));
    NSLog(@"test.vector_p = %@", NSStringFromCGVector(test.vector_p));
    NSLog(@"test.affineTransform_p = %@", NSStringFromCGAffineTransform(test.affineTransform_p));
    NSLog(@"test.offset_p = %@", NSStringFromUIOffset(test.offset_p));
    NSLog(@"test.edgeInsets_p = %@", NSStringFromUIEdgeInsets(test.edgeInsets_p));
    NSLog(@"test.range = %@", NSStringFromRange(test.range));
    NSLog(@"test.block = %@" , test.block_p);

---
###	License
LxPropertyDefaultValue is available under the Apache License 2.0. See the LICENSE file for more info.
