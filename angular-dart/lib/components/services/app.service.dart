import 'dart:async';
import 'package:angular2/angular2.dart';
import 'package:angular_dart/components/services/api.books.services.dart';
import 'package:angular_dart/components/services/books.dart';

@Injectable()
class AppService {
  final InMemoryDataService _booksMemory;

  AppService(this._booksMemory);

  Future<List<Book>> getBooks() => _booksMemory.query();

  Future<Book> update(Book book) => _booksMemory.update(book);

  Future<Book> create(String title) =>
      _booksMemory.create(new Book(title: title));

  Future delete(num id) => _booksMemory.delete(id);

  Future<Book> getBook(num id) => _booksMemory.read(id);
}
