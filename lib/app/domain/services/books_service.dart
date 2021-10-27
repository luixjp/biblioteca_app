import 'package:biblioteca_app/app/domain/entities/books.dart';
import 'package:biblioteca_app/app/domain/exception/domain_layer_exception.dart';
import 'package:biblioteca_app/app/domain/interfaces/books_dao.dart';
import 'package:get_it/get_it.dart';

/*
Texto explicando objetivo da injeção de dependêcia e da camada de domínio.

Utilizando essas técnicas/padrões é possível separar as regras de négocios (serviços) das implementações dependentes de tecnologias (ex. banco de dados sql).
Facilita na reutilização e manutenção do código mesmo quando troca-se de uma determinada implementação, pois as classes não ficam mais dependentes sendo essa 
depedência injetada por meio de uma simples configuração que pode ser facilmente alterada. Assim, uma nova implementação (por exemplo para outro banco de dados 
mysql) pode ser feita sem muitas dificuldades e evintando que existam esquecimentos em atualizações de códigos.
*/

class BookService {
  var _dao = GetIt.I.get<BookDAO>();

  save(Book book) {
    validateName(book.nome!);
    validateIsbn(book.isbn!);
    validatePhone(book.telefone!);
    validateDesc(book.desc!);
    _dao.save(book);
  }

  remove(dynamic id) {
    _dao.remove(id);
  }

  Future<List<Book>> find() {
    return _dao.find();
  }

  validateName(String name) {
    var min = 3;
    var max = 50;

    if (name == "") {
      throw new DomainLayerException('O nome é obrigatório.');
    } else if (name.length < min) {
      throw new DomainLayerException(
          'O nome deve possuir pelo menos $min caracteres.');
    } else if (name.length > max) {
      throw new DomainLayerException(
          'O nome deve possuir no máximo $max caracteres.');
    }
  }

  validateIsbn(String isbn) {
    var format = RegExp(
        r'^(?:ISBN(?:-13)?:?\ )?(?=[0-9]{13}$|(?=(?:[0-9]+[-\ ]){4})[-\ 0-9]{17}$)97[89][-\ ]?[0-9]{1,5}[-\ ]?[0-9]+[-\ ]?[0-9]+[-\ ]?[0-9]$');

    if (isbn == "") {
      throw new DomainLayerException('O ISBN-13 é obrigatório.');
    } else if (!format.hasMatch(isbn)) {
      throw new DomainLayerException(
          'O ISBN-13 deve estar bem formatado. Ex: 978-0-123456-47-2.');
    }
  }

  validatePhone(String phone) {
    var format = RegExp(r'^\([1-9]{2}\)[9][6-9]{1}[0-9]{3}\-[0-9]{4}$');
    if (phone == "") {
      throw new DomainLayerException('O telefone é obrigatório.');
    } else if (!format.hasMatch(phone)) {
      throw new DomainLayerException(
          'Formato inválido. O formato deve ser (99) 9 9999-9999.');
    }
  }

  validateDesc(String desc) {
    if (desc == "") {
      throw new DomainLayerException('A descrição é obrigatória.');
    }
  }
}
