// Copyright (c) 2017, lejard_h. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:angular_dart/components/book-detail/book-detail.component.dart';
import 'package:angular_dart/components/books/books.component.dart';
import 'package:angular_dart/components/dashboard/dashboard.component.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@RouteConfig(const [
  const Redirect(path: '', redirectTo: const ['Dashboard']),
  const Route(
      name: 'Dashboard',
      path: "dashboard",
      component: DashboardComponent,
      useAsDefault: true),
  const Route(name: 'Books', path: 'books', component: BooksComponent),
  const Route(
      name: 'Detail', path: "detail/:id", component: BookDetailComponent)
])
@Component(
  selector: 'bookstore',
  styleUrls: const ['app.component.css'],
  directives: const [ROUTER_DIRECTIVES],
  template: '''
  <h1>{{title}}</h1>
    <nav>
      <a [routerLink]="['Dashboard']">Books</a>
      <a [routerLink]="['Books']">Manage Books</a>
    </nav>
  <router-outlet></router-outlet>
''',
)
class AppComponent implements OnInit {
  String title = 'Amazon by Hackages';

  @override
  ngOnInit() {}
}
