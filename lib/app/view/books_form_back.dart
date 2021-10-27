import 'package:biblioteca_app/app/domain/entities/books.dart';
import 'package:biblioteca_app/app/domain/services/books_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

class BookFormBack {
  late Book book;
  var _service = GetIt.I.get<BookService>();
  bool _nameIsValid = false;
  bool _isbnIsValid = false;
  bool _phoneIsValid = false;
  bool _descIsValid = false;

  bool get isValid =>
      _nameIsValid && _isbnIsValid && _descIsValid && _phoneIsValid;

//Diferenciar novo com alteração
  BookFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context)!.settings.arguments;
    book = (parameter == null) ? Book() : parameter as Book;
  }

//Salvar
  save() async {
    await _service.save(book);
  }

//validacoes
  String? validateName(String? nome) {
    try {
      _service.validateName(nome!);
      _nameIsValid = true;
      return null;
    } catch (e) {
      _nameIsValid = false;
      return e.toString();
    }
  }

  String? validateIsbn(String? isbn) {
    try {
      _service.validateIsbn(isbn!);
      _isbnIsValid = true;
      return null;
    } catch (e) {
      _isbnIsValid = false;
      return e.toString();
    }
  }

  String? validatePhone(String? phone) {
    try {
      _service.validatePhone(phone!);
      _phoneIsValid = true;
      return null;
    } catch (e) {
      _phoneIsValid = false;
      return e.toString();
    }
  }

  String? validateDesc(String? desc) {
    try {
      _service.validateDesc(desc!);
      _descIsValid = true;
      return null;
    } catch (e) {
      _descIsValid = false;
      return e.toString();
    }
  }
}
