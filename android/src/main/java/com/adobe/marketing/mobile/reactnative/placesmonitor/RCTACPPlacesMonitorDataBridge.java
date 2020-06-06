package com.adobe.marketing.mobile.reactnative.placesmonitor;

import com.adobe.marketing.mobile.PlacesMonitorLocationPermission;

public class RCTACPPlacesMonitorDataBridge {
  // @{link PlacesMonitorLocationPermission}
  public final static String ACP_PLACES_MONITOR_LOCATION_PERMISSION_WHILE_USING_APP = "WHILE_USING_APP";
  public final static String ACP_PLACES_MONITOR_LOCATION_PERMISSION_ALWAYS_ALLOW = "ALWAYS_ALLOW";

  public static PlacesMonitorLocationPermission placesMonitorLocationPermissionFromString(final String placesMonitorLocationPermission) {
    if (placesMonitorLocationPermission == null) {
      return PlacesMonitorLocationPermission.NONE;
    }

    if (placesMonitorLocationPermission.equals(ACP_PLACES_MONITOR_LOCATION_PERMISSION_ALWAYS_ALLOW)) {
      return PlacesMonitorLocationPermission.ALWAYS_ALLOW;
    } else if (placesMonitorLocationPermission.equals(ACP_PLACES_MONITOR_LOCATION_PERMISSION_WHILE_USING_APP)) {
      return PlacesMonitorLocationPermission.WHILE_USING_APP;
    }

    return PlacesMonitorLocationPermission.NONE;
  }
}
