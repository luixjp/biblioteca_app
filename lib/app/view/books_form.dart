import 'package:biblioteca_app/app/view/books_form_back.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class BooksForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget fieldName(
      {String field = '',
      String? back,
      String? Function(String?)? validate,
      Function(String?)? save,
      String hint = '',
      String mascara = '',
      TextInputType type = TextInputType.text}) {
    return TextFormField(
        validator: validate,
        onSaved: save,
        initialValue: back,
        keyboardType: type,
        inputFormatters: [MaskTextInputFormatter(mask: mascara)],
        decoration: InputDecoration(labelText: field, hintText: hint));
  }

  @override
  Widget build(BuildContext context) {
    var _back = BookFormBack(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Cadastro de Livros"),
          actions: [
            IconButton(
                onPressed: () {
                  _form.currentState!.validate();
                  _form.currentState!.save();
                  if (_back.isValid) {
                    _back.save();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Dados Salvos!"),
                    ));
                    Navigator.of(context).pop();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Erro ao Salvar!"),
                    ));
                  }
                },
                icon: Icon(Icons.save))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Form(
              key: _form,
              child: Column(
                children: [
                  fieldName(
                      field: 'Nome:',
                      back: _back.book.nome,
                      validate: _back.validateName,
                      save: (newValue) => _back.book.nome = newValue),
                  fieldName(
                      field: 'ISBN:',
                      back: _back.book.isbn,
                      validate: _back.validateIsbn,
                      save: (newValue) => _back.book.isbn = newValue,
                      hint: 'ISBN-13 - Ex: 978-0-123456-47-2',
                      mascara: '###-#-######-##-#',
                      type: TextInputType.number),
                  fieldName(
                      field: 'Telefone:',
                      back: _back.book.telefone,
                      validate: _back.validatePhone,
                      save: (newValue) => _back.book.telefone = newValue,
                      hint: '(99) 9 9999-9999',
                      mascara: '(##)#####-####',
                      type: TextInputType.number),
                  fieldName(
                      field: 'Descrição:',
                      back: _back.book.desc,
                      validate: _back.validateDesc,
                      save: (newValue) => _back.book.desc = newValue,
                      hint: 'Livro sobre Computação...',
                      type: TextInputType.text),
                  fieldName(
                      field: 'Endereço Foto Capa:',
                      back: _back.book.urlImg,
                      save: (newValue) => _back.book.urlImg = newValue,
                      hint: 'http://wwww.site.com/imagem.png',
                      type: TextInputType.url)
                ],
              ),
            ),
          ),
        ));
  }
}
