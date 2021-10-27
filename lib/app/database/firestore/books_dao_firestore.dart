import 'package:biblioteca_app/app/domain/entities/books.dart';
import 'package:biblioteca_app/app/domain/interfaces/books_dao.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookDaoFirestore implements BookDAO {
  late CollectionReference bookCollection;

  BookDaoFirestore() {
    bookCollection = FirebaseFirestore.instance.collection("book");
  }

  @override
  Future<List<Book>> find() async {
    var result = await bookCollection.get();
    return result.docs
        .map((doc) => Book(
            id: doc.reference.id.toString(),
            nome: doc['nome'],
            isbn: doc['isbn'],
            telefone: doc['telefone'],
            desc: doc['desc'],
            urlImg: doc['urlImg']))
        .toList();
  }

  @override
  remove(id) {
    bookCollection.doc(id).delete();
  }

  @override
  save(Book book) {
    bookCollection.doc(book.id).set({
      'nome': book.nome,
      'isbn': book.isbn,
      'telefone': book.telefone,
      'desc': book.desc,
      'urlImg': book.urlImg
    });
  }
}
