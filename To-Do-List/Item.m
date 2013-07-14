//
//  Item.m
//  To-Do-List
//
//  Created by Vladimir Efros on 7/8/13.
//  Copyright (c) 2013 Vladimir Efros. All rights reserved.
//

#import "Item.h"

@interface Item ()

@end

@implementation Item

+ (Item *) randomItem
{
    // Create an array with random headers.
    NSArray *randomHeaders = [NSArray arrayWithObjects:@"Header 1",
                        @"Header 2",
                        @"Header 3",
                        @"Header 4",
                        @"Header 5",
                        @"Header 6",
                        @"Header 7",
                        @"Header 8",
                        @"Header 9",
                        @"Header 10",
                        nil];
    
    // Create an array with random bodies.
    NSArray *randomBodies = [NSArray arrayWithObjects:@"Body 1",
                        @"Body 2",
                        @"Body 3",
                        @"Body 4",
                        @"Body 5",
                        @"Body 6",
                        @"Body 7",
                        @"Body 8",
                        @"Body 9",
                        @"Body 10",
                        nil];
    
    // Get the random index of random header and bosy.
    NSInteger headerIndex = rand() % [randomHeaders count];
    NSInteger bodyIndex = rand() % [randomHeaders count];
    
    // Initializer the random item with the data.
    Item *randomItem = [[Item alloc] initWithHeader:[randomHeaders objectAtIndex:headerIndex] body:[randomBodies objectAtIndex:bodyIndex]];
    
    // Return The Item.
    return randomItem;
}

- (id)initWithHeader:(NSString *)h
                body:(NSString *)b
{
    self = [super init];
    
    if(self)
    {
        _header = h;
        _body = b;
        
        _formatter = [[NSDateFormatter alloc] init];
        [_formatter setDateFormat:@"dd-MM-yyyy HH:mm"];
        _dateString = [_formatter stringFromDate:[NSDate date]];
    }
    
    return self;
}

- (id)initWithHeader:(NSString *)header
{
    return [self initWithHeader:header body:@"N/A"];
}

- (id)initWithBody:(NSString *)body
{
    return [self initWithHeader:@"N/A" body:body];
}

- (id)init
{
    return [self initWithHeader:@"N/A" body:@"N/A"];
}

- (NSString *)description
{
    //NSString *descriptionString = [NSString stringWithFormat:@"Header: %@ Body: %@ Date: %@", _header, _body, _dateString];
    NSString *descriptionString = [NSString stringWithFormat:@"%@", _header];
    return descriptionString;
}

@end
