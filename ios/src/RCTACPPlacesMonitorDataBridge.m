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

#import "RCTACPPlacesMonitorDataBridge.h"

  // @{link PlacesAuthorizationStatus}
static NSString* const ACP_PLACES_AUTH_STATUS_DENIED = @"ACP_PLACES_AUTH_STATUS_DENIED";
static NSString* const ACP_PLACES_AUTH_STATUS_ALWAYS = @"ACP_PLACES_AUTH_STATUS_ALWAYS";
static NSString* const ACP_PLACES_AUTH_STATUS_UNKNOWN = @"ACP_PLACES_AUTH_STATUS_UNKNOWN";
static NSString* const ACP_PLACES_AUTH_STATUS_RESTRICTED = @"ACP_PLACES_AUTH_STATUS_RESTRICTED";
static NSString* const ACP_PLACES_AUTH_STATUS_WHEN_IN_USE = @"ACP_PLACES_AUTH_STATUS_WHEN_IN_USE";

  // Location
static NSString* const LOCATION_LATITUDE = @"latitude";
static NSString* const LOCATION_LONGITUDE = @"longitude";

  // PlacesPOI
static NSString* const ACP_PLACES_POI_IDENTIFIER = @"identifier";
static NSString* const ACP_PLACES_POI_NAME = @"name";
static NSString* const ACP_PLACES_POI_LATITUDE = @"latitude";
static NSString* const ACP_PLACES_POI_LONGITUDE = @"longitude";
static NSString* const ACP_PLACES_POI_RADIUS = @"radius";
static NSString* const ACP_PLACES_POI_USER_IS_WITHIN = @"userIsWithin";
static NSString* const ACP_PLACES_POI_METADATA = @"metadata";

  // GeoFence
static NSString* const ACP_PLACES_GEOFENCE_IDENTIFIER = @"identifier";
static NSString* const ACP_PLACES_GEOFENCE_RADIUS = @"radius";
static NSString* const ACP_PLACES_GEOFENCE_EXPIRATION_DURATION = @"expirationDuration";

  @implementation RCTACPPlacesMonitorDataBridge

  @end
