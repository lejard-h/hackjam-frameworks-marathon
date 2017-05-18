import 'dart:async';
import 'package:angular2/angular2.dart';
import 'package:angular_dart/components/services/api.books.services.dart';
import 'package:angular_dart/components/services/books.dart';
import 'package:rxdart/rxdart.dart';

@Injectable()
class SearchService {
  final InMemoryDataService booksService;

  final _controllerSearch = new StreamController();
  final _controllerResult = new StreamController();
  Observable _observer;

  void search(String term) {
    if (!_controllerSearch.isClosed) {
      _controllerSearch.add(term);
    }
  }

  Stream<List<Book>> get onResult => _controllerResult.stream;

  SearchService(this.booksService) {
    _observer = new Observable(_controllerSearch.stream);
    _observer
        .debounce(const Duration(milliseconds: 300))
        .distinct()
        .asyncMap((String term) => booksService.search(term))
        .listen((data) {
      if (!_controllerResult.isClosed) {
        _controllerResult.add(data);
      }
    });
  }

  void unsubscribe() {
    _controllerResult.close();
    _controllerSearch.close();
  }
}
