import 'package:injectable/injectable.dart';
import 'package:my_book_reloaded/core/models/book_object.dart';

import 'books_service.dart';

@LazySingleton(as: BooksService)
class BooksServiceImpl extends BooksService {
  @override
  Future<List<BookObject>> getStatsList() {
    List<BookObject> list = [
      BookObject(
          "A Zero Waste Life", "Anita Vandyke", "image 3.png", "12h 5m", "23"),
      BookObject(
          "Through Breaking", "Cate Emond", "image 8.png", "10h 5m", "13"),
      BookObject("Kayla Itsines", "Influencer", "image 4.png", "15h 5m", "23"),
      BookObject("Set Name", "", "image_s.png", "12h 5m", "23"),
    ];
    return Future.delayed(const Duration(milliseconds: 500), () => list);
  }

  @override
  Future<List<BookObject>> getBooksList() {
    List<BookObject> book = [
      BookObject(
          "A Zero Waste Life", "Anita Vandyke", "image 3.png", "12h 5m", "23",
          type: BookType.book),
      BookObject(
          "Through Breaking", "Cate Emond", "image 8.png", "10h 5m", "13",
          type: BookType.book),
      BookObject(
          "The Tools", "Phil Stutz & Barry Miche", "toolz.png", "10h 5m", "13",
          type: BookType.book),
      BookObject("Be The Lion", "Tim Castle", "Be_the_Lion_COVER_Large 1.png",
          "10h 5m", "13",
          type: BookType.book),
      BookObject("Being  Confident", "", "image 9.png", "12h 5m", "23",
          type: BookType.set),
      BookObject("Find Creativity", "", "image_s.png", "12h 5m", "23",
          type: BookType.set),
      BookObject("A Zero Waste Life", "", "image 9.png", "12h 5m", "23",
          type: BookType.set),
      BookObject("Tony Robbins", "", "image_i.png", "12h 5m", "23",
          type: BookType.influencer),
      BookObject("Kayla Itsines", "", "image 4.png", "12h 5m", "23",
          type: BookType.influencer),
      BookObject("Influencer Name", "", "image 5.png", "12h 5m", "23",
          type: BookType.influencer),
    ];
    for (int i = 0; i < book.length; i++) {
      book[i].index = i;
    }
    return Future.delayed(const Duration(milliseconds: 500), () => book);
  }
}
