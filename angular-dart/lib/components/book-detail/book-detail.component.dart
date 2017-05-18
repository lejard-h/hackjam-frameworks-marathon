import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:angular2/src/platform/location.dart';
import 'package:angular_dart/components/services/app.service.dart';
import 'package:angular_dart/components/services/books.dart';

@Component(
    selector: 'bs-book-detail',
    styleUrls: const ['book-detail.component.css'],
    templateUrl: 'book-detail.template.html',
    providers: const [AppService])
class BookDetailComponent implements OnInit {
  final Location location;
  final AppService appService;
  final RouteParams routeParams;

  BookDetailComponent(this.location, this.appService, this.routeParams);

  Book book;

  @override
  ngOnInit() async {
    book = await appService.getBook(num.parse(routeParams.get("id")));
  }

  save() async {
    await appService.update(this.book);
    goBack();
  }

  goBack() {
    location.back();
  }
}
