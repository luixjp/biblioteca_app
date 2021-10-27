import 'package:biblioteca_app/app/domain/entities/books.dart';
import 'package:biblioteca_app/app/domain/interfaces/books_dao.dart';
import 'package:sqflite/sqflite.dart';

import '../connection.dart';

class BookDAOImpl implements BookDAO {
  late Database _db;

  @override
  Future<List<Book>> find() async {
    _db = await Connection.get();
    List<Map<String, dynamic>> resultado = await _db.query('books');
    List<Book> lista = List.generate(resultado.length, (index) {
      var linha = resultado[index];
      return Book(
          id: linha['id'],
          nome: linha['nome'],
          isbn: linha['isbn'],
          telefone: linha['telefone'],
          desc: linha['desc'],
          urlImg: linha['url_img']);
    });
    return lista;
  }

  @override
  remove(dynamic id) async {
    _db = await Connection.get();
    var sql = 'DELETE FROM books WHERE id = ?';
    _db.rawDelete(sql, [id]);
  }

  @override
  save(Book book) async {
    _db = await Connection.get();
    var sql;
    if (book.id == null) {
      sql =
          'INSERT INTO books (nome, isbn, telefone, desc, url_img)  VALUES (?,?,?,?,?)';
      _db.rawInsert(
          sql, [book.nome, book.isbn, book.telefone, book.desc, book.urlImg]);
    } else {
      sql =
          'UPDATE books SET nome = ?, isbn = ?, telefone = ?, desc = ?, url_img = ? WHERE id = ?';
      _db.rawUpdate(sql, [
        book.nome,
        book.isbn,
        book.telefone,
        book.desc,
        book.urlImg,
        book.id
      ]);
    }
  }
}
