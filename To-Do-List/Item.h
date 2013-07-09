//
//  Item.h
//  To-Do-List
//
//  Created by Vladimir Efros on 7/8/13.
//  Copyright (c) 2013 Vladimir Efros. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

// A designated initializer.
- (id)initWithHeader:(NSString *)header
                body:(NSString *)body;
- (id)initWithHeader:(NSString *)header;
- (id)initWithBody:(NSString *)body;

@end
