import 'package:biblioteca_app/app/domain/entities/books.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailsBack {
  BuildContext context;
  late Book book;

  BookDetailsBack(this.context) {
    book = ModalRoute.of(context)!.settings.arguments as Book;
  }

  goToBack() {
    Navigator.of(context).pop();
  }

  _launchApp(String url, Function(BuildContext context) showModalError) async {
    await canLaunch(url) ? await launch(url) : showModalError(context);
  }

  launchPhone(Function(BuildContext context) showModalError) {
    _launchApp('tel:${book.telefone}', showModalError);
  }

  launchSMS(Function(BuildContext context) showModalError) {
    _launchApp('sms:${book.telefone}', showModalError);
  }
/*
  launchDesc(Function(BuildContext context) showModalError) {
    _launchApp('mailto:${book.desc}', showModalError);
  }
  */
}
