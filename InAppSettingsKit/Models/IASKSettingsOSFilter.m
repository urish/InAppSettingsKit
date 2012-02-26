//
//  IASKSettingsOSFilter.m
//
//  Created by Uri Shaked on 2/27/12.
//  Copyright (c) 2012 Uri Shaked. All rights reserved.
//
// Released under BSD license.
//
// Author message: Check out my iOS app, a free pan-flute instrument:
// http://www.zampona.org/ or search for "Zampona" in the appstore
//

#import "IASKSettingsOSFilter.h"

@implementation IASKSettingsOSFilter

- (NSArray*)filterSettings: (NSArray*)settings 
{
    NSMutableArray *result = [[[NSMutableArray alloc] init] autorelease];
    NSString * osVersion = [UIDevice currentDevice].systemVersion;
    
    // Find device name (iphone/ipod/ipad)
    NSString * currentDeviceName = nil;
    NSScanner *scanner = [NSScanner scannerWithString:[[UIDevice currentDevice].model lowercaseString]];
    [scanner scanUpToString:@" " intoString:&currentDeviceName];
    
    for (NSDictionary *item in settings) {
        BOOL passedFilter = YES;

        NSString *minVersion = [item objectForKey: kIASKMinOSVersion];
        if (minVersion && 
            ([osVersion compare:minVersion options:NSNumericSearch] == NSOrderedAscending)) {
            passedFilter = NO;
        }

        NSString *maxVersion = [item objectForKey: kIASKMaxOSVersion];
        if (maxVersion && 
            ([osVersion compare:maxVersion options:NSNumericSearch] == NSOrderedDescending)) {
            passedFilter = NO;
        }

        NSString *deviceFilter = [item objectForKey: kIASKDeviceFilter];
        if (deviceFilter && ([[deviceFilter lowercaseString] rangeOfString:currentDeviceName].location == NSNotFound)) {
            passedFilter = NO;
        }
        
        if (passedFilter) {
            [result addObject:item];
        }
    }
    return result;
}

@end
