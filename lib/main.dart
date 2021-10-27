import 'package:biblioteca_app/app/injection.dart';
import 'package:flutter/material.dart';
import 'package:biblioteca_app/app/biblio_app.dart';

void main() async {
  await setupInjection();
  runApp(BiblioApp());
}
