import 'package:biblioteca_app/app/biblio_app.dart';
import 'package:biblioteca_app/app/domain/entities/books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'books_list_back.dart';

class BooksList extends StatelessWidget {
  final _back = BookListBack();

  CircleAvatar circleAvatar(String url) {
    return Uri.tryParse(url)!.isAbsolute
        ? CircleAvatar(backgroundImage: NetworkImage(url))
        : CircleAvatar(child: Icon(Icons.book));
  }

  Widget iconEditButton(Function() onPressed) {
    return IconButton(
        onPressed: onPressed, icon: Icon(Icons.edit), color: Colors.orange);
  }

  Widget iconRemoveButton(BuildContext context, Function() remove) {
    return IconButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('Excluir'),
                    content: Text('Confirma a Exclusão?'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Não')),
                      TextButton(onPressed: remove, child: Text('Sim')),
                    ],
                  ));
        },
        icon: Icon(Icons.delete),
        color: Colors.red);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Livros'),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  //Navigator.of(context).pushNamed(BiblioApp.BOOKS_FORM);
                  _back.goToForm(context);
                })
          ],
        ),
        body: Observer(builder: (context) {
          return FutureBuilder(
              future: _back.list,
              builder: (context, futuro) {
                if (!futuro.hasData) {
                  return CircularProgressIndicator();
                } else {
                  List<Book> lista = futuro.data as List<Book>;
                  return ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (context, i) {
                      var book = lista[i];
                      return ListTile(
                        leading: circleAvatar(book.urlImg ?? ''),
                        title: Text(book.nome ?? "No name"),
                        subtitle: Text('ISBN: ' + book.isbn!),
                        onTap: () {
                          _back.goToDetails(context, book);
                        },
                        trailing: Container(
                          width: 100,
                          child: Row(
                            children: [
                              iconEditButton(() {
                                _back.goToForm(context, book);
                              }),
                              iconRemoveButton(context, () {
                                _back.remove(book.id);
                                Navigator.of(context).pop();
                              }),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              });
        }));
  }
}
