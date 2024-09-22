-- Busquedas
SELECT * FROM artwork;
SELECT * FROM historicalcontext;
SELECT * FROM location;
SELECT * FROM restoration;
SELECT * FROM technique;
SELECT * FROM location;
SELECT * FROM materials;
SELECT * FROM developmentsurface;
SELECT * FROM status_account;
SELECT * FROM person;
SELECT * FROM users;
SELECT * FROM comment_user;
SELECT * FROM metadata;
SELECT * FROM rol; 
SELECT * FROM module;
SELECT * FROM operation; 

SELECT first_name, username, s.status_account, art.id_artwork, art.artwork_title  FROM users u 
JOIN person p ON u.id_person = p.id_person 
JOIN status s ON s.id_status_account = u.status_account
JOIN artwork_user art_u ON art_u.id_user = u.id_user
JOIN artwork art ON art.id_artwork = art_u.id_artwork;

SELECT username, commentary, commentary_date FROM users u JOIN comment c ON u.id_user = c.id_user;
SELECT context_name FROM historicalcontext WHERE id_historical_context = 1;
SELECT artwork_title, description, amount_likes, amount_dislikes, star_points FROM artwork artw JOIN social_calification sc ON artw.id_artwork = sc.id_artwork; 





SELECT artwork_title, historical_context, hc.context_name FROM artwork art JOIN historicalcontext hc ON art.historical_context = hc.id_historical_context;  


-- ALTERS 

ALTER TABLE artwork AUTO_INCREMENT = 1;
ALTER TABLE artwork MODIFY restoration INT NULL;


-- Eliminar en general
TRUNCATE TABLE artwork;
DELETE FROM artwork WHERE id_artwork = 6;