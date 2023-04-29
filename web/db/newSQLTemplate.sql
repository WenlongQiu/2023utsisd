/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  xiaobing
 * Created: 27 Apr 2023
 */

CREATE TABLE CARDINFO_T(
    CARD_ID INT NOR NULL PRIMARY KEY GENERATE ALWAYS AS IDENTITY (START WITH 100, INCREMENT BY 1),
    CARDHOLDER VARCHAR(255),
    CARD_EXP VARCHAR(255),
    CVV VARCHAR(255),
    PAYMENT_ID INT NOT NULL,
    FOREIGN KEY (PAYMENT_ID) REFERENCES PAYMENT(PAYMENT_ID)
);