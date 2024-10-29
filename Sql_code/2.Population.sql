USE first_task

-- Población de la tabla Players
INSERT INTO Players (name, email, password) VALUES 
('Juan Pérez', 'juan.perez@example.com', 'password123'),
('María López', 'maria.lopez@example.com', 'password456'),
('Carlos González', 'carlos.gonzalez@example.com', 'password789'),
('Ana Martínez', 'ana.martinez@example.com', 'password321'),
('Luis Fernández', 'luis.fernandez@example.com', 'password654'),
('Sofía Torres', 'sofia.torres@example.com', 'password987'),
('Javier Ramírez', 'javier.ramirez@example.com', 'password159'),
('Clara Jiménez', 'clara.jimenez@example.com', 'password753'),
('Diego Ortega', 'diego.ortega@example.com', 'password852'),
('Lucía Romero', 'lucia.romero@example.com', 'password147');

-- Población de la tabla Characters
INSERT INTO Characters (ID_player, character_name, level, experience, class, health, mana) VALUES 
(1, 'Guerrero de la Luz', 5, 1500, 'Guerrero', 120, 80),
(1, 'Maga Oscura', 3, 800, 'Mago', 100, 150),
(2, 'Exploradora del Bosque', 4, 1200, 'Explorador', 110, 90),
(3, 'Caballero de la Noche', 6, 2000, 'Caballero', 130, 70),
(4, 'Hechicera', 2, 500, 'Hechicero', 90, 160),
(5, 'Asesina Silenciosa', 3, 900, 'Asesino', 95, 85),
(6, 'Guardian de la Selva', 4, 1100, 'Guardián', 115, 75),
(7, 'Místico', 2, 400, 'Místico', 80, 120),
(8, 'Paladín', 7, 2500, 'Paladín', 150, 60),
(9, 'Cazador de Demonios', 5, 1800, 'Cazador', 125, 65);

-- Población de la tabla Player_Stats
INSERT INTO Player_Stats (ID_player, total_playtime, total_quests_completed, total_fights_won, total_fights_lost) VALUES 
(1, 300, 15, 10, 5),
(2, 200, 10, 5, 5),
(3, 400, 20, 15, 5),
(4, 150, 5, 2, 3),
(5, 250, 12, 8, 4),
(6, 350, 18, 12, 6),
(7, 180, 7, 4, 3),
(8, 400, 25, 20, 5),
(9, 275, 11, 9, 2),
(10, 320, 14, 10, 4);

-- Población de la tabla Support_and_Customer_Service
INSERT INTO Support_and_Customer_Service (ID_player, problem_category, problem_description, priority, ticket_status) VALUES 
(1, 'Cuenta', 'No puedo acceder a mi cuenta', 'High', 'Open'),
(2, 'Compra', 'Problema con una compra reciente', 'Medium', 'In Progress'),
(3, 'Error técnico', 'El juego se cierra inesperadamente', 'Low', 'Resolved'),
(4, 'Sugerencia', 'Me gustaría sugerir una nueva misión', 'Low', 'Closed'),
(5, 'Cuenta', 'Olvidé mi contraseña', 'High', 'Open'),
(6, 'Compra', 'No recibí el artículo comprado', 'Medium', 'In Progress'),
(7, 'Error técnico', 'Problemas de conexión', 'Low', 'Resolved'),
(8, 'Sugerencia', 'Incluir más misiones para niveles altos', 'Medium', 'Closed'),
(9, 'Cuenta', 'No puedo cambiar mi email', 'High', 'Open'),
(10, 'Compra', 'Dudas sobre la tienda', 'Low', 'In Progress');

