import 'package:biblioteca_app/app/domain/entities/books.dart';
import 'package:flutter/material.dart';

import 'books_details_back.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({Key? key}) : super(key: key);

  showModalError(BuildContext context) {
    var alert = AlertDialog(
      title: Text('Alerta!'),
      content: Text('Não foi possível encontrar um APP compatível.'),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  @override
  Widget build(BuildContext context) {
    var _back = BookDetailsBack(context);
    Book book = _back.book;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var width = constraints.biggest.width;
        var radius = width / 3;
        var height = constraints.biggest.height;

        return Scaffold(
          body: ListView(
            padding: EdgeInsets.all(60),
            children: [
              (Uri.tryParse(book.urlImg!)!.isAbsolute)
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(book.urlImg!),
                      radius: radius,
                    )
                  : CircleAvatar(
                      child: Icon(
                        Icons.book,
                        size: width / 2,
                      ),
                      radius: radius,
                    ),
              Center(
                child: Text(
                  '${book.nome}',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('ISBN:'),
                  subtitle: Text('${book.isbn}'),
                  //onTap: () {_back.launchDesc(showModalError);},
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Telefone:'),
                  subtitle: Text('${book.isbn}'),
                  trailing: Container(
                    width: width / 5,
                    child: Row(
                      children: [
                        Expanded(
                          child: IconButton(
                            color: Colors.blue,
                            icon: Icon(Icons.message),
                            onPressed: () {
                              _back.launchSMS(showModalError);
                            },
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            color: Colors.blue,
                            icon: Icon(Icons.phone),
                            onPressed: () {
                              _back.launchPhone(showModalError);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Descrição:'),
                  subtitle: Text('${book.desc}'),
                  //onTap: () {_back.launchDesc(showModalError);},
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: () {
              _back.goToBack();
            },
          ),
        );
      },
    );
  }
}
