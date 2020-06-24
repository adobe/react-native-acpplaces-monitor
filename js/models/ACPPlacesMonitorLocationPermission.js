/*
Copyright 2020 Adobe. All rights reserved.
This file is licensed to you under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License. You may obtain a copy
of the License at http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under
the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR REPRESENTATIONS
OF ANY KIND, either express or implied. See the License for the specific language
governing permissions and limitations under the License.

@flow
@format
*/

'use strict';

const WHILE_USING_APP = "WHILE_USING_APP";
const ALWAYS_ALLOW = "ALWAYS_ALLOW";
const NONE = "NONE";

class ACPPlacesMonitorLocationPermission {

  static get WHILE_USING_APP() {
    return WHILE_USING_APP;
  }

  static get ALWAYS_ALLOW() {
    return ALWAYS_ALLOW;
  }

  static get NONE() {
    return NONE;
  }
}

module.exports = ACPPlacesMonitorLocationPermission;
