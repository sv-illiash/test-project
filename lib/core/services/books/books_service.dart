import 'package:my_book_reloaded/core/models/book_object.dart';

abstract class BooksService {
  Future<List<BookObject>> getBooksList();

  Future<List<BookObject>> getStatsList();
}
