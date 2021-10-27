final createTable = '''
CREATE TABLE books(
id INTEGER NOT NULL PRIMARY KEY,
nome VARCHAR(200) NOT NULL,
isbn CHAR(14) NOT NULL,
telefone CHAR(16) NOT NULL,
desc VARCHAR(150) NOT NULL,
url_img VARCHAR(300) NOT NULL
)
''';

final insert1 = '''
INSERT INTO books(nome, isbn, telefone,  desc, url_img) 
VALUES('Sistemas Distribuídos: Conceitos e Projetos','978-8582600535','(11)98745656','A Internet e a Web não param de crescer...','https://images-na.ssl-images-amazon.com/images/I/41jB4cCtCPL._SX347_BO1,204,203,200_.jpg')
''';

final insert2 = '''
INSERT INTO books(nome, isbn, telefone, desc, url_img) 
VALUES('Sistemas Operacionais Modernos','978-8543005676','(11)8348374842','A 4ª edição de Sistemas operacionais modernos foi extensamente revisad...','https://images-na.ssl-images-amazon.com/images/I/51TeqaTZDwL._SX369_BO1,204,203,200_.jpg')
''';

final insert3 = '''
INSERT INTO books(nome, isbn, telefone, desc, url_img) 
VALUES('Flutter: Uma abordagem prática','978-8543005676', '(11)929299429', 'Uma abordagem prática e sem firulas do framework mobile hibrido que mais tem crescido nos últimos tempos.','https://m.media-amazon.com/images/I/41Qi4nS5P1L.jpg')
''';
