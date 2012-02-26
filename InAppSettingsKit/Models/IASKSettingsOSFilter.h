//
//  IASKSettingsOSFilter.h
//
//  Created by Uri Shaked on 2/27/12.
//  Copyright (c) 2012 Uri Shaked. All rights reserved.
//
// Released under BSD license.
//
// Author message: Check out my iOS app, a free pan-flute instrument:
// http://www.zampona.org/ or search for "Zampona" in the appstore
//

#import <Foundation/Foundation.h>
#import "IASKSettingsFilter.h"

#define kIASKMinOSVersion              @"IASKMinOSVersion"
#define kIASKMaxOSVersion              @"IASKMaxOSVersion"
#define kIASKDeviceFilter              @"IASKDeviceFilter"

@interface IASKSettingsOSFilter : NSObject<IASKSettingsFilter>

@end
