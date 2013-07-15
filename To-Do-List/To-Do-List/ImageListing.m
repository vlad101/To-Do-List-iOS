//
//  ImageListing.m
//  To-Do-List
//
//  Created by Vladimir Efros on 7/15/13.
//  Copyright (c) 2013 Vladimir Efros. All rights reserved.
//

#import "ImageListing.h"

@implementation ImageListing

+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedListing];
}

+ (ImageListing *)sharedListing
{
    static ImageListing *sharedListing = nil;
    
    if(!sharedListing)
        sharedListing = [[super allocWithZone:NULL] init];
    
    return sharedListing;
}

- (id)init
{
    self = [super init];
    
    if(self)
        dictionary = [[NSMutableDictionary alloc] init];
    
    return self;
}

- (void)setImage:(UIImage *)i forKey:(NSString *)s
{
    [dictionary setObject:i forKey:s];
}

- (UIImage *)imageForKey:(NSString *)s
{
    return [dictionary objectForKey:s];
}

- (void)deleteImageForKey:(NSString *)s
{
    if(!s)
        return;
    [dictionary removeObjectForKey:s];
}

@end
