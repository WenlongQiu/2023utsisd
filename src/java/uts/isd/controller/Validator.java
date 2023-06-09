/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.controller;

import java.io.Serializable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpSession;
/**
 *
 * @author xiaobing
 */


   public class Validator implements Serializable{ 
 
   private String cardNoPattern = "^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|6(?:011|5[0-9]{2})[0-9]{12}(?:2131|1800|35\\d{3})\\d{11})$";      
   private String namePattern = "([A-Z][a-z]+[\\s])+[A-Z][a-z]*"; 
   private String expPattern = "^(0[1-9]|1[0-2])\\/?([0-9]{2})$";       
   private String CVVPattern = "^[0-9]{3,4}$";       
              
   public Validator(){    }       

   public boolean validate(String pattern, String input){       
      Pattern regEx = Pattern.compile(pattern);       
      Matcher match = regEx.matcher(input);       
      return match.matches(); 
   }       
 
   
   public boolean validateCardNo(String cardNo){                       
      return validate(cardNoPattern,cardNo);   
   }
       
   public boolean validateName(String name){
      return validate(namePattern,name); 
   }    
  
   
   public boolean validateExp(String exp){
      return validate(expPattern,exp); 
   }   
   
   public boolean validateCVV(String cvv){
      return validate(CVVPattern,cvv); 
   }  
   public void clear(HttpSession session){
       session.setAttribute("cardErr", "");
       session.setAttribute("nameErr", "");
       session.setAttribute("expErr", "");
       session.setAttribute("cvvErr", "");
   }
}