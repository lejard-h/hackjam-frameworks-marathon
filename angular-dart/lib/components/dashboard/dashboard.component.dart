import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:angular_dart/components/book-search/book-search.component.dart';
import 'package:angular_dart/components/services/app.service.dart';
import 'package:angular_dart/components/services/books.dart';

@Component(
    styleUrls: const ['dashboard.component.css'],
    selector: 'bs-dashboard',
    templateUrl: 'dashboard.template.html',
    directives: const [BookSearchComponent, ROUTER_DIRECTIVES],
    providers: const [AppService])
class DashboardComponent implements OnInit {
  final AppService appService;
  List<Book> books = [];

  DashboardComponent(this.appService);

  @override
  ngOnInit() async {
    books = await appService.getBooks();
  }
}
