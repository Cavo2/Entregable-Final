DROP DATABASE IF EXISTS first_task;
CREATE DATABASE first_task;
USE first_task;

-- Crear la tabla Players
CREATE TABLE Players (
    ID_player INT PRIMARY KEY AUTO_INCREMENT,
    player_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    pass VARCHAR(255) NOT NULL,
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Crear la tabla Characters
CREATE TABLE Characters (
    ID_character INT PRIMARY KEY AUTO_INCREMENT,
    ID_player INT,
    character_name VARCHAR(50) NOT NULL,
    character_level INT DEFAULT 1,
    experience INT DEFAULT 0,
    class VARCHAR(50),
    health INT DEFAULT 100,
    mana INT DEFAULT 100,
    creation_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Crear la tabla Player_Stats
CREATE TABLE Player_Stats (
    ID_stat INT PRIMARY KEY AUTO_INCREMENT,
    ID_player INT,
    total_playtime INT DEFAULT 0,  -- Total de tiempo jugado en minutos
    total_quests_completed INT DEFAULT 0,
    total_fights_won INT DEFAULT 0,
    total_fights_lost INT DEFAULT 0,
    FOREIGN KEY (ID_player) REFERENCES Players(ID_player)
);

-- Crear la tabla Support_and_Customer_Service
CREATE TABLE Support_and_Customer_Service (
    ID_ticket INT PRIMARY KEY AUTO_INCREMENT,
    ID_player INT,
    creation_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    problem_category VARCHAR(50),
    problem_description TEXT,
    priority ENUM('Low', 'Medium', 'High') NOT NULL,
    ticket_status ENUM('Open', 'In Progress', 'Resolved', 'Closed') NOT NULL,
    support_agent_ID INT,
    last_updated_date DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Crear la tabla Financial_Transactions
CREATE TABLE Financial_Transactions (
    ID_transaction INT PRIMARY KEY AUTO_INCREMENT,
    ID_player INT,
    transaction_type ENUM('Deposit', 'Purchase') NOT NULL,
    date_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10, 2),
    currency VARCHAR(10),
    payment_method VARCHAR(50),
    transaction_status ENUM('Pending', 'Completed', 'Failed') NOT NULL
);

-- Crear la tabla Achievements
CREATE TABLE Achievements (
    ID_achievement INT PRIMARY KEY AUTO_INCREMENT,
    achievement_name VARCHAR(100) NOT NULL,
    achiev_description TEXT,
    rewards TEXT,
    difficulty_level INT
);
-- Crear la tabla Achiev_Players
CREATE TABLE Achiev_Players (
    ID_achievement INT,
    ID_player INT,
    date_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (ID_achievement, ID_player, date_time)
);

-- Crear la tabla Quests
CREATE TABLE Quests (
    ID_quest INT PRIMARY KEY AUTO_INCREMENT,
    quest_name VARCHAR(100) NOT NULL,
    quest_description TEXT,
    reward TEXT,
    level_required INT
);
-- Crear la tabla Players_Quests
CREATE TABLE Players_Quests (
    ID_player INT,
    ID_quest INT,
    status ENUM('Not Started', 'In Progress', 'Completed') DEFAULT 'Not Started',
    PRIMARY KEY (ID_player, ID_quest),
    FOREIGN KEY (ID_player) REFERENCES Players(ID_player),
    FOREIGN KEY (ID_quest) REFERENCES Quests(ID_quest)
);

-- Crear la tabla Guilds
CREATE TABLE Guilds (
    ID_guild INT PRIMARY KEY AUTO_INCREMENT,
    guild_name VARCHAR(100) NOT NULL,
    creation_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    ID_leader INT,
    FOREIGN KEY (ID_leader) REFERENCES Players(ID_player)
);
-- Crear la tabla Guild_Members
CREATE TABLE Guild_Members (
    ID_guild INT,
    ID_player INT,
    join_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (ID_guild, ID_player),
    FOREIGN KEY (ID_guild) REFERENCES Guilds(ID_guild),
    FOREIGN KEY (ID_player) REFERENCES Players(ID_player)
);

-- Crear la tabla Virtual_Items
CREATE TABLE Virtual_Items (
    ID_item INT PRIMARY KEY AUTO_INCREMENT,
    ID_player INT,
    item_name VARCHAR(100) NOT NULL,
    item_description TEXT,
    price DECIMAL(10, 2),
    category TEXT
);
-- Crear la tabla Items_Used
CREATE TABLE Items_Used (
    ID_usage INT PRIMARY KEY AUTO_INCREMENT,
    ID_character INT,
    ID_item INT,
    usage_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_character) REFERENCES Characters(ID_character),
    FOREIGN KEY (ID_item) REFERENCES Virtual_Items(ID_item)
);

-- Crear la tabla Fights
CREATE TABLE Fights (
    ID_fight INT PRIMARY KEY AUTO_INCREMENT,
    ID_character INT,
    enemy_name VARCHAR(50),
    start_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    end_time DATETIME,
    result ENUM('Win', 'Lose', 'Draw'),
    FOREIGN KEY (ID_character) REFERENCES Characters(ID_character)
);

-- Crear la tabla Game_Sessions
CREATE TABLE Game_Sessions (
    ID_session INT PRIMARY KEY AUTO_INCREMENT,
    ID_character INT,
    start_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    end_time DATETIME,
    duration INT,  -- Duración en minutos
    score INT,
    FOREIGN KEY (ID_character) REFERENCES Characters(ID_character)
);

CREATE TABLE Audit_Support_Service (
    ID_audit INT PRIMARY KEY AUTO_INCREMENT,
    ID_ticket INT,
    done_action ENUM('Create', 'Update', 'Close') NOT NULL,
    change_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    previous_status ENUM('Open', 'In Progress', 'Resolved', 'Closed'),  -- Estado anterior del ticket
    new_status ENUM('Open', 'In Progress', 'Resolved', 'Closed'),  -- Nuevo estado del ticket
    FOREIGN KEY (ID_ticket) REFERENCES Support_and_Customer_Service(ID_ticket)
);




-- Asignaciones de Foreign Keys
ALTER TABLE Virtual_Items
ADD CONSTRAINT FK_VirtualItems_Players
FOREIGN KEY (ID_player) REFERENCES Players(ID_player);

ALTER TABLE Financial_Transactions
ADD CONSTRAINT FK_FinancialTransactions_Players
FOREIGN KEY (ID_player) REFERENCES Players(ID_player);

ALTER TABLE Achiev_Players
ADD CONSTRAINT FK_AchievPlayer_Achievements
FOREIGN KEY (ID_achievement) REFERENCES Achievements(ID_achievement);

ALTER TABLE Achiev_Players
ADD CONSTRAINT FK_AchievPlayer_Players
FOREIGN KEY (ID_player) REFERENCES Players(ID_player);

ALTER TABLE Support_and_Customer_Service
ADD CONSTRAINT FK_Support_Player
FOREIGN KEY (ID_player) REFERENCES Players(ID_player);

ALTER TABLE Players_Quests
ADD CONSTRAINT FK_PlayersQuests_Players
FOREIGN KEY (ID_player) REFERENCES Players(ID_player);

ALTER TABLE Players_Quests
ADD CONSTRAINT FK_PlayersQuests_Quests
FOREIGN KEY (ID_quest) REFERENCES Quests(ID_quest);

ALTER TABLE Fights
ADD CONSTRAINT FK_Fights_Characters
FOREIGN KEY (ID_character) REFERENCES Characters(ID_character);

ALTER TABLE Items_Used
ADD CONSTRAINT FK_ItemsUsed_Characters
FOREIGN KEY (ID_character) REFERENCES Characters(ID_character);

ALTER TABLE Items_Used
ADD CONSTRAINT FK_ItemsUsed_VirtualItems
FOREIGN KEY (ID_item) REFERENCES Virtual_Items(ID_item);

ALTER TABLE Guild_Members
ADD CONSTRAINT FK_GuildMembers_Guilds
FOREIGN KEY (ID_guild) REFERENCES Guilds(ID_guild);

ALTER TABLE Guild_Members
ADD CONSTRAINT FK_GuildMembers_Players
FOREIGN KEY (ID_player) REFERENCES Players(ID_player);
