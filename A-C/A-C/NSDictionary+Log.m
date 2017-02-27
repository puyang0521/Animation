//
//  NSDictionary+Log.m
//
//  Created by puyang on 2016/12/15.


#import "NSDictionary+Log.h"

@implementation NSDictionary (Log)

// NSLog输出
- (NSString *)descriptionWithLocale:(id)locale
 {
         NSMutableString *string = [NSMutableString string];

        // 开头有个{
         [string appendString:@"{\n"];
    
        // 遍历所有的键值对
         [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
                [string appendFormat:@"\t%@", key];
                 [string appendString:@" = "];
                 [string appendFormat:@"%@,\n", obj];
             }];
    
        // 结尾有个}
         [string appendString:@"}"];
    
         // 查找最后一个逗号
         NSRange range = [string rangeOfString:@"," options:NSBackwardsSearch];
         if (range.location != NSNotFound)
             [string deleteCharactersInRange:range];
    
         return string;
 }

// 输出台po命令输出
-(NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level
{
    NSMutableString *string = [NSMutableString string];
    
    // 开头有个{
    [string appendString:@"{\n"];
    
    // 遍历所有的键值对
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [string appendFormat:@"\t%@", key];
        [string appendString:@" = "];
        [string appendFormat:@"%@,\n", obj];
    }];
    
    // 结尾有个}
    [string appendString:@"}"];
    
    // 查找最后一个逗号
    NSRange range = [string rangeOfString:@"," options:NSBackwardsSearch];
    if (range.location != NSNotFound)
        [string deleteCharactersInRange:range];
    
    return string;
}
@end


// 数组输出
@implementation NSArray (Log)
- (NSString *)descriptionWithLocale:(id)locale
 {
         NSMutableString *string = [NSMutableString string];
    
         // 开头有个[
         [string appendString:@"[\n"];
    
         // 遍历所有的元素
         [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                 [string appendFormat:@"\t%@,\n", obj];
             }];
    
         // 结尾有个]
         [string appendString:@"]"];
    
         // 查找最后一个逗号
         NSRange range = [string rangeOfString:@"," options:NSBackwardsSearch];
         if (range.location != NSNotFound)
             [string deleteCharactersInRange:range];
     
         return string;
}



@end
