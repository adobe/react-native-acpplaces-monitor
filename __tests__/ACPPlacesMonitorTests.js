/*
Copyright 2020 Adobe. All rights reserved.
This file is licensed to you under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License. You may obtain a copy
of the License at http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under
the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR REPRESENTATIONS
OF ANY KIND, either express or implied. See the License for the specific language
governing permissions and limitations under the License.

@format
*/

import { NativeModules } from 'react-native';
import ACPPlacesMonitor from '../js/ACPPlacesMonitor';
import ACPPlacesMonitorLocationPermission from '../js/models/ACPPlacesMonitorLocationPermission'
import ACPPlacesMonitorModes from '../js/models/ACPPlacesMonitorModes';

describe('ACPPlacesMonitor', () => {

  test('extensionVersion is called', async () => {
    const spy = jest.spyOn(NativeModules.ACPPlacesMonitor, 'extensionVersion');
    await ACPPlacesMonitor.extensionVersion();
    expect(spy).toHaveBeenCalled();
  });

  test('start is called', async () => {
    const spy = jest.spyOn(NativeModules.ACPPlacesMonitor, 'start');
    await ACPPlacesMonitor.start();
    expect(spy).toHaveBeenCalled();
  });

  test('stop is called', async () => {
    const spy = jest.spyOn(NativeModules.ACPPlacesMonitor, 'stop');
    await ACPPlacesMonitor.stop(true);
    expect(spy).toHaveBeenCalled();
  });

  test('updateLocation is called', async () => {
    const spy = jest.spyOn(NativeModules.ACPPlacesMonitor, 'updateLocation');
    await ACPPlacesMonitor.updateLocation();
    expect(spy).toHaveBeenCalled();
  });

  test('setRequestLocationPermission is called', async () => {
    const spy = jest.spyOn(NativeModules.ACPPlacesMonitor, 'setRequestLocationPermission');
    await ACPPlacesMonitor.setRequestLocationPermission(ACPPlacesMonitorLocationPermission.ALWAYS_ALLOW);
    expect(spy).toHaveBeenCalled();
  });

  test('setPlacesMonitorMode is called', async () => {
    const spy = jest.spyOn(NativeModules.ACPPlacesMonitor, 'setPlacesMonitorMode');
    await ACPPlacesMonitor.setPlacesMonitorMode(ACPPlacesMonitorModes.CONTINUOUS);
    expect(spy).toHaveBeenCalled();
  });
});
