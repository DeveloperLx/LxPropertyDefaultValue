//
//  ViewController.m
//  LxPropertyDefaultValueDemo
//

#import "ViewController.h"
#import "TestClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

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
}

@end
