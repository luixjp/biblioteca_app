import 'package:biblioteca_app/app/domain/entities/books.dart';
import 'package:biblioteca_app/app/domain/services/books_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../biblio_app.dart';

part 'books_list_back.g.dart';

class BookListBack = _BookListBack with _$BookListBack;

abstract class _BookListBack with Store {
  var _service = GetIt.I.get<BookService>();

  @observable
  Future<List<Book>>? list;

  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _BookListBack() {
    refreshList();
  }

  //Método para abrir o form salvando ou editando.
  goToForm(BuildContext context, [Book? book]) {
    Navigator.of(context)
        .pushNamed(BiblioApp.BOOKS_FORM, arguments: book)
        .then(refreshList);
  }

  goToDetails(BuildContext context, Book book) {
    Navigator.of(context).pushNamed(BiblioApp.BOOK_DETAILS, arguments: book);
  }

  //Excluir Livro
  remove(dynamic id) {
    _service.remove(id!);
    refreshList();
  }
}
