/*
Copyright 2020 Adobe. All rights reserved.
This file is licensed to you under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License. You may obtain a copy
of the License at http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under
the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR REPRESENTATIONS
OF ANY KIND, either express or implied. See the License for the specific language
governing permissions and limitations under the License.
*/

#import "RCTACPPlacesMonitor.h"
#import "ACPPlacesMonitor.h"
#import "RCTACPPlacesMonitorDataBridge.h"

@implementation RCTACPPlacesMonitor

RCT_EXPORT_MODULE(ACPPlacesMonitor);

- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}

RCT_EXPORT_METHOD(extensionVersion: (RCTPromiseResolveBlock) resolve rejecter:(RCTPromiseRejectBlock)reject) {
  resolve([ACPPlacesMonitor extensionVersion]);
}

RCT_EXPORT_METHOD(start) {
[ACPPlacesMonitor start];
}

RCT_EXPORT_METHOD(stop:(bool) clearData) {
[ACPPlacesMonitor stop: clearData];
}

RCT_EXPORT_METHOD(updateLocation) {
[ACPPlacesMonitor updateLocationNow];
}

RCT_EXPORT_METHOD(setRequestLocationPermission:(nonnull NSString*)permission) {
[ACPPlacesMonitor setRequestAuthorizationLevel:[RCTACPPlacesMonitorDataBridge authLevelFromString:permission]];
}

RCT_EXPORT_METHOD(setPlacesMonitorMode:(nonnull NSString*)mode) {
    [ACPPlacesMonitor setPlacesMonitorMode: [RCTACPPlacesMonitorDataBridge monitorModeFromString:mode]];
}

@end
