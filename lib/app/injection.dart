import 'package:biblioteca_app/app/database/firestore/books_dao_firestore.dart';
import 'package:get_it/get_it.dart';
//import 'database/sqlite/dao/books_dao_impl.dart';
import 'domain/interfaces/books_dao.dart';
import 'domain/services/books_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';

setupInjection() async {
  GetIt getIt = GetIt.I;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //getIt.registerSingleton<BookDAO>(BookDAOImpl());
  getIt.registerSingleton<BookDAO>(BookDaoFirestore());
  getIt.registerSingleton<BookService>(BookService());
}