-- Población de la tabla Financial_Transactions
INSERT INTO Financial_Transactions (ID_player, transaction_type, amount, currency, payment_method, transaction_status) VALUES 
(1, 'Deposit', 50.00, 'USD', 'Tarjeta de crédito', 'Completed'),
(2, 'Purchase', 20.00, 'USD', 'PayPal', 'Completed'),
(3, 'Deposit', 100.00, 'USD', 'Transferencia bancaria', 'Pending'),
(4, 'Purchase', 10.00, 'USD', 'Tarjeta de crédito', 'Failed'),
(5, 'Deposit', 75.00, 'USD', 'Tarjeta de débito', 'Completed'),
(6, 'Purchase', 30.00, 'USD', 'PayPal', 'Completed'),
(7, 'Deposit', 40.00, 'USD', 'Tarjeta de crédito', 'Completed'),
(8, 'Purchase', 15.00, 'USD', 'Transferencia bancaria', 'Completed'),
(9, 'Deposit', 60.00, 'USD', 'Tarjeta de débito', 'Pending'),
(10, 'Purchase', 25.00, 'USD', 'Tarjeta de crédito', 'Completed');

-- Población de la tabla Achievements
INSERT INTO Achievements (achievement_name, description, rewards, difficulty_level) VALUES 
('Primeros Pasos', 'Completa tu primera misión', '50 puntos de experiencia', 1),
('Guerrero Legendario', 'Gana 50 combates', '100 monedas', 2),
('Maestro de la Magia', 'Alcanza nivel 10 como Mago', 'Acceso a hechizos avanzados', 3),
('Explorador Novato', 'Descubre 5 áreas nuevas', '200 monedas', 1),
('Cazador de Bestias', 'Derrota 10 criaturas', '300 monedas', 2),
('Rey del Juego', 'Alcanza el nivel máximo', '500 monedas', 4),
('Amigo de Todos', 'Completa 10 misiones cooperativas', '400 monedas', 3),
('Gran Estratega', 'Gana 20 combates en modo estratégico', '350 monedas', 2),
('Superviviente', 'Sobrevive 100 minutos en el juego', '250 monedas', 1),
('Faro de Luz', 'Asiste a 5 eventos del juego', '600 monedas', 2);

-- Población de la tabla Achiev_Players
INSERT INTO Achiev_Players (ID_achievement, ID_player, date) VALUES 
(1, 1, NOW()),
(2, 1, NOW()),
(3, 2, NOW()),
(1, 2, NOW()),
(4, 3, NOW()),
(5, 3, NOW()),
(2, 4, NOW()),
(1, 5, NOW()),
(6, 6, NOW()),
(7, 7, NOW()),
(8, 8, NOW()),
(9, 9, NOW()),
(10, 10, NOW());

-- Población de la tabla Quests
INSERT INTO Quests (quest_name, description, reward, level_required) VALUES 
('El comienzo', 'Completa la misión inicial.', '100 monedas', 1),
('Enfrentando al dragón', 'Derrota al dragón de la montaña.', '500 monedas', 5),
('Rescate en el pueblo', 'Ayuda a los aldeanos a recuperar sus pertenencias.', '300 monedas', 2),
('La búsqueda del artefacto', 'Encuentra el artefacto perdido.', '700 monedas', 4),
('Cazador de Monstruos', 'Caza 5 monstruos en la selva.', '250 monedas', 3),
('Misterio en el Castillo', 'Resuelve el misterio del castillo encantado.', '400 monedas', 5),
('El Laberinto', 'Escapa del laberinto sin ser atrapado.', '600 monedas', 4),
('Batalla en el Campo', 'Participa en una batalla masiva.', '800 monedas', 6),
('Viaje a la Montaña', 'Sube a la montaña más alta.', '300 monedas', 3),
('Alianza con los Elfos', 'Forma una alianza con los elfos del bosque.', '500 monedas', 5);

-- Población de la tabla Players_Quests
INSERT INTO Players_Quests (ID_player, ID_quest, status) VALUES 
(1, 1, 'Completed'),
(1, 2, 'In Progress'),
(2, 1, 'Completed'),
(3, 3, 'Not Started'),
(4, 4, 'Not Started'),
(5, 5, 'In Progress'),
(6, 6, 'Completed'),
(7, 7, 'Not Started'),
(8, 8, 'Completed'),
(9, 9, 'In Progress'),
(10, 10, 'Not Started');

-- Población de la tabla Guilds
INSERT INTO Guilds (guild_name, ID_leader) VALUES 
('Guerreros de la Luz', 1),
('Los Hechiceros', 2),
('Exploradores del Norte', 3),
('Caballeros del Reino', 4),
('Héroes de la Alianza', 5),
('Sombra del Viento', 6),
('Guardianes de la Naturaleza', 7),
('Caballeros de la Mesa Redonda', 8),
('Bandidos del Bosque', 9),
('Legión de los Caídos', 10);

