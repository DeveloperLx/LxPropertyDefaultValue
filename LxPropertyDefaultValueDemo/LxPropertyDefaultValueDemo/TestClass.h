//
//  TestClass.h
//  LxPropertyDefaultValueDemo
//

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
