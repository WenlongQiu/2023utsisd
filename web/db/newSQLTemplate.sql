/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
FOREIGN KEY (ORDER_ID) REFERENCES PAYMENT(PAYMENT_ID)
 * Author:  xiaobing
 * Created: 27 Apr 2023
 */

CREATE TABLE PAYMENT_T(
    PAYMENT_ID INT NOR NULL PRIMARY KEY GENERATE ALWAYS AS IDENTITY (START WITH 100, INCREMENT BY 1),
    CARD_NO VARCHAR(20),
    CARDHOLDER VARCHAR(50),
    CARD_EXP VARCHAR(10),
    CVV VARCHAR(10),
    STATUS VARCHAR(20),
    PAYMENT_METHOD VARCHAR(20),
    AMOUNT DOUBLE,
    PAID_DATE DATE,
    ORDER_ID INT NOT NULL,
    CUSTOMER_ID INT NOT NULL,
    
);