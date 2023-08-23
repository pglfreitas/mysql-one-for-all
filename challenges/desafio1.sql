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
     plano_valor DECIMAL(2,2) NOT NULL
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
     PRIMARY KEY (usuario_id, cancao_id),
     FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
     FOREIGN KEY (cancao_id) REFERENCES cancoes(cancao_id),
     data_reproducao DATE NOT NULL
 ) engine = InnoDB;
 
 	 CREATE TABLE seguidores(
     usuario_id INT NOT NULL,
     artista_id INT NOT NULL,
     PRIMARY KEY (usuario_id, artista_id),
     FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
     FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
 ) engine = InnoDB;