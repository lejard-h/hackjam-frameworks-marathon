import 'dart:async';
import 'package:angular2/angular2.dart';
import 'package:angular_dart/components/services/books.dart';

@Injectable()
// Simulate an asynchronous DataService
class InMemoryDataService {
  final _books = <Book>[
    new Book(id: 1, title: 'Angular up', category: 'web'),
    new Book(id: 2, title: 'NativeScript in Action', category: 'mobile'),
    new Book(id: 3, title: 'Using React & Redux', category: 'web'),
    new Book(id: 4, title: 'Data Visualisation', category: 'data engineering'),
    new Book(id: 5, title: 'Build Robot with JavaScript', category: 'iot'),
    new Book(id: 6, title: 'Efficient JavaScript', category: 'web'),
    new Book(id: 7, title: 'Learning React Native', category: 'mobile'),
    new Book(id: 8, title: 'Functional Programming', category: 'web'),
    new Book(id: 9, title: 'Building JavaScript Applications', category: 'web'),
    new Book(id: 10, title: 'Introduction to IoT with Tessel', category: 'iot')
  ];

  var _idCounter = 11;

  Future<List<Book>> query() async => _books;

  Future<Book> create(Book book) async {
    book.id = _idCounter++;
    _books.add(book);
    return book;
  }

  Future<Book> read(num id) async =>
      _books.firstWhere((book) => book.id == id, orElse: () => null);

  Future<Book> update(Book book) async {
    final _book = await read(book.id);
    _book?.title = book.title;
    _book.category = book.category;
    return _book;
  }

  Future delete(num id) async {
    _books.removeWhere((book) => book.id == id);
  }

  Future<List<Book>> search(String title) async =>
      _books.where((book) => new RegExp(title).hasMatch(book.title)).toList();
}
