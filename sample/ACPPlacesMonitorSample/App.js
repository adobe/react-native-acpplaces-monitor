/*
Copyright 2020 Adobe
All Rights Reserved.
NOTICE: Adobe permits you to use, modify, and distribute this file in
accordance with the terms of the Adobe license agreement accompanying
it. If you have received this file from a source other than Adobe,
then your use, modification, or distribution of it requires the prior
written permission of Adobe. (See LICENSE-MIT for details)

@format
@flow strict-local
*/

import React, {Component} from 'react';
import {Platform, StyleSheet, Text, View, Button, ScrollView, NativeModules, NativeAppEventEmitter,} from 'react-native';

import {ACPPlacesMonitor, ACPPlacesMonitorLocationPermission, ACPPlacesMonitorModes} from '@adobe/react-native-acpplaces-monitor';

type Props = {};
export default class App extends Component<Props> {
  render() {
    return (
      <View style={styles.container}>
        <ScrollView contentContainerStyle={{ marginTop: 75 }}>
          <Text style={styles.welcome}>ACP Places Monitor Test App</Text>
          <Button title="ACPPlacesMonitor::extensionVersion()" onPress={() => this.extensionVersion()}/>
          <Button title="ACPPlacesMonitor::start()" onPress={() => this.start()}/>
          <Button title="ACPPlacesMonitor::stop()" onPress={() => this.stop()}/>
          <Button title="ACPPlacesMonitor::updateLocation()" onPress={() => this.updateLocation()}/>
          <Button title="ACPPlacesMonitor::setRequestLocationPermission()" onPress={() => this.setRequestLocationPermission()}/>
          <Button title="ACPPlacesMonitor::setPlacesMonitorMode()" onPress={() => this.setPlacesMonitorMode()}/>
        </ScrollView>
      </View>
    );
  }

  extensionVersion() {
    ACPPlacesMonitor.extensionVersion().then(version => console.log("AdobeExperienceSDK: ACPPlacesMonitor version: " + version));
  }

  start() {
    ACPPlacesMonitor.start();
  }

  stop() {
    ACPPlacesMonitor.stop(true);
  }

  updateLocation() {
    ACPPlacesMonitor.updateLocation();
  }

  setRequestLocationPermission() {
    ACPPlacesMonitor.setRequestLocationPermission(ACPPlacesMonitorLocationPermission.ALWAYS_ALLOW);
  }

  setPlacesMonitorMode() {
    ACPPlacesMonitor.setPlacesMonitorMode(ACPPlacesMonitorModes.CONTINUOUS);
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 22,
    textAlign: 'center',
    margin: 10,
  }
});
