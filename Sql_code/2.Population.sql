-- Insertar registros en Players
INSERT INTO Players (player_name, email, pass) VALUES
('Alice', 'alice@example.com', 'password1'),
('Bob', 'bob@example.com', 'password2'),
('Charlie', 'charlie@example.com', 'password3'),
('Diana', 'diana@example.com', 'password4'),
('Evan', 'evan@example.com', 'password5'),
('Fiona', 'fiona@example.com', 'password6'),
('George', 'george@example.com', 'password7'),
('Hannah', 'hannah@example.com', 'password8'),
('Ian', 'ian@example.com', 'password9'),
('Jack', 'jack@example.com', 'password10');

-- Insertar registros en Characters
INSERT INTO Characters (ID_player, character_name, class) VALUES
(1, 'Warrior1', 'Warrior'),
(1, 'Mage1', 'Mage'),
(2, 'Rogue1', 'Rogue'),
(2, 'Cleric1', 'Cleric'),
(3, 'Warrior2', 'Warrior'),
(3, 'Mage2', 'Mage'),
(4, 'Rogue2', 'Rogue'),
(4, 'Cleric2', 'Cleric'),
(5, 'Warrior3', 'Warrior'),
(5, 'Mage3', 'Mage');

-- Insertar registros en Player_Stats
INSERT INTO Player_Stats (ID_player, total_playtime, total_quests_completed, total_fights_won, total_fights_lost) VALUES
(1, 120, 5, 10, 2),
(2, 150, 6, 12, 3),
(3, 80, 3, 7, 1),
(4, 200, 10, 15, 5),
(5, 60, 2, 3, 0),
(6, 90, 4, 8, 4),
(7, 180, 9, 14, 2),
(8, 110, 7, 11, 4),
(9, 130, 8, 13, 3),
(10, 70, 1, 2, 1);

-- Insertar registros en Support_and_Customer_Service
INSERT INTO Support_and_Customer_Service (ID_player, problem_category, problem_description, priority, ticket_status) VALUES
(1, 'Login Issue', 'Unable to log in.', 'High', 'Open'),
(2, 'Payment Problem', 'Transaction failed.', 'Medium', 'In Progress'),
(3, 'Bug Report', 'Character is stuck.', 'Low', 'Resolved'),
(4, 'Gameplay', 'Need help with quest.', 'Medium', 'Closed'),
(5, 'Account', 'Forgot password.', 'High', 'Open'),
(6, 'Feedback', 'Suggestions for improvement.', 'Low', 'In Progress'),
(7, 'Technical', 'Game crashes on startup.', 'High', 'Open'),
(8, 'Billing', 'Incorrect charges.', 'Medium', 'Resolved'),
(9, 'Gameplay', 'Quest not showing.', 'Low', 'Closed'),
(10, 'Account', 'Update email address.', 'Medium', 'Open');

-- Insertar registros en Financial_Transactions
INSERT INTO Financial_Transactions (ID_player, transaction_type, amount, currency, payment_method, transaction_status) VALUES
(1, 'Deposit', 50.00, 'USD', 'Credit Card', 'Completed'),
(2, 'Purchase', 20.00, 'USD', 'PayPal', 'Completed'),
(3, 'Deposit', 30.00, 'USD', 'Bank Transfer', 'Pending'),
(4, 'Purchase', 15.00, 'USD', 'Credit Card', 'Completed'),
(5, 'Deposit', 40.00, 'USD', 'Debit Card', 'Failed'),
(6, 'Purchase', 10.00, 'USD', 'PayPal', 'Completed'),
(7, 'Deposit', 60.00, 'USD', 'Credit Card', 'Completed'),
(8, 'Purchase', 25.00, 'USD', 'Bank Transfer', 'Pending'),
(9, 'Deposit', 70.00, 'USD', 'Debit Card', 'Completed'),
(10, 'Purchase', 5.00, 'USD', 'Credit Card', 'Completed');

-- Insertar registros en Achievements
INSERT INTO Achievements (achievement_name, achiev_description, rewards, difficulty_level) VALUES
('First Blood', 'Win your first fight.', '100 XP', 1),
('Quest Master', 'Complete 10 quests.', '500 XP', 2),
('Warrior of the Year', 'Win 50 fights.', '2000 XP', 3),
('Explorer', 'Discover all zones.', '300 XP', 2),
('Treasure Hunter', 'Find 5 rare items.', '400 XP', 3),
('Master Trader', 'Make 10 transactions.', '200 XP', 2),
('Champion', 'Achieve level 10 with a character.', '1000 XP', 4),
('Team Player', 'Join a guild.', '150 XP', 1),
('Pioneer', 'Complete a quest within a day.', '300 XP', 3),
('Strategist', 'Win a fight without losing health.', '500 XP', 4);

-- Insertar registros en Achiev_Players
INSERT INTO Achiev_Players (ID_achievement, ID_player) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 4),
(6, 5),
(1, 6),
(2, 7),
(3, 8),
(4, 9);

