# React Native AEP Places Monitor Extension

[![npm version](https://badge.fury.io/js/%40adobe%2Freact-native-acpplaces-monitor.svg)](https://badge.fury.io/js/%40adobe%2Freact-native-acpplaces-monitor) ![npm](https://img.shields.io/npm/dm/@adobe/react-native-acpplaces-monitor) [![CircleCI](https://img.shields.io/circleci/project/github/adobe/react-native-acpplaces-monitor/master.svg?logo=circleci)](https://circleci.com/gh/adobe/workflows/react-native-acpplaces-monitor) ![NPM](https://img.shields.io/npm/l/@adobe/react-native-acpplaces-monitor.svg)


`@adobe/react-native-acpplaces-monitor` is a wrapper around the iOS and Android [AEP Places SDK](https://aep-sdks.gitbook.io/docs/using-mobile-extensions/adobe-places) to allow for integration with React Native applications. Functionality to enable Adobe Places is provided entirely through JavaScript documented below.


## Installation

You need to install the SDK with [npm](https://www.npmjs.com/) and configure the native Android/iOS project in your react native project. Before installing the Places extension it is recommended to begin by installing the [Core extension](https://github.com/adobe/react-native-acpcore).

> Note: If you are new to React Native we suggest you follow the [React Native Getting Started](<https://facebook.github.io/react-native/docs/getting-started.html>) page before continuing.

### 1. Create React Native project

First create a React Native project:

```bash
react-native init MyReactApp
```

### 2. Install JavaScript packages

Install and link the `@adobe/react-native-acpplaces-monitor` package:

```bash
cd MyReactApp
npm install @adobe/react-native-acpplaces-monitor
```

#### 2.1 Link
- **React Native 0.60+**


[CLI autolink feature](https://github.com/react-native-community/cli/blob/master/docs/autolinking.md) links the module while building the app.


- **React Native <= 0.59**


```bash
react-native link @adobe/react-native-acpplaces-monitor
```

*Note* For `iOS` using `cocoapods`, run:

```bash
cd ios/ && pod install
```

## Tests
This project contains jest unit tests which are contained in the `__tests__` directory, to run the tests locally:
```
make run-tests-locally
```

## Usage

### [PlacesMonitor](https://docs.adobe.com/content/help/en/places/using/places-ext-aep-sdks/places-monitor-extension/places-monitor-extension.html)

##### Importing the extension:
```javascript
import {ACPPlacesMonitor} from '@adobe/react-native-acpplaces-monitor';
```

##### Getting the extension version:

```javascript
ACPPlacesMonitor.extensionVersion().then(version => console.log("AdobeExperienceSDK: ACPPlacesMonitor version: " + version));
```

##### Registering the extension with ACPCore:

##### **iOS**
Within the App's application:didFinishLaunchingWithOptions, register the SDK extensions:
```objective-c
#import "ACPCore.h"
#import "ACPPlaces.h"
#import "ACPPlacesMonitor.h"

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions {
    [ACPCore configureWithAppId:@"yourAppId"];
    [ACPPlaces registerExtension]; //Register Places with Core
    [ACPPlacesMonitor registerExtension]; //Register PlacesMonitor with Core
    [ACPCore start: nil];

    return YES;
}
```
The following updates are also neccessary for Places Monitor on iOS:

- [Enable location updates in the background](https://docs.adobe.com/content/help/en/places/using/places-ext-aep-sdks/places-monitor-extension/using-places-monitor-extension.html#enable-location-updates-background)
- [Add the keys NSLocationWhenInUseUsageDescription and NSLocationAlwaysAndWhenInUseUsageDescription to the app's plist file](https://docs.adobe.com/content/help/en/places/using/places-ext-aep-sdks/places-monitor-extension/using-places-monitor-extension.html#configuring-the-plist-keys)

##### **Android**

Within the App's OnCreate method, register the SDK extensions and start the Places Monitor:
```java
import com.adobe.marketing.mobile.MobileCore;
import com.adobe.marketing.mobile.Places;
import com.adobe.marketing.mobile.PlacesMonitor;

public class MobileApp extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        MobileCore.setApplication(this);
        MobileCore.ConfigureWithAppId("yourAppId");
        try {
            Places.registerExtension(); //Register Places with Core
            PlacesMonitor.registerExtension(); //Register PlacesMonitor with Core
            MobileCore.start(null);
        } catch (Exception e) {
            //Log the exception
        }
    }
}
```
The following update is also necessary for Places Monitor on Android:

- [Add location permissions to the app manifest](https://docs.adobe.com/content/help/en/places/using/places-ext-aep-sdks/places-monitor-extension/using-places-monitor-extension.html#add-permissions-to-the-manifest)


##### Start the Places Monitor:

```js
ACPPlacesMonitor.start();
```
##### Stop the Places Monitor:
```js
ACPPlacesMonitor.stop(true);
```

##### Update the device's location:
```js
ACPPlacesMonitor.updateLocation();
```
##### Set or upgrade the location permission request (Android) / request authorization level (iOS):
```js
ACPPlacesMonitor.setRequestLocationPermission(ACPPlacesMonitorLocationPermission.ALWAYS_ALLOW);
ACPPlacesMonitor.setRequestLocationPermission(ACPPlacesMonitorLocationPermission.WHILE_USING_APP);
ACPPlacesMonitor.setRequestLocationPermission(ACPPlacesMonitorLocationPermission.NONE);
```
##### Set the monitoring mode (iOS only):
```js
ACPPlacesMonitor.setPlacesMonitorMode(ACPPlacesMonitorModes.CONTINUOUS);
ACPPlacesMonitor.setPlacesMonitorMode(ACPPlacesMonitorModes.SIGNIFICANT_CHANGES);
```

## Additional React Native Plugins
Below is a list of additional React Native plugins from the AEP SDK suite:
| Extension    | npm package                                                  |
| ------------ | ------------------------------------------------------------ |
| Core         | [![npm version](https://img.shields.io/npm/v/@adobe/react-native-acpcore.svg?color=green&label=%40adobe%2Freact-native-acpcore&logo=npm&style=flat-square)](https://badge.fury.io/js/%40adobe%2Freact-native-acpcore) |
| Analytics    | [![npm version](https://img.shields.io/npm/v/@adobe/react-native-acpanalytics.svg?color=green&label=%40adobe%2Freact-native-acpanalytics&logo=npm&style=flat-square)](https://badge.fury.io/js/%40adobe%2Freact-native-acpanalytics) |
| Audience     | [![npm version](https://img.shields.io/npm/v/@adobe/react-native-acpaudience.svg?color=green&label=%40adobe%2Freact-native-acpaudience&logo=npm&style=flat-square)](https://badge.fury.io/js/%40adobe%2Freact-native-acpaudience) |
| Campaign     | [![npm version](https://img.shields.io/npm/v/@adobe/react-native-acpcampaign.svg?color=green&label=%40adobe%2Freact-native-acpcampaign&logo=npm&style=flat-square)](https://badge.fury.io/js/%40adobe%2Freact-native-acpcampaign) |
| Media     | [![npm version](https://img.shields.io/npm/v/@adobe/react-native-acpmedia.svg?color=green&label=%40adobe%2Freact-native-acpmedia&logo=npm&style=flat-square)](https://badge.fury.io/js/%40adobe%2Freact-native-acpmedia) |
| Target       | [![npm version](https://img.shields.io/npm/v/@adobe/react-native-acptarget.svg?color=green&label=%40adobe%2Freact-native-acptarget&logo=npm&style=flat-square)](https://badge.fury.io/js/%40adobe%2Freact-native-acptarget) |
| User Profile | [![npm version](https://img.shields.io/npm/v/@adobe/react-native-acpuserprofile.svg?color=green&label=%40adobe%2Freact-native-acpuserprofile&logo=npm&style=flat-square)](https://badge.fury.io/js/%40adobe%2Freact-native-acpuserprofile) |
| Places | [![npm version](https://img.shields.io/npm/v/@adobe/react-native-acpplaces.svg?color=green&label=%40adobe%2Freact-native-acpplaces&logo=npm&style=flat-square)](https://badge.fury.io/js/%40adobe%2Freact-native-acpplaces) |

## Contributing
See [CONTRIBUTING](CONTRIBUTING.md)

## License
See [LICENSE](LICENSE)
