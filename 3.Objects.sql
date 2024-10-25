-- Objects creation

USE first_task;

-- Vista 1: Visualizador de 3 items mas caros del juego

DROP VIEW IF EXISTS Player_Items_View;

CREATE VIEW Player_Items_View AS 
SELECT
    vi.Item_Name, 
    vi.Description, 
    vi.Price, 
    vi.Category,
    p.Name,
    p.ID_Player
FROM
	Players p 
LEFT JOIN
	Virtual_Items vi ON p.ID_Player = vi.ID_Player
ORDER BY -- Ordenar los precios de los items y mostrar los 3 mas caros
	vi.Price DESC
LIMIT 3;

-- Vista 2: Resumen de la actividad económica de los ítems virtuales

DROP VIEW IF EXISTS Item_Economic_Activity_View;

CREATE VIEW Item_Economic_Activity_View AS 
SELECT
	vi.Item_Name,
    COUNT( ft.ID_Transaction ) AS Transaction_Count, -- Contar el numero de transacciones del item
    SUM( ft.Amount ) AS Total_Revenue -- Sumar el numero de dinero recaudado
FROM
	Virtual_Items vi
LEFT JOIN
	Financial_Transactions ft ON vi.ID_Item = ft.ID_Player
GROUP BY
	vi.Item_Name
ORDER BY
	Total_Revenue DESC;

-- Vista 3: Resumen Financiero por Jugador

CREATE VIEW Player_Financial_Summary AS
SELECT 
    p.ID_player,
    p.name AS player_name,
    SUM(CASE WHEN ft.transaction_type = 'Deposit' THEN ft.amount ELSE 0 END) AS total_deposited,
    SUM(CASE WHEN ft.transaction_type = 'Purchase' THEN ft.amount ELSE 0 END) AS total_spent,
    COUNT(ft.ID_transaction) AS transaction_count
FROM 
    Players p
LEFT JOIN 
    Financial_Transactions ft ON p.ID_player = ft.ID_player
GROUP BY 
    p.ID_player;

-- Vista 4: Información de Jugadores y Sus Artículos Virtuales
    
CREATE VIEW Player_Virtual_Items AS
SELECT 
    p.ID_player,
    p.name AS player_name,
    p.email,
    p.registration_Date,
    COUNT(vi.ID_item) AS total_items,
    GROUP_CONCAT(CONCAT(vi.item_name, ' (', vi.category, ')') ORDER BY vi.price DESC SEPARATOR ', ') AS items_list,
    SUM(vi.price) AS total_value
FROM 
    Players p
LEFT JOIN 
    Virtual_Items vi ON p.ID_player = vi.ID_player
GROUP BY 
    p.ID_player;
    
-- Vista 5: Log de Transacciones Financieras

CREATE VIEW Financial_Transaction_Log AS
SELECT 
    ft.ID_transaction,
    p.name AS player_name,
    ft.transaction_type,
    ft.date_time,
    ft.amount,
    ft.currency,
    ft.payment_method,
    ft.transaction_status,
    CASE 
        WHEN ft.transaction_status = 'Completed' THEN 'Transaction Successful'
        WHEN ft.transaction_status = 'Pending' THEN 'Awaiting Confirmation'
        ELSE 'Transaction Failed'
    END AS transaction_message
FROM 
    Financial_Transactions ft
JOIN 
    Players p ON ft.ID_player = p.ID_player
ORDER BY 
    ft.date_time DESC;





-- Funcion 1: Total Gasto de jugador

DROP FUNCTION IF EXISTS Get_Total_Spending;

DELIMITER //
CREATE FUNCTION Get_Total_Spending( p_ID_Player INT )
RETURNS DECIMAL( 10, 2 ) DETERMINISTIC READS SQL DATA
BEGIN
	DECLARE total_spent DECIMAL( 10, 2 );
    
    SELECT SUM( Amount ) INTO total_spent -- Sumar todas las transacciones del jugador
    FROM Financial_Transactions
    WHERE ID_Player = p_ID_Player;
    
    RETURN total_spent;
END //
DELIMITER ;


-- Funcion 2: Análisis de gasto de jugador

DROP FUNCTION IF EXISTS Get_Average_Spending_Status;

