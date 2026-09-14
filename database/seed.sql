DELETE FROM juego_plataforma;
DELETE FROM resenas_editoriales;
DELETE FROM juegos;
DELETE FROM plataformas;
DELETE FROM generos;

ALTER TABLE resenas_editoriales AUTO_INCREMENT = 1;
ALTER TABLE juegos AUTO_INCREMENT = 1;
ALTER TABLE plataformas AUTO_INCREMENT = 1;
ALTER TABLE generos AUTO_INCREMENT = 1;

INSERT INTO generos (id, nombre)
VALUES
    (1, 'Acción'),
    (2, 'Aventura'),
    (3, 'RPG'),
    (4, 'Estrategia'),
    (5, 'Deportes'),
    (6, 'Carreras'),
    (7, 'Terror'),
    (8, 'Simulación'),
    (9, 'Plataformas'),
    (10, 'Shooter');

INSERT INTO plataformas (id, nombre)
VALUES
    (1, 'PC'),
    (2, 'PlayStation 5'),
    (3, 'PlayStation 4'),
    (4, 'Xbox Series X/S'),
    (5, 'Xbox One'),
    (6, 'Nintendo Switch');


    INSERT INTO juegos (
    id,
    titulo,
    descripcion,
    imagen,
    fecha_lanzamiento,
    puntuacion,
    genero_id
)
VALUES
(
    1,
    'Elden Ring',
    'RPG de acción y exploración en un enorme mundo de fantasía.',
    '/images/juegos/elden-ring.webp',
    '2022-02-25',
    9.5,
    3
),
(
    2,
    'Hollow Knight',
    'Aventura de exploración y combate ambientada en el reino de Hallownest.',
    '/images/juegos/hollow-knight.webp',
    '2017-02-24',
    9.2,
    2
),
(
    3,
    'Resident Evil 4',
    'Juego de terror y acción centrado en el rescate de la hija del presidente.',
    '/images/juegos/resident-evil-4.webp',
    '2023-03-24',
    9.3,
    7
),
(
    4,
    'Celeste',
    'Juego de plataformas centrado en escalar una montaña y superar numerosos desafíos.',
    '/images/juegos/celeste.webp',
    '2018-01-25',
    9.1,
    9
),
(
    5,
    'Baldurs Gate 3',
    'RPG centrado en decisiones, exploración y combates estratégicos por turnos.',
    '/images/juegos/baldurs-Gate-3.webp',
    '2023-08-03',
    9.7,
    3
),
(
    6,
    'Hades',
    'Juego de acción en el que Zagreus intenta escapar del inframundo.',
    '/images/juegos/hades.webp',
    '2020-09-17',
    9.4,
    1
),
(
    7,
    'Stardew Valley',
    'Simulador de vida rural con agricultura, exploración y relaciones sociales.',
    'images/juegos/stardew-valley.webp',
    '2016-02-26',
    9.0,
    8
),
(
    8,
    'DOOM Eternal',
    'Shooter de acción rápida centrado en combatir hordas demoníacas.',
    'images/juegos/doom-eternal.webp',
    '2020-03-20',
    9.0,
    10
),
(
    9,
    'Forza Horizon 5',
    'Juego de conducción de mundo abierto ambientado en una versión de México.',
    'images/juegos/forza-horizon-5.webp',
    '2021-11-09',
    9.1,
    6
),
(
    10,
    'Dead Space',
    'Aventura de terror y ciencia ficción ambientada en una nave minera.',
    'images/juegos/dead-space.webp',
    '2023-01-27',
    9.0,
    7
);

