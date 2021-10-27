import 'package:biblioteca_app/app/view/books_details.dart';
import 'package:flutter/material.dart';
import 'view/books_list.dart';
import 'view/books_form.dart';

class BiblioApp extends StatelessWidget {
  static const HOME = '/';
  static const BOOKS_FORM = 'books-form';
  static const BOOK_DETAILS = 'book-details';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biblioteca de Livros',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        HOME: (context) => BooksList(),
        BOOKS_FORM: (context) => BooksForm(),
        BOOK_DETAILS: (context) => BookDetails()
      },
    );
  }
}
