//
//  EMStylingClass.m
//  EMString
//
//  Created by Tanguy Aladenise on 2014-12-04.
//  Copyright (c) 2014 Tanguy Aladenise. All rights reserved.
//

#import "EMStylingClass.h"

@interface EMStylingClass()

@property (strong, nonatomic) NSMutableDictionary *mutableAttributes;

@end

@implementation EMStylingClass


- (EMStylingClass *)initWithMarkup:(NSString *)markup
{
    self = [[EMStylingClass alloc] init];
    if (self) {
        self.markup = markup;
    }
    
    return self;
}


- (NSString *)closeMarkup
{
    return [self.markup stringByReplacingOccurrencesOfString:@"<" withString:@"</"];
}


- (void)setColor:(UIColor *)color
{
    [self.mutableAttributes setObject:color forKey:NSForegroundColorAttributeName];
    self.attributes = self.mutableAttributes.copy;
}


- (void)setFont:(UIFont *)font
{
    [self.mutableAttributes setValue:font forKey:NSFontAttributeName];
    self.attributes = self.mutableAttributes.copy;
}


#pragma mark - Getters


- (NSMutableDictionary *)mutableAttributes
{
    if (!_mutableAttributes) {
        _mutableAttributes = [[NSMutableDictionary alloc] init];
    }
    
    [_mutableAttributes addEntriesFromDictionary:self.attributes];
    
    return _mutableAttributes;
}


- (NSDictionary *)attributes
{
    if (!_attributes) {
        _attributes = [[NSDictionary alloc] init];
    }
    
    return _attributes;
}

@end
