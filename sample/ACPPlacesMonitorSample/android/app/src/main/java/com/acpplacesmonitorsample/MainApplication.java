package com.acpplacesmonitorsample;

import android.app.Application;
import android.util.Log;

import com.adobe.marketing.mobile.AdobeCallback;
import com.adobe.marketing.mobile.InvalidInitException;
import com.adobe.marketing.mobile.PlacesMonitor;
import com.facebook.react.ReactApplication;
import com.adobe.marketing.mobile.reactnative.places.RCTACPPlacesPackage;
import com.adobe.marketing.mobile.reactnative.RCTACPCorePackage;
import com.adobe.marketing.mobile.reactnative.placesmonitor.RCTACPPlacesMonitorPackage;
import com.facebook.react.ReactNativeHost;
import com.facebook.react.ReactPackage;
import com.facebook.react.shell.MainReactPackage;
import com.facebook.soloader.SoLoader;
import com.adobe.marketing.mobile.MobileCore; // import MobileCore
import com.adobe.marketing.mobile.Identity;
import com.adobe.marketing.mobile.Lifecycle;
import com.adobe.marketing.mobile.Signal;
import com.adobe.marketing.mobile.Places;
import com.adobe.marketing.mobile.WrapperType;
import com.adobe.marketing.mobile.LoggingMode;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

public class MainApplication extends Application implements ReactApplication {

  private final ReactNativeHost mReactNativeHost =
      new ReactNativeHost(this) {
        @Override
        public boolean getUseDeveloperSupport() {
          return BuildConfig.DEBUG;
        }

        @Override
        protected List<ReactPackage> getPackages() {
          return Arrays.<ReactPackage>asList(
                      new MainReactPackage(),
                      new RCTACPPlacesPackage(),
                      new RCTACPPlacesMonitorPackage(),
                      new RCTACPCorePackage()
                    );
        }

        @Override
        protected String getJSMainModuleName() {
          return "index";
        }
      };

  @Override
  public ReactNativeHost getReactNativeHost() {
    return mReactNativeHost;
  }

  @Override
  public void onCreate() {
    super.onCreate();
    SoLoader.init(this, /* native exopackage */ false);

    MobileCore.setApplication(this);
    MobileCore.setLogLevel(LoggingMode.DEBUG);
    MobileCore.setWrapperType(WrapperType.REACT_NATIVE);

    try {
      Identity.registerExtension();
      Lifecycle.registerExtension();
      Signal.registerExtension();
      Places.registerExtension();
      PlacesMonitor.registerExtension();

      MobileCore.start(new AdobeCallback() {
        @Override
        public void call(Object o) {
          MobileCore.configureWithAppID("launch-EN81be7cedb7f14132968641a6ec683adf");
          HashMap<String, Object> cong = new HashMap<String, Object>();
          cong.put("places.membershipttl", 50);
          MobileCore.updateConfiguration(cong);
        }
      });
    } catch (InvalidInitException e) {
      Log.e("MainApplication", String.format("Error while registering extensions %s", e.getLocalizedMessage()));
    }
  }
}
