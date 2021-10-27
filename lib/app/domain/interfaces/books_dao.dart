import 'package:biblioteca_app/app/domain/entities/books.dart';

abstract class BookDAO {
  save(Book book);
  remove(dynamic id);
  Future<List<Book>> find();
}