-- Población de la tabla Guild_Members
INSERT INTO Guild_Members (ID_guild, ID_player, join_date) VALUES 
(1, 1, NOW()),
(2, 2, NOW()),
(1, 3, NOW()),
(3, 4, NOW()),
(4, 5, NOW()),
(5, 6, NOW()),
(6, 7, NOW()),
(7, 8, NOW()),
(8, 9, NOW()),
(9, 10, NOW()),
(1, 10, NOW());

-- Población de la tabla Virtual_Items
INSERT INTO Virtual_Items (ID_player, item_name, description, price, category) VALUES 
(1, 'Espada del Guerrero', 'Una espada poderosa que otorga fuerza.', 25.00, 'Arma'),
(2, 'Poción de Salud', 'Restaura 50 puntos de salud.', 5.00, 'Consumible'),
(3, 'Escudo de Magia', 'Protege contra ataques mágicos.', 15.00, 'Defensa'),
(4, 'Capa de Invisibilidad', 'Te hace invisible por un corto período.', 30.00, 'Accesorio'),
(5, 'Anillo de Protección', 'Aumenta la defensa del portador.', 20.00, 'Accesorio'),
(6, 'Hacha del Cazador', 'Ideal para derribar enemigos.', 40.00, 'Arma'),
(7, 'Poción de Mana', 'Restaura 30 puntos de mana.', 10.00, 'Consumible'),
(8, 'Bastón de Mago', 'Incrementa el poder mágico.', 35.00, 'Arma'),
(9, 'Cota de Mallas', 'Protección sólida para los guerreros.', 45.00, 'Defensa'),
(10, 'Botas de Agilidad', 'Aumenta la velocidad del personaje.', 25.00, 'Accesorio');

-- Población de la tabla Items_Used
INSERT INTO Items_Used (ID_character, ID_item, usage_time) VALUES 
(1, 1, NOW()),
(2, 2, NOW()),
(3, 3, NOW()),
(4, 4, NOW()),
(5, 5, NOW()),
(6, 6, NOW()),
(7, 7, NOW()),
(8, 8, NOW()),
(9, 9, NOW()),
(10, 10, NOW());

-- Población de la tabla Fights
INSERT INTO Fights (ID_character, enemy_name, start_time, end_time, result) VALUES 
(1, 'Goblin', NOW(), NOW(), 'Win'),
(2, 'Troll', NOW(), NOW(), 'Lose'),
(3, 'Dragón', NOW(), NOW(), 'Draw'),
(4, 'Espectro', NOW(), NOW(), 'Win'),
(5, 'Lobo', NOW(), NOW(), 'Win'),
(6, 'Zombi', NOW(), NOW(), 'Lose'),
(7, 'Vampiro', NOW(), NOW(), 'Win'),
(8, 'Guerrero Caído', NOW(), NOW(), 'Draw'),
(9, 'Esqueleto', NOW(), NOW(), 'Win'),
(10, 'Fantasma', NOW(), NOW(), 'Lose');

-- Población de la tabla Game_Sessions
INSERT INTO Game_Sessions (ID_character, start_time, end_time, duration, score) VALUES 
(1, NOW(), NOW() + INTERVAL 30 MINUTE, 30, 150),
(2, NOW(), NOW() + INTERVAL 45 MINUTE, 45, 200),
(3, NOW(), NOW() + INTERVAL 60 MINUTE, 60, 250),
(4, NOW(), NOW() + INTERVAL 25 MINUTE, 25, 100),
(5, NOW(), NOW() + INTERVAL 50 MINUTE, 50, 300),
(6, NOW(), NOW() + INTERVAL 40 MINUTE, 40, 200),
(7, NOW(), NOW() + INTERVAL 35 MINUTE, 35, 150),
(8, NOW(), NOW() + INTERVAL 55 MINUTE, 55, 400),
(9, NOW(), NOW() + INTERVAL 20 MINUTE, 20, 100),
(10, NOW(), NOW() + INTERVAL 15 MINUTE, 15, 80);