-- Insertar registros en Quests
INSERT INTO Quests (quest_name, quest_description, reward, level_required) VALUES
('The Lost Sword', 'Find the lost sword in the ancient ruins.', '500 Gold', 1),
('Dragon Slaying', 'Defeat the dragon in the mountains.', '1000 Gold', 5),
('Rescue the Princess', 'Save the princess from the castle.', '1500 Gold', 3),
('Treasure Hunt', 'Find the hidden treasure in the forest.', '200 Gold', 2),
('Monster Hunt', 'Eliminate 10 monsters in the area.', '300 Gold', 1),
('Collect Herbs', 'Gather 20 herbs for the alchemist.', '100 Gold', 1),
('Guild Wars', 'Participate in the guild wars.', '800 Gold', 4),
('The Great Escape', 'Help the prisoner escape.', '400 Gold', 3),
('The Haunted House', 'Investigate the haunted house.', '600 Gold', 2),
('The Ancient Prophecy', 'Uncover the secrets of the prophecy.', '900 Gold', 4);

-- Insertar registros en Players_Quests
INSERT INTO Players_Quests (ID_player, ID_quest, status) VALUES
(1, 1, 'Completed'),
(1, 2, 'In Progress'),
(2, 1, 'Completed'),
(2, 3, 'Not Started'),
(3, 4, 'Completed'),
(4, 2, 'In Progress'),
(5, 5, 'Not Started'),
(6, 6, 'Completed'),
(7, 7, 'In Progress'),
(8, 8, 'Not Started');

-- Insertar registros en Guilds
INSERT INTO Guilds (guild_name, ID_leader) VALUES
('Warriors Guild', 1),
('Mages Guild', 2),
('Rogue Brotherhood', 3),
('Clerics of Light', 4),
('Adventurers Alliance', 5),
('The Fellowship', 6),
('Guardians of the Realm', 7),
('The Hidden Order', 8),
('Order of the Dragon', 9),
('The Fellowship of the Ring', 10);

-- Insertar registros en Guild_Members
INSERT INTO Guild_Members (ID_guild, ID_player) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10);

-- Insertar registros en Virtual_Items
INSERT INTO Virtual_Items (ID_player, item_name, item_description, price, category) VALUES
(1, 'Healing Potion', 'Restores 50 health points.', 5.00, 'Potion'),
(2, 'Mana Potion', 'Restores 50 mana points.', 5.00, 'Potion'),
(3, 'Sword of Destiny', 'A powerful sword for heroes.', 150.00, 'Weapon'),
(4, 'Shield of Valor', 'Protects you in battle.', 100.00, 'Armor'),
(5, 'Ring of Strength', 'Increases strength by 10.', 75.00, 'Accessory'),
(6, 'Boots of Speed', 'Increases movement speed.', 50.00, 'Accessory'),
(7, 'Scroll of Fireball', 'Casts a powerful fireball.', 25.00, 'Spell'),
(8, 'Plate Armor', 'Heavy armor for warriors.', 200.00, 'Armor'),
(9, 'Bow of the Hunter', 'A bow for skilled archers.', 120.00, 'Weapon'),
(10, 'Staff of Wisdom', 'A staff that boosts intelligence.', 90.00, 'Weapon');

-- Insertar registros en Items_Used
INSERT INTO Items_Used (ID_character, ID_item) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(5, 8),
(6, 9),
(7, 10);

-- Insertar registros en Fights
INSERT INTO Fights (ID_character, enemy_name, result) VALUES
(1, 'Goblin', 'Win'),
(2, 'Troll', 'Lose'),
(3, 'Dragon', 'Win'),
(4, 'Bandit', 'Draw'),
(5, 'Wolf', 'Win'),
(6, 'Orc', 'Lose'),
(7, 'Vampire', 'Win'),
(8, 'Zombie', 'Draw'),
(9, 'Mage', 'Lose'),
(10, 'Knight', 'Win');

-- Insertar registros en Game_Sessions
INSERT INTO Game_Sessions (ID_character, duration, score) VALUES
(1, 30, 100),
(2, 45, 150),
(3, 60, 200),
(4, 25, 80),
(5, 35, 120),
(6, 50, 180),
(7, 40, 160),
(8, 55, 170),
(9, 20, 70),
(10, 15, 60);

-- Insertar registros en Audit_Support_Service
INSERT INTO Audit_Support_Service (ID_ticket, done_action, previous_status, new_status) VALUES
(1, 'Create', 'Open', 'In Progress'),
(2, 'Update', 'In Progress', 'Resolved'),
(3, 'Close', 'Resolved', 'Closed'),
(4, 'Create', 'Open', 'In Progress'),
(5, 'Update', 'Open', 'In Progress'),
(6, 'Close', 'In Progress', 'Resolved'),
(7, 'Create', 'Open', 'In Progress'),
(8, 'Update', 'Resolved', 'Closed'),
(9, 'Create', 'Open', 'In Progress'),
(10, 'Close', 'Open', 'Resolved');
