// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_list_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BookListBack on _BookListBack, Store {
  final _$listAtom = Atom(name: '_BookListBack.list');

  @override
  Future<List<Book>>? get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(Future<List<Book>>? value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$_BookListBackActionController =
      ActionController(name: '_BookListBack');

  @override
  dynamic refreshList([dynamic value]) {
    final _$actionInfo = _$_BookListBackActionController.startAction(
        name: '_BookListBack.refreshList');
    try {
      return super.refreshList(value);
    } finally {
      _$_BookListBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