DELIMITER //
CREATE FUNCTION Get_Average_Spending_Status( p_ID_Player INT )
RETURNS VARCHAR( 255 )
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE player_average DECIMAL( 10, 2 );
    DECLARE overall_average DECIMAL( 10, 2 );
    DECLARE status_message VARCHAR( 255 );

    SELECT AVG( Amount ) INTO player_average -- Calcular el gasto promedio del jugador
    FROM Financial_Transactions
    WHERE ID_Player = p_ID_Player;

    SELECT AVG( Amount ) INTO overall_average -- Calcular el gasto promedio general
    FROM Financial_Transactions;

    IF player_average > overall_average THEN -- Comparar el gasto promedio del jugador con el gasto promedio general
        SET status_message = 'This player spends more than overall';
    ELSEIF player_average < overall_average THEN
        SET status_message = 'This player spends less than overall';
    ELSE
        SET status_message = 'This player spends overall';
    END IF;

    RETURN status_message;  -- Retornar el mensaje final
END //
DELIMITER ;





-- Procedimiento 1: Permite actualizar ticket de soporte

DROP PROCEDURE IF EXISTS Update_Support_Ticket_Status;

DELIMITER //
CREATE PROCEDURE Update_Support_Ticket_Status(
    IN p_ID_Ticket INT,
    IN p_New_Status ENUM('Open', 'In Progress', 'Resolved', 'Closed')
)
BEGIN
    UPDATE Support_and_Customer_Service
    SET Ticket_Status = p_New_Status, Last_Updated_Date = NOW() -- Actualizar el status del ticket y establecer el ultimo tiempo de actualizacion al momento
    WHERE ID_Ticket = p_ID_Ticket;
END //
DELIMITER ;

-- Procedimiento 2: Registra una transacción en el sistema

 DROP PROCEDURE IF EXISTS Register_Transaction;

DELIMITER //
CREATE PROCEDURE Register_Transaction(
    IN p_ID_Player INT,
    IN p_Transaction_Type ENUM('Purchase', 'Refund'),
    IN p_Amount DECIMAL(10, 2),
    IN p_Currency VARCHAR(10),
    IN p_Payment_Method VARCHAR(50)
)
BEGIN
    DECLARE total_spent DECIMAL(10, 2);
    DECLARE player_exists INT;


    SELECT COUNT(*) INTO player_exists -- Verificar si el jugador existe
    FROM Players
    WHERE ID_Player = p_ID_Player;

    IF player_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El jugador no existe.';
    ELSEIF p_Amount <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El monto debe ser mayor que cero.';
    ELSE
        -- Registrar la transacción
        INSERT INTO Financial_Transactions (ID_Player, Transaction_Type, Date_Time, Amount, Currency, Payment_Method, Transaction_Status)
        VALUES (p_ID_Player, p_Transaction_Type, NOW(), p_Amount, p_Currency, p_Payment_Method, 'Completed');
    END IF;
END //
DELIMITER ;




-- Trigger 1: Valida que el monto no sea negativo antes de insertarse en la tabla de transacciones

DROP TRIGGER IF EXISTS Validate_Transaction_Amount;

DELIMITER //
CREATE TRIGGER Validate_Transaction_Amount
BEFORE INSERT ON Financial_Transactions
FOR EACH ROW
BEGIN
    IF NEW.Amount < 0 THEN -- Verificar que el monto no sea negativo
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El monto de la transacción no puede ser negativo.';
    END IF;
END //
DELIMITER ;




-- Trigger 2: Valida que el método de pago es válido para la tabla de transacciones.

DROP TRIGGER IF EXISTS Validate_Payment_Method;

DELIMITER //
CREATE TRIGGER Validate_Payment_Method
BEFORE INSERT ON Financial_Transactions
FOR EACH ROW
BEGIN
    DECLARE valid_method INT;

    -- Verificar si el método de pago es uno de los permitidos
    SELECT COUNT(*) INTO valid_method
    FROM (SELECT 'Credit Card' AS Method
          UNION ALL SELECT 'PayPal'
          UNION ALL SELECT 'Bank Transfer') AS AllowedMethods
    WHERE Method = NEW.Payment_Method;

    -- Si el método de pago no es válido, lanzar un error
    IF valid_method = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El método de pago no es válido.';
    END IF;
END //
DELIMITER ;
