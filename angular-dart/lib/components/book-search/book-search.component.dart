import 'dart:async';
import 'dart:html';
import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:angular_dart/components/services/books.dart';
import 'package:angular_dart/components/services/search.service.dart';

@Component(
    selector: 'bs-book-search',
    templateUrl: 'book-search.template.html',
    styleUrls: const ['book-search.component.css'],
    providers: const [SearchService],
    pipes: const [AsyncPipe])
class BookSearchComponent implements OnDestroy {
  Stream<List<Book>> get books => searchService.onResult;
  final SearchService searchService;
  final Router router;

  BookSearchComponent(this.searchService, this.router);

  @ViewChild('searchBox')
  ElementRef inputRef;

  InputElement get input => inputRef.nativeElement;

  search() {
    searchService.search(input.value);
  }

  void gotoDetail(Book book) {
    router.navigate([
      'Detail',
      {'id': book?.id?.toString()}
    ]);
  }

  @override
  ngOnDestroy() {
    searchService.unsubscribe();
  }
}
