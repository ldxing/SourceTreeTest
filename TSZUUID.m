//
//  TSZUUID.m
//  TeacherTogether
//
//  Created by 张森 on 16/9/29.
//  Copyright © 2016年 __17KJS__. All rights reserved.
//

#import "TSZUUID.h"

@implementation TSZUUID

+ (NSString *)generate {
    CFUUIDRef uuidObj = CFUUIDCreate(nil);
    NSString *temp = (NSString*)CFBridgingRelease(CFUUIDCreateString(nil, uuidObj));
    CFRelease(uuidObj);
    NSMutableString *uuidString = [NSMutableString stringWithString:[temp lowercaseString]];
    while(true) {
        NSRange r = [uuidString rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString:@"-"]];
        if(r.location == NSNotFound)
            break;
        [uuidString deleteCharactersInRange:r];
    }
    return uuidString;
}

@end
