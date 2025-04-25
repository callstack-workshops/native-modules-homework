//
//  RNCustomButtonManager.m
//  mobile
//
//  Created by bartlomiejtomczyk on 25/04/2025.
//

#import <Foundation/Foundation.h>
#import <React/RCTViewManager.h>
#import <React/RCTBridge.h>
#import <React/RCTUIManager.h>


@interface RCT_EXTERN_MODULE(RNCustomButtonManager, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(text, NSString)
RCT_EXPORT_VIEW_PROPERTY(disabled, NSNumber)

RCT_EXPORT_VIEW_PROPERTY(onPress, RCTBubblingEventBlock)

@end
