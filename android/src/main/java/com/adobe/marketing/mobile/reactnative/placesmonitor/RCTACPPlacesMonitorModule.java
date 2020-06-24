package com.adobe.marketing.mobile.reactnative.placesmonitor;

import com.adobe.marketing.mobile.PlacesMonitor;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;

public class RCTACPPlacesMonitorModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  public RCTACPPlacesMonitorModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RCTACPPlacesMonitor";
  }

  @ReactMethod
  public void extensionVersion(final Promise promise) {
    promise.resolve(PlacesMonitor.extensionVersion());
  }

  @ReactMethod
  public void start() {
    PlacesMonitor.start();
  }

  @ReactMethod
  public void stop(final boolean clearData) {
    PlacesMonitor.stop(clearData);
  }

  @ReactMethod
  public void updateLocation() {
    PlacesMonitor.updateLocation();
  }

  @ReactMethod
  public void setRequestLocationPermission(String permission) {
    PlacesMonitor.setRequestLocationPermission(RCTACPPlacesMonitorDataBridge.placesMonitorLocationPermissionFromString(permission));
  }

  @ReactMethod
  public void setPlacesMonitorMode(int mode) {
    // No operation API does not exists for android.
  }
}
