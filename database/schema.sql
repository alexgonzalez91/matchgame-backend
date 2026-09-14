SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS juego_plataforma;
DROP TABLE IF EXISTS resenas_editoriales;
DROP TABLE IF EXISTS juegos;
DROP TABLE IF EXISTS plataformas;
DROP TABLE IF EXISTS generos;

SET FOREIGN_KEY_CHECKS = 1;


CREATE TABLE generos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;


CREATE TABLE plataformas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;


CREATE TABLE juegos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(255) NOT NULL,
  descripcion TEXT NOT NULL,
  imagen VARCHAR(500),
  fecha_lanzamiento DATE,
  puntuacion DECIMAL(3,1),
  genero_id INT NOT NULL,

  FOREIGN KEY (genero_id)
    REFERENCES generos(id)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;


CREATE TABLE juego_plataforma (
  juego_id INT NOT NULL,
  plataforma_id INT NOT NULL,

  PRIMARY KEY (juego_id, plataforma_id),

  FOREIGN KEY (juego_id)
    REFERENCES juegos(id),

  FOREIGN KEY (plataforma_id)
    REFERENCES plataformas(id)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;


CREATE TABLE resenas_editoriales (
  id INT AUTO_INCREMENT PRIMARY KEY,
  juego_id INT NOT NULL UNIQUE,
  puntuacion DECIMAL(3,1) NOT NULL,
  comentario TEXT NOT NULL,
  etiqueta VARCHAR(100),
  fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY (juego_id)
    REFERENCES juegos(id)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;