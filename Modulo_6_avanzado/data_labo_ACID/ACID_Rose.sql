/*
ACID transactions son comandos que se cumplen todos al mismo tiempo o no se cumple ninguno.
Si ocurre algun error, se detiene el proceso y se vuelve el tiempo atras con respecto a todos los cambios que se hicieron hasta el momento del error, se hace rollback.
*/
DROP PROCEDURE IF EXISTS TRANSACTION_ROSE;
DELIMITER //
CREATE PROCEDURE TRANSACTION_ROSE()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    START TRANSACTION;
    UPDATE BankAccounts
    SET Balance = Balance-200
    WHERE AccountName = 'Rose';

    UPDATE BankAccounts
    SET Balance = Balance+200
    WHERE AccountName = 'Shoe Shop';

    UPDATE ShoeShop
    SET Stock = Stock-1
    WHERE Product = 'Boots';

    COMMIT;
END //

DELIMITER ;

/*
Si no estuviera la condicion de exit handler, no se haria rollback sobre los cambios efectuados en el database.

*/
DROP PROCEDURE IF EXISTS TRANSACTION_sin_rollback;
DELIMITER //
CREATE PROCEDURE TRANSACTION_sin_rollback()
BEGIN
    UPDATE BankAccounts
    SET Balance = Balance+200
    WHERE AccountName = 'Shoe Shop';

    UPDATE ShoeShop
    SET Stock = Stock-1
    WHERE Product = 'Boots';
    
    UPDATE BankAccounts
    SET Balance = Balance-200
    WHERE AccountName = 'Rose';
    
    UPDATE ShoeShop
    SET Stock = Stock-1
    WHERE Product = 'Brogues';
END //

DELIMITER ;

/*
Efectivamente los comandos de update del shoe shop y del stock de botas se corrieron sin problemas, y los cambios se efecutaron, pero no se pudo correr
el comando de quitarle a Rose 200 euros, por lo que ese comando no se corrio (ni todos los siguientes), pero los anteriores si, y estos efectuaron 
cambios en el database que no fueron rolleadosback, pues no tenemos ese error handler.
*/
