//
//  ImageListing.h
//  To-Do-List
//
//  Created by Vladimir Efros on 7/15/13.
//  Copyright (c) 2013 Vladimir Efros. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageListing : NSObject
{
    NSMutableDictionary *dictionary;
}

+ (ImageListing *) sharedListing;

- (void)setImage:(UIImage *)i forKey:(NSString *)s;
- (UIImage *)imageForKey:(NSString *)s;
- (void)deleteImageForKey:(NSString *)s;

@end
