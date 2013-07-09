//
//  Item.m
//  To-Do-List
//
//  Created by Vladimir Efros on 7/8/13.
//  Copyright (c) 2013 Vladimir Efros. All rights reserved.
//

#import "Item.h"

@interface Item ()
@property (nonatomic, copy) NSString *header;
@property (nonatomic, copy) NSString *body;
@property (nonatomic, readonly, strong) NSDate *date;
@property (nonatomic, readonly, strong) NSDateFormatter *formatter;
@property (nonatomic, readonly, copy) NSString *dateString;
@end

@implementation Item

@synthesize header = _header;
@synthesize body = _body;
@synthesize date = _date;
@synthesize dateString = _dateString;

- (id)initWithHeader:(NSString *)header
                body:(NSString *)body
{
    self = [super init];
    
    if(self)
    {
        _header = header;
        _body = body;
        
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
    NSString *descriptionString = [NSString stringWithFormat:@"\nHeader: %@\nBody: %@\nDate: %@", _header, _body, _dateString];
    return descriptionString;
}

@end
