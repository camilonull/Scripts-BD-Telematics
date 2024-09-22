INSERT INTO historical_context (context_name, description_context) VALUES ('Mi depresión', 'Estaba triste');

INSERT INTO technique (technique_name, technique_description) VALUES ('El pincel', 'Pinzeladas');

INSERT INTO location (country, departament, city, latitude, longitude) VALUES ('Colombia', 'Boyacá', 'Tunja', 56.977, 45.874);

INSERT INTO type_artwork (type_artwork, type_artwork_description) VALUES ('Gotica', 'Es gotica');

INSERT INTO development_surface (surface_name, surface_description) VALUES ('Pared', 'Compuesta de ladrillos');

-- Obra de arte
INSERT INTO artwork (artwork_title, date_creation, description_artwork, high, width, depth, verified_artwork, historical_context, technique, location, type_artwork, development_surface)
SELECT 
	'Tristeza',
    '2024-09-21',
    'Obra triste',
    1.50,
    5.50,
    2.30,
    1,
    hc.id_historical_context,
    tch.id_technique,
    l.id_location,
    tw.id_type_artwork,
    ds.id_development
    FROM historical_context hc, technique tch, location l, type_artwork tw, development_surface ds
    WHERE hc.id_historical_context = 1 
    AND tch.id_technique = 1
    AND l.id_location = 1
    AND tw.id_type_artwork = 1
    AND ds.id_development = 1;

-- Persona

INSERT INTO person (first_name, last_name, email, phone) VALUES ('Erik', 'Molina', 'erik.molina01@uptc.edu.co', '3222647865');
INSERT INTO person (first_name, last_name, email, phone) VALUES ('Leonardo', 'Fonseca', 'erikmol8903@gmail.com', '3222647878');


-- status

INSERT INTO status_account (status_account) VALUES ('Habilitada');
INSERT INTO status_account (status_account) VALUES ('Deshabilitada');

-- Usuario

INSERT INTO users (id_person, status_account, username, password_user) 
SELECT 
p.id_person,
sa.id_status_account,
'erikmol89',
'123'
FROM person p, status_account sa
WHERE p.id_person = 1 AND sa.id_status_account = 1;

INSERT INTO users (id_person, status_account, username, password_user) 
SELECT 
p.id_person,
sa.id_status_account,
'erikmol03',
'123'
FROM person p, status_account sa
WHERE p.id_person = 4 AND sa.id_status_account = 2;

-- Relación obras de artes con usuarios

INSERT INTO artwork_user (id_artwork, id_user) 
SELECT 
atw.id_artwork,
u.id_user
FROM artwork atw, users u
WHERE atw.id_artwork = 1 AND u.id_user = 1;


-- Comentarios

INSERT INTO comment_user (id_artwork, id_user, commentary, commentary_date) 
SELECT
art.id_artwork,
u.id_user,
'Esto es un comentario :)',
'2024-09-21'
FROM artwork art, users u
WHERE art.id_artwork = 1 AND u.id_user = 1; 

INSERT INTO comment_user (id_artwork, id_user, commentary, commentary_date) 
SELECT
art.id_artwork,
u.id_user,
'Tu comentario me gusto! :(',
'2024-09-21'
FROM artwork art, users u
WHERE art.id_artwork = 1 AND u.id_user = 2; 


-- Calificación social Obra

INSERT INTO social_calification (id_artwork, amount_likes, amount_dislikes, star_points)
SELECT 
artw.id_artwork,
10,
5,
8
FROM artwork artw
WHERE artw.id_artwork = 1;

-- Materiales

INSERT INTO materials (material_name, material_description) VALUES 
('mármol', 'Superficie de piedra blanca con vetas grises'),
('cerámica', 'Azulejos lisos de color beige'),
('granito', 'Superficie de piedra negra con motas blancas'),
('madera', 'Roble pulido de tonalidad oscura'),
('concreto', 'Superficie gris lisa y resistente'),
('vidrio', 'Superficie transparente y reflectante'),
('metal', 'Acero inoxidable de acabado brillante'),
('yeso', 'Superficie blanca y lisa para paredes interiores'),
('baldosa', 'Pieza cerámica para pisos con acabado mate'),
('alfombra', 'Superficie suave de lana de color gris'),
('teja', 'Tejas de barro rojizo para techos'),
('pizarra', 'Superficie oscura con textura rugosa'),
('linóleo', 'Revestimiento de suelos resistente de color marrón claro'),
('vinilo', 'Piso de vinilo flexible en tono madera clara'),
('parquet', 'Madera en pequeños paneles para suelos'),
('corcho', 'Superficie natural y aislante para suelos'),
('azulejo', 'Pieza de cerámica brillante de color azul'),
('hormigón', 'Superficie rugosa de color gris claro'),
('piedra caliza', 'Superficie de piedra clara y porosa'),
('terrazzo', 'Superficie de compuesto de mármol con cemento, de tonalidades multicolores');

-- Superficie de desarollo

INSERT INTO development_surface (surface_name, surface_description) VALUES 
('Pared de edificio', 'Superficie vertical amplia, ideal para murales de gran formato'),
('Puente', 'Superficie expuesta, visible desde varios ángulos, adecuada para intervenciones artísticas'),
('Muro de contención', 'Superficie resistente, a menudo expuesta en espacios públicos, perfecta para grafitis duraderos'),
('Valla publicitaria', 'Superficie plana y elevada, ubicada en áreas de alta visibilidad'),
('Puerta de garaje', 'Superficie plegable y móvil, utilizada para piezas temporales de street art'),
('Túnel subterráneo', 'Superficie envolvente, protegida del clima, adecuada para obras de larga duración'),
('Escaleras exteriores', 'Superficie escalonada, ideal para obras en perspectiva o arte en 3D'),
('Pilar de puente', 'Superficie cilíndrica vertical, ofrece múltiples puntos de vista'),
('Muro de fábrica abandonada', 'Superficie rugosa y envejecida, aporta carácter a las obras artísticas'),
('Callejón', 'Superficie alargada y confinada, ideal para intervenciones en espacios reducidos'),
('Toldo', 'Superficie horizontal y expuesta, perfecta para obras temporales o efímeras'),
('Pared de estacionamiento', 'Superficie extensa y visible, frecuentada por vehículos y peatones'),
('Cubo de basura', 'Superficie móvil y funcional, adecuada para pequeños detalles artísticos'),
('Estación de tren', 'Superficie de tránsito continuo, perfecta para obras urbanas con alto impacto visual'),
('Puerta metálica', 'Superficie móvil y lisa, ideal para grafitis o stencils'),
('Banco público', 'Superficie plana y horizontal, excelente para obras de interacción social'),
('Paso subterráneo', 'Superficie continua, a menudo conectada a otros espacios, perfecta para murales'),
('Escultura urbana', 'Superficie tridimensional, permite intervenciones artísticas alrededor de una estructura preexistente'),
('Parada de autobús', 'Superficie funcional y transitada, con potencial para obras de gran visibilidad'),
('Muro de estadio', 'Superficie amplia y frecuentada por multitudes, ideal para grandes murales o grafitis visibles');


