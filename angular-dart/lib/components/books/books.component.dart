import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:angular_dart/components/services/app.service.dart';
import 'package:angular_dart/components/services/books.dart';

@Component(
    selector: 'bs-books',
    templateUrl: 'books.template.html',
    styleUrls: const ['books.component.css'],
    providers: const [AppService])
class BooksComponent implements OnInit {
  final AppService appService;
  final Router router;

  BooksComponent(this.appService, this.router);

  List<Book> books = [];
  Book selectedBook;

  add(String title) async {
    title = title.trim();
    if (title?.isNotEmpty != true) {
      return;
    }
    final book = await appService.create(title);
    books.add(book);
  }

  delete(Book book) async {
    await appService.delete(book.id);
    books.remove(book);
  }

  onSelect(Book book) {
    selectedBook = book;
  }

  goToDetail() {
    router.navigate([
      'Detail',
      {'id': selectedBook?.id?.toString()}
    ]);
  }

  @override
  ngOnInit() async {
    books = await appService.getBooks();
  }
}
