// Copyright (c) 2017, lejard_h. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/platform/browser.dart';

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:angular2/src/platform/location.dart';
import 'package:angular_dart/app.component.dart';
import 'package:angular_dart/components/services/api.books.services.dart';

void main() {
  bootstrap(AppComponent, const [
    ROUTER_PROVIDERS,
    InMemoryDataService,
    const Provider(LocationStrategy, useClass: HashLocationStrategy)
  ]);
}
