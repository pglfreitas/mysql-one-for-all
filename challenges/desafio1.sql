DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE artistas(
     artista_id INT PRIMARY KEY AUTO_INCREMENT,
     artista_nome VARCHAR(50) NOT NULL
 ) engine = InnoDB;
 
 CREATE TABLE planos(
     plano_id INT PRIMARY KEY AUTO_INCREMENT,
     plano_nome VARCHAR(50) NOT NULL,
     plano_valor DECIMAL(4,2) NOT NULL
 ) engine = InnoDB;
 
  CREATE TABLE albuns(
     album_id INT PRIMARY KEY AUTO_INCREMENT,
     album_nome VARCHAR(50) NOT NULL,
     ano_lancamento INT NOT NULL,
     artista_id INT NOT NULL,
     FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
 ) engine = InnoDB;
 
   CREATE TABLE cancoes(
     cancao_id INT PRIMARY KEY AUTO_INCREMENT,
     cancao_nome VARCHAR(50) NOT NULL,
     duracao_segundos INT NOT NULL,
     album_id INT NOT NULL,
     FOREIGN KEY (album_id) REFERENCES albuns(album_id)
 ) engine = InnoDB;
 
    CREATE TABLE usuarios(
     usuario_id INT PRIMARY KEY AUTO_INCREMENT,
     usuario_nome VARCHAR(50) NOT NULL,
     idade INT NOT NULL,
     plano_id INT NOT NULL,
     FOREIGN KEY (plano_id) REFERENCES planos(plano_id)
 ) engine = InnoDB;
 
	 CREATE TABLE historico(
     usuario_id INT NOT NULL,
     cancao_id INT NOT NULL,
     data_reproducao DATETIME NOT NULL,
     CONSTRAINT PRIMARY KEY (usuario_id, cancao_id),
     FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
     FOREIGN KEY (cancao_id) REFERENCES cancoes(cancao_id)
 ) engine = InnoDB;
 
 	 CREATE TABLE seguidores(
     usuario_id INT NOT NULL,
     artista_id INT NOT NULL,
     CONSTRAINT PRIMARY KEY (usuario_id, artista_id),
     FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
     FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
 ) engine = InnoDB;
 
  INSERT INTO artistas (artista_nome)
 VALUES
   ('Beyoncé'),
   ('Queen'),
   ('Elis Regina'),
   ('Baco Exu do Blues'),
   ('Blind Guardian'),
   ('Nina Simone');
   
   INSERT INTO planos (plano_nome, plano_valor)
 VALUES
   ('gratuito', '0'),
   ('familiar', '7.99'),
   ('universitário', '5.99'),
   ('pessoal', '6.99');
   
      INSERT INTO albuns (album_nome, ano_lancamento, artista_id)
 VALUES
   ('Renaissance', '2022', 1),
   ('Jazz', '1978', 2),
   ('Hot Space', '1982', 2),
   ('Falso Brilhante', '1998', 3),
   ('Vento de Maio', '2001', 3),
   ('QVVJFA?', '2003', 4),
   ('Somewhere Far Beyond', '2007', 5),
   ('I Put A Spell On You', '2012', 6);
   
      INSERT INTO cancoes (cancao_nome, duracao_segundos, album_id)
 VALUES
   ('break my soul', '279', 1),
   ('virgos groove', '369', 1),
   ('alien superstar', '116', 1),
   ('dont stop me now', '203', 2),
   ('under pressure', '152', 2),
   ('como nossos pais', '105', 3),
   ('O Medo de Amar é o Medo de Ser Livre', '207', 3),
   ('Samba em Paris', '267', 4),
   ('The Bards Song', '244', 5),
   ('Feeling Good', '100', 6);
   
      INSERT INTO usuarios (usuario_nome, idade, plano_id)
 VALUES
   ('Barbara Liskov', '82', 1),
   ('Robert Cecil Martin', '58', 1),
   ('Ada Lovelace', '37', 2),
   ('Martin Fowler', '46', 2),
   ('Sandi Metz', '58', 2),
   ('Paulo Freire', '19', 3),
   ('Bell Hooks', '26', 3),
   ('Christopher Alexander', '85', 4),
   ('Judith Butler', '45', 4),
   ('Jorge Amado', '100', 4);
   
         INSERT INTO historico (usuario_id, cancao_id, data_reproducao)
 VALUES
   (1, 8, '2022-02-28 10:45:55'),
   (1, 2, '2020-05-02 05:30:35'),
   (1, 10, '2020-03-06 11:22:33'),
   (2, 10, '2022-08-05 08:05:17'),
   (2, 7, '2020-01-02 07:40:33'),
   (3, 10, '2020-11-13 16:55:13'),
   (3, 2, '2020-12-05 18:38:30'),
   (4, 8, '2021-08-15 17:10:10'),
   (5, 8, '2022-01-09 01:44:33'),
   (5, 5, '2020-08-06 15:23:43'),
   (6, 7, '2017-01-24 00:31:17'),
   (6, 1, '2017-10-12 12:35:20'),
   (7, 4, '2011-12-15 22:30:49'),
   (8, 4, '2012-03-17 14:56:41'),
   (9, 9, '2022-02-24 21:14:22'),
   (10, 3, '2015-12-13 08:30:22');
   
	INSERT INTO seguidores (usuario_id, artista_id)
 VALUES
   (1, 1),
   (1, 2),
   (1, 3),
   (2, 1),
   (2, 3),
   (3, 2),
   (4, 4),
   (5, 5),
   (5, 6),
   (6, 6),
   (6, 1),
   (7, 6),
   (9, 3),
   (10, 2);