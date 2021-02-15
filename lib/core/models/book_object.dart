enum ChapterType { messages, value }

enum BookType { book, influencer, set }

class BookObject {
  int index = 0;

  String title;
  String author;
  String image;
  String time;
  String times;
  BookType type;

  bool notification;
  bool selected = false;

  List<ChapterObject> chapters = [
    ChapterObject("40", "Chapter", "Reality Check", ChapterType.messages,
        time: "1"),
    ChapterObject("6", "Chapter", "Being grateful", ChapterType.value,
        time: "7"),
    ChapterObject("21", "Chapter 10", "Work with Fear", ChapterType.messages,
        time: "12"),
    ChapterObject("21", "Chapter 10", "Work with Fear", ChapterType.messages,
        time: "1"),
    ChapterObject("21", "Chapter 10", "Work with Fear", ChapterType.messages,
        time: "9")
  ];

  BookObject(this.title, this.author, this.image, this.time, this.times,
      {this.type});
}

class ChapterObject {
  String times;
  String title;
  String time;
  String chapter;

  ChapterType type;

  ChapterObject(this.times, this.chapter, this.title, this.type, {this.time});
}