INSERT INTO juego_plataforma (juego_id, plataforma_id)
VALUES
    -- Elden Ring
    (1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (1, 5),

    -- Hollow Knight
    (2, 1),
    (2, 3),
    (2, 5),
    (2, 6),

    -- Resident Evil 4
    (3, 1),
    (3, 2),
    (3, 3),
    (3, 4),

    -- Celeste
    (4, 1),
    (4, 3),
    (4, 5),
    (4, 6),

    -- Baldur's Gate 3
    (5, 1),
    (5, 2),
    (5, 4),

    -- Hades
    (6, 1),
    (6, 2),
    (6, 3),
    (6, 4),
    (6, 5),
    (6, 6),

    -- Stardew Valley
    (7, 1),
    (7, 3),
    (7, 5),
    (7, 6),

    -- DOOM Eternal
    (8, 1),
    (8, 2),
    (8, 3),
    (8, 4),
    (8, 5),
    (8, 6),

    -- Forza Horizon 5
    (9, 1),
    (9, 4),
    (9, 5),

    -- Dead Space
    (10, 1),
    (10, 2),
    (10, 4);

INSERT INTO resenas_editoriales (
    juego_id,
    puntuacion,
    comentario,
    etiqueta
)
VALUES
(
    1,
    9.6,
    'Una aventura enorme, desafiante y con una libertad de exploración excepcional.',
    'Imprescindible'
),
(
    2,
    9.4,
    'Una experiencia de exploración y combate muy cuidada, con un mundo memorable.',
    'Joya oculta'
),
(
    3,
    9.2,
    'Una excelente combinación de acción, tensión y diseño de niveles.',
    'Recomendado'
),
(
    4,
    9.1,
    'Un plataformas exigente con una historia personal y una progresión muy satisfactoria.',
    'Desafiante'
),
(
    5,
    9.8,
    'Un RPG sobresaliente por la libertad de decisión y la profundidad de sus personajes.',
    'Imprescindible'
),
(
    6,
    9.5,
    'Combate rápido, excelente ritmo y una estructura que invita a jugar una partida más.',
    'Imprescindible'
),
(
    7,
    9.2,
    'Una experiencia relajante y sorprendentemente profunda que ofrece muchísima libertad.',
    'Para desconectar'
),
(
    8,
    9.1,
    'Acción frenética y un sistema de combate diseñado para mantener al jugador en movimiento.',
    'Adrenalina'
),
(
    9,
    9.0,
    'Una propuesta de conducción accesible con un enorme mundo abierto por descubrir.',
    'Ideal con amigos'
),
(
    10,
    9.0,
    'Tensión, ambientación y exploración se combinan en una experiencia de terror muy cuidada.',
    'Recomendado'
);  


INSERT INTO juegos (
    id,
    titulo,
    descripcion,
    imagen,
    fecha_lanzamiento,
    puntuacion,
    genero_id
)
VALUES
(
    11,
    'The Witcher 3: Wild Hunt',
    'RPG de mundo abierto centrado en las aventuras del brujo Geralt de Rivia.',
    'images/juegos/the-witcher-3.webp',
    '2015-05-19',
    9.6,
    3
),
(
    12,
    'Cyberpunk 2077',
    'RPG de acción ambientado en la futurista y peligrosa Night City.',
    'images/juegos/cyberpunk-2077.webp',
    '2020-12-10',
    9.0,
    3
),
(
    13,
    'Sekiro: Shadows Die Twice',
    'Juego de acción exigente centrado en el combate con espada y la precisión.',
    'images/juegos/sekiro.webp',
    '2019-03-22',
    9.3,
    1
),
(
    14,
    'Control',
    'Aventura de acción sobrenatural ambientada en una misteriosa agencia gubernamental.',
    'images/juegos/control.webp',
    '2019-08-27',
    8.8,
    1
),
(
    15,
    'Alan Wake 2',
    'Aventura de terror psicológico que combina investigación, supervivencia y narrativa.',
    'images/juegos/alan-wake-2.webp',
    '2023-10-27',
    9.4,
    7
),
(
    16,
    'The Last of Us Part I',
    'Aventura narrativa de supervivencia ambientada en un mundo devastado por una infección.',
    '/images/juegos/the-last-of-us-part-1.webp',
    '2022-09-02',
    9.5,
    2
),
(
    17,
    'God of War',
    'Aventura de acción protagonizada por Kratos y su hijo Atreus en tierras nórdicas.',
    '/images/juegos/god-of-war.webp',
    '2018-04-20',
    9.5,
    2
),
(
    18,
    'God of War Ragnarök',
    'Continuación de la aventura de Kratos y Atreus ante la llegada del Ragnarök.',
    '/images/juegos/god-of-war-ragnarok.webp',
    '2022-11-09',
    9.6,
    2
),
(
    19,
    'Marvel''s Spider-Man Remastered',
    'Aventura de acción en mundo abierto protagonizada por Spider-Man en Nueva York.',
    '/images/juegos/marvel-spider-man.webp',
    '2020-11-12',
    9.1,
    2
),
(
    20,
    'Red Dead Redemption 2',
    'Aventura de mundo abierto ambientada en los últimos años del Salvaje Oeste.',
    '/images/juegos/red-dead-redemption-2.webp',
    '2018-10-26',
    9.7,
    2
);

INSERT INTO juego_plataforma (juego_id, plataforma_id)
VALUES
    -- The Witcher 3
    (11, 1),
    (11, 2),
    (11, 3),
    (11, 4),
    (11, 5),
    (11, 6),

    -- Cyberpunk 2077
    (12, 1),
    (12, 2),
    (12, 3),
    (12, 4),
    (12, 5),

    -- Sekiro
    (13, 1),
    (13, 3),
    (13, 5),

    -- Control
    (14, 1),
    (14, 2),
    (14, 3),
    (14, 4),
    (14, 5),

    -- Alan Wake 2
    (15, 1),
    (15, 2),
    (15, 4),

    -- The Last of Us Part I
    (16, 1),
    (16, 2),

    -- God of War
    (17, 1),
    (17, 3),

    -- God of War Ragnarök
    (18, 1),
    (18, 2),
    (18, 3),

    -- Marvel's Spider-Man Remastered
    (19, 1),
    (19, 2),

    -- Red Dead Redemption 2
    (20, 1),
    (20, 3),
    (20, 5);

    INSERT INTO resenas_editoriales (
    juego_id,
    puntuacion,
    comentario,
    etiqueta
)
VALUES
(
    11,
    9.7,
    'Un RPG enorme y memorable que destaca por sus personajes, misiones y construcción de mundo.',
    'Imprescindible'
),
(
    12,
    9.1,
    'Una propuesta de ciencia ficción con una ciudad espectacular y numerosas posibilidades de desarrollo.',
    'Recomendado'
),
(
    13,
    9.4,
    'Un sistema de combate preciso y exigente que recompensa aprender de cada enfrentamiento.',
    'Desafiante'
),
(
    14,
    8.9,
    'Una aventura original que mezcla poderes sobrenaturales, exploración y una atmósfera inquietante.',
    'Joya oculta'
),
(
    15,
    9.5,
    'Una experiencia de terror muy cuidada en la que narrativa y ambientación tienen un papel fundamental.',
    'Imprescindible'
),
(
    16,
    9.6,
    'Una aventura intensa que destaca especialmente por sus personajes y su capacidad narrativa.',
    'Imprescindible'
),
(
    17,
    9.5,
    'Una reinvención excelente de la saga con grandes combates y una relación protagonista muy bien construida.',
    'Imprescindible'
),
(
    18,
    9.6,
    'Una continuación ambiciosa que amplía prácticamente todos los elementos de la aventura anterior.',
    'Imprescindible'
),
(
    19,
    9.2,
    'Moverse por Nueva York resulta tan divertido como combatir gracias a un sistema muy fluido.',
    'Recomendado'
),
(
    20,
    9.8,
    'Un mundo abierto extraordinariamente detallado acompañado de personajes y momentos memorables.',
    'Imprescindible'
);

INSERT INTO juegos (
    id,
    titulo,
    descripcion,
    imagen,
    fecha_lanzamiento,
    puntuacion,
    genero_id
)
VALUES
(
    21,
    'Ghost of Tsushima Director''s Cut',
    'Aventura de acción en mundo abierto ambientada en el Japón feudal durante la invasión mongola.',
    '/images/juegos/ghost-of-tsushima-directors-cut.webp',
    '2021-08-20',
    9.3,
    2
),
(
    22,
    'Horizon Forbidden West',
    'Aventura de mundo abierto protagonizada por Aloy en un territorio dominado por enormes máquinas.',
    '/images/juegos/horizon-forbidden-west.webp',
    '2022-02-18',
    9.2,
    2
),
(
    23,
    'Cuphead',
    'Juego de acción y plataformas inspirado en la animación clásica y centrado en exigentes combates.',
    '/images/juegos/cuphead.webp',
    '2017-09-29',
    9.0,
    9
),
(
    24,
    'Ori and the Will of the Wisps',
    'Aventura de plataformas y exploración ambientada en un mundo fantástico lleno de peligros.',
    '/images/juegos/ori-and-the-will-of-the-wisps.webp',
    '2020-03-11',
    9.2,
    9
),
(
    25,
    'Disco Elysium - The Final Cut',
    'RPG narrativo centrado en la investigación, los diálogos y las decisiones del jugador.',
    '/images/juegos/disco-elysium-the-final-cut.webp',
    '2021-03-30',
    9.4,
    3
),
(
    26,
    'Persona 5 Royal',
    'RPG japonés que combina combates por turnos, exploración y vida cotidiana.',
    '/images/juegos/persona-5-royal.webp',
    '2020-03-31',
    9.5,
    3
),
(
    27,
    'It Takes Two',
    'Aventura cooperativa diseñada alrededor de mecánicas variadas que requieren colaboración constante.',
    '/images/juegos/it-takes-two.webp',
    '2021-03-26',
    9.3,
    2
),
(
    28,
    'Dying Light 2 Stay Human',
    'Juego de acción y supervivencia en mundo abierto con parkour y enfrentamientos contra infectados.',
    '/images/juegos/dying-light-2-stay-human.webp',
    '2022-02-04',
    8.7,
    1
),
(
    29,
    'XCOM 2',
    'Juego de estrategia por turnos centrado en dirigir una resistencia contra una ocupación alienígena.',
    '/images/juegos/xcom-2.webp',
    '2016-02-05',
    9.0,
    4
),
(
    30,
    'EA Sports FC 25',
    'Juego de fútbol con competiciones, equipos y diferentes modos para jugar solo o acompañado.',
    '/images/juegos/ea-sports-fc-25.webp',
    '2024-09-27',
    8.5,
    5
);

INSERT INTO juego_plataforma (juego_id, plataforma_id)
VALUES
    -- Ghost of Tsushima Director's Cut
    (21, 1),
    (21, 2),
    (21, 3),

    -- Horizon Forbidden West
    (22, 1),
    (22, 2),
    (22, 3),

    -- Cuphead
    (23, 1),
    (23, 3),
    (23, 5),
    (23, 6),

    -- Ori and the Will of the Wisps
    (24, 1),
    (24, 4),
    (24, 5),
    (24, 6),

    -- Disco Elysium - The Final Cut
    (25, 1),
    (25, 2),
    (25, 3),
    (25, 4),
    (25, 5),
    (25, 6),

    -- Persona 5 Royal
    (26, 1),
    (26, 2),
    (26, 3),
    (26, 4),
    (26, 5),
    (26, 6),

    -- It Takes Two
    (27, 1),
    (27, 2),
    (27, 3),
    (27, 4),
    (27, 5),
    (27, 6),

    -- Dying Light 2 Stay Human
    (28, 1),
    (28, 2),
    (28, 3),
    (28, 4),
    (28, 5),

    -- XCOM 2
    (29, 1),
    (29, 3),
    (29, 5),
    (29, 6),

    -- EA Sports FC 25
    (30, 1),
    (30, 2),
    (30, 3),
    (30, 4),
    (30, 5),
    (30, 6);

    INSERT INTO resenas_editoriales (
    juego_id,
    puntuacion,
    comentario,
    etiqueta
)
VALUES
(
    21,
    9.4,
    'Una aventura visualmente espectacular con un sistema de combate satisfactorio y una ambientación excelente.',
    'Imprescindible'
),
(
    22,
    9.2,
    'Un enorme mundo abierto que mejora la exploración, el combate y la variedad de máquinas.',
    'Recomendado'
),
(
    23,
    9.2,
    'Su magnífico apartado artístico acompaña a unos combates exigentes que requieren precisión y paciencia.',
    'Desafiante'
),
(
    24,
    9.4,
    'Una aventura preciosa con movimientos muy fluidos y un excelente equilibrio entre exploración y plataformas.',
    'Joya oculta'
),
(
    25,
    9.6,
    'Una experiencia narrativa extraordinaria donde las conversaciones y decisiones tienen verdadero protagonismo.',
    'Imprescindible'
),
(
    26,
    9.6,
    'Una mezcla excelente de RPG, relaciones personales y una enorme cantidad de contenido.',
    'Imprescindible'
),
(
    27,
    9.5,
    'Una de las propuestas cooperativas más creativas gracias a su constante variedad de mecánicas.',
    'Ideal con amigos'
),
(
    28,
    8.8,
    'El parkour y la exploración ofrecen momentos muy divertidos dentro de un enorme escenario urbano.',
    'Recomendado'
),
(
    29,
    9.2,
    'Una propuesta estratégica exigente en la que cada decisión puede cambiar el desarrollo de una misión.',
    'Desafiante'
),
(
    30,
    8.6,
    'Una opción accesible para disfrutar del fútbol tanto en solitario como en partidas con amigos.',
    'Ideal con amigos'
);

INSERT INTO juegos (
    id,
    titulo,
    descripcion,
    imagen,
    fecha_lanzamiento,
    puntuacion,
    genero_id
)
VALUES
(
    31,
    'Sid Meier''s Civilization VI',
    'Juego de estrategia por turnos centrado en construir y desarrollar una civilización a lo largo de la historia.',
    '/images/juegos/sid-meiers-civilization-vi.webp',
    '2016-10-21',
    9.0,
    4
),
(
    32,
    'Age of Empires IV',
    'Juego de estrategia en tiempo real basado en la gestión de recursos y el desarrollo de diferentes civilizaciones.',
    '/images/juegos/age-of-empires-iv.webp',
    '2021-10-28',
    9.0,
    4
),
(
    33,
    'Cities: Skylines',
    'Simulador de construcción y gestión de ciudades con numerosas opciones de planificación urbana.',
    '/images/juegos/cities-skylines.webp',
    '2015-03-10',
    8.9,
    8
),
(
    34,
    'Animal Crossing: New Horizons',
    'Simulador de vida relajado en el que el jugador desarrolla y personaliza su propia isla.',
    '/images/juegos/animal-crossing-new-horizons.webp',
    '2020-03-20',
    9.1,
    8
),
(
    35,
    'Super Mario Odyssey',
    'Juego de plataformas y exploración protagonizado por Mario en una aventura a través de diferentes reinos.',
    '/images/juegos/super-mario-odyssey.webp',
    '2017-10-27',
    9.6,
    9
),
(
    36,
    'Metroid Dread',
    'Aventura de acción y exploración protagonizada por Samus Aran en un peligroso planeta.',
    '/images/juegos/metroid-dread.webp',
    '2021-10-08',
    9.2,
    1
),
(
    37,
    'Mario Kart 8 Deluxe',
    'Juego de carreras accesible y competitivo protagonizado por personajes del universo de Mario.',
    '/images/juegos/mario-kart-8-deluxe.webp',
    '2017-04-28',
    9.3,
    6
),
(
    38,
    'Gran Turismo 7',
    'Simulador de conducción centrado en una amplia selección de vehículos y diferentes tipos de competición.',
    '/images/juegos/gran-turismo-7.webp',
    '2022-03-04',
    9.1,
    6
),
(
    39,
    'F1 24',
    'Juego de conducción basado en el campeonato de Fórmula 1 con diferentes modos de competición.',
    '/images/juegos/f1-24.webp',
    '2024-05-31',
    8.6,
    6
),
(
    40,
    'Helldivers 2',
    'Shooter cooperativo centrado en completar misiones mientras los jugadores combaten grandes grupos de enemigos.',
    '/images/juegos/helldivers-2.webp',
    '2024-02-08',
    9.1,
    10
);

INSERT INTO juego_plataforma (juego_id, plataforma_id)
VALUES
    -- Sid Meier's Civilization VI
    (31, 1),
    (31, 3),
    (31, 5),
    (31, 6),

    -- Age of Empires IV
    (32, 1),
    (32, 4),
    (32, 5),

    -- Cities: Skylines
    (33, 1),
    (33, 3),
    (33, 5),
    (33, 6),

    -- Animal Crossing: New Horizons
    (34, 6),

    -- Super Mario Odyssey
    (35, 6),

    -- Metroid Dread
    (36, 6),

    -- Mario Kart 8 Deluxe
    (37, 6),

    -- Gran Turismo 7
    (38, 2),
    (38, 3),

    -- F1 24
    (39, 1),
    (39, 2),
    (39, 3),
    (39, 4),
    (39, 5),

    -- Helldivers 2
    (40, 1),
    (40, 2);

   INSERT INTO resenas_editoriales (
    juego_id,
    puntuacion,
    comentario,
    etiqueta
)
VALUES
(
    31,
    9.2,
    'Una propuesta estratégica muy profunda donde cada partida puede desarrollarse de una forma completamente diferente.',
    'Para estrategas'
),
(
    32,
    9.1,
    'Una excelente combinación de gestión, expansión y combates que mantiene la esencia de la estrategia en tiempo real.',
    'Para estrategas'
),
(
    33,
    9.0,
    'Un simulador muy completo para quienes disfrutan planificando, construyendo y administrando grandes ciudades.',
    'Para desconectar'
),
(
    34,
    9.2,
    'Una experiencia tranquila y personalizable que permite avanzar al ritmo que cada jugador prefiera.',
    'Para desconectar'
),
(
    35,
    9.7,
    'Una aventura de plataformas extremadamente creativa que sorprende constantemente con nuevas ideas.',
    'Imprescindible'
),
(
    36,
    9.3,
    'Exploración, tensión y combates precisos se combinan en una aventura de excelente ritmo.',
    'Recomendado'
),
(
    37,
    9.5,
    'Una de las mejores opciones para competir con amigos gracias a su accesibilidad y enorme variedad de circuitos.',
    'Ideal con amigos'
),
(
    38,
    9.2,
    'Una propuesta de conducción muy cuidada especialmente atractiva para quienes disfrutan coleccionando y mejorando vehículos.',
    'Recomendado'
),
(
    39,
    8.7,
    'Una experiencia de Fórmula 1 completa para quienes buscan competir tanto en solitario como contra otros jugadores.',
    'Ideal con amigos'
),
(
    40,
    9.3,
    'El caos de sus misiones y la necesidad de coordinación convierten cada partida cooperativa en una experiencia diferente.',
    'Ideal con amigos'
); 

INSERT INTO juegos (
    id,
    titulo,
    descripcion,
    imagen,
    fecha_lanzamiento,
    puntuacion,
    genero_id
)
VALUES
(
    41,
    'Mass Effect Legendary Edition',
    'RPG de ciencia ficción que reúne la trilogía protagonizada por el comandante Shepard.',
    '/images/juegos/mass-effect-legendary-edition.webp',
    '2021-05-14',
    9.3,
    3
),
(
    42,
    'Death Stranding Director''s Cut',
    'Aventura de exploración ambientada en un mundo fragmentado donde conectar comunidades es fundamental.',
    '/images/juegos/death-stranding-directors-cut.webp',
    '2021-09-24',
    9.0,
    2
),
(
    43,
    'Lies of P',
    'RPG de acción exigente inspirado en una versión oscura de la historia de Pinocho.',
    '/images/juegos/lies-of-p.webp',
    '2023-09-19',
    9.1,
    3
),
(
    44,
    'Street Fighter 6',
    'Juego de lucha competitivo con diferentes personajes y modos para jugadores nuevos y experimentados.',
    '/images/juegos/street-fighter-6.webp',
    '2023-06-02',
    9.2,
    1
),
(
    45,
    'Minecraft',
    'Juego de exploración, construcción y supervivencia basado en un mundo formado por bloques.',
    '/images/juegos/minecraft.webp',
    '2011-11-18',
    9.4,
    8
),
(
    46,
    'Rocket League',
    'Juego deportivo que combina fútbol y vehículos en partidos rápidos y competitivos.',
    '/images/juegos/rocket-league.webp',
    '2015-07-07',
    9.0,
    5
),
(
    47,
    'Titanfall 2',
    'Shooter de ciencia ficción que combina combates rápidos, movilidad avanzada y enormes titanes.',
    '/images/juegos/titanfall-2.webp',
    '2016-10-28',
    9.2,
    10
),
(
    48,
    'The Legend of Zelda: Tears of the Kingdom',
    'Aventura de exploración en mundo abierto que amplía Hyrule con nuevas zonas y posibilidades creativas.',
    '/images/juegos/the-legend-of-zelda-tears-of-the-kingdom.webp',
    '2023-05-12',
    9.7,
    2
),
(
    49,
    'Final Fantasy VII Rebirth',
    'RPG que continúa el viaje de Cloud y sus compañeros a través de un mundo amplio y variado.',
    '/images/juegos/final-fantasy-vii-rebirth.webp',
    '2024-02-29',
    9.5,
    3
),
(
    50,
    'Alien: Isolation',
    'Juego de terror y supervivencia ambientado en una estación espacial perseguida por una amenaza impredecible.',
    '/images/juegos/alien-isolation.webp',
    '2014-10-07',
    9.0,
    7
);

INSERT INTO juego_plataforma (juego_id, plataforma_id)
VALUES
    -- Mass Effect Legendary Edition
    (41, 1),
    (41, 3),
    (41, 5),

    -- Death Stranding Director's Cut
    (42, 1),
    (42, 2),

    -- Lies of P
    (43, 1),
    (43, 2),
    (43, 3),
    (43, 4),
    (43, 5),

    -- Street Fighter 6
    (44, 1),
    (44, 2),
    (44, 3),
    (44, 4),

    -- Minecraft
    (45, 1),
    (45, 3),
    (45, 5),
    (45, 6),

    -- Rocket League
    (46, 1),
    (46, 3),
    (46, 5),
    (46, 6),

    -- Titanfall 2
    (47, 1),
    (47, 3),
    (47, 5),

    -- The Legend of Zelda: Tears of the Kingdom
    (48, 6),

    -- Final Fantasy VII Rebirth
    (49, 1),
    (49, 2),

    -- Alien: Isolation
    (50, 1),
    (50, 3),
    (50, 5),
    (50, 6);

    INSERT INTO resenas_editoriales (
    juego_id,
    puntuacion,
    comentario,
    etiqueta
)
VALUES
(
    41,
    9.5,
    'Una excelente forma de disfrutar una saga de ciencia ficción marcada por sus personajes y decisiones.',
    'Imprescindible'
),
(
    42,
    9.2,
    'Una aventura diferente y contemplativa que convierte el viaje y la planificación en sus principales protagonistas.',
    'Joya oculta'
),
(
    43,
    9.3,
    'Un sistema de combate exigente acompañado de una ambientación oscura y una gran dirección artística.',
    'Desafiante'
),
(
    44,
    9.3,
    'Un juego de lucha accesible para empezar pero con suficiente profundidad para competir durante muchas horas.',
    'Ideal con amigos'
),
(
    45,
    9.5,
    'Su libertad para construir, explorar y experimentar permite que cada jugador encuentre su propia forma de disfrutarlo.',
    'Para desconectar'
),
(
    46,
    9.2,
    'Una idea sencilla y extremadamente efectiva que funciona especialmente bien en partidas con amigos.',
    'Ideal con amigos'
),
(
    47,
    9.4,
    'Una campaña excelente y un sistema de movimiento que convierte cada combate en una experiencia muy dinámica.',
    'Joya oculta'
),
(
    48,
    9.8,
    'Una aventura extraordinariamente abierta donde la exploración y la creatividad del jugador tienen enorme protagonismo.',
    'Imprescindible'
),
(
    49,
    9.6,
    'Un RPG ambicioso con grandes personajes, combates variados y un mundo lleno de contenido por descubrir.',
    'Imprescindible'
),
(
    50,
    9.2,
    'Una experiencia de terror basada en la tensión y la vulnerabilidad que mantiene al jugador constantemente alerta.',
    'Desafiante'
);



SELECT COUNT(*) AS total_generos FROM generos;
SELECT COUNT(*) AS total_plataformas FROM plataformas;
SELECT COUNT(*) AS total_juegos FROM juegos;
SELECT COUNT(*) AS total_relaciones FROM juego_plataforma;
SELECT COUNT(*) AS total_resenas FROM resenas_editoriales;