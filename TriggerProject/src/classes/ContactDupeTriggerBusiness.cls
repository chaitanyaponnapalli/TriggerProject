public with sharing class ContactDupeTriggerBusiness {

public static void contactDupeHandler(Contact contact,Map<String, Contact> contactMap){

String fullName = null;
boolean flagEmail;
boolean flagPhone;
boolean flagName;
ID contactId1, contactId2, contactId2A, contactId3;

    if (contact.Email !=null && contact.Phone!= null)
       {     
                contactMap.put(contact.Email, contact);
                contactMap.put(contact.Phone, contact);
            
             for (Contact contactNew : [SELECT Email,Id FROM Contact
                      WHERE Email IN :contactMap.KeySet()]){
        //Contact newContact = contactMap.get(contactNew.Email);
        //newContact.Email.addError('A Contact with this email '
          //                     +'address already exists.');
       if((contactNew.Email)!=null){
       flagEmail = true;
       
       }  
        contactId1 = contactNew.Id;
    }
    
          for (Contact contactNew : [SELECT Phone FROM Contact
                      WHERE Phone IN :contactMap.KeySet()]){
       // Contact newContact = contactMap.get(contactNew.Phone);
        //newContact.Phone.addError('A Contact with this Phone '
          //                     +'number already exists.');
     if((contactNew.Phone)!=null){
       flagPhone = true;
       
       }  
        
       
        
    }
     if(flagPhone == true && flagEmail == true){
     
     System.Debug('Email and phone matches here: ' +contactId1);
     contact.Contact__c = contactId1;
     
     }
       }
       
       else if(contact.Phone !=null && contact.FirstName!=null && contact.LastName!=null)
       {
       
       fullName = contact.FirstName+contact.LastName;
        contactMap.put(contact.Phone, contact);
        contactMap.put(fullName, contact);
        
        
           for (Contact contactNew : [SELECT Id,Phone FROM Contact
                      WHERE Phone IN :contactMap.KeySet() and Full_Name__c IN :contactMap.KeySet()]){
       // Contact newContact = contactMap.get(contactNew.Phone);
        //newContact.Phone.addError('A Contact with this Phone '
          //                     +'number already exists.');
    if((contactNew.Phone)!=null){
       flagPhone = true;
       
       } 
       
       contactId2 = contactNew.Id;
    }
    
    
       for (Contact contactNew : [SELECT LastName,FirstName FROM Contact
                      WHERE Full_Name__c IN :contactMap.KeySet()]){
       // Contact newContact = contactMap.get(contactNew.Phone);
        //newContact.Phone.addError('A Contact with this Phone '
          //                     +'number already exists.');
    
     if((contactNew.FirstName)!=null){
       flagName = true;
       
       } 
       
       contactId2A = contactNew.Id;
       
    }
    
     if(flagPhone == true && flagName == true){
     
     System.Debug('In the phone and name block. With phone value as: '+fullName+' and Id as: '+contactId2+ ' and Id2A as: '+contactId2A);
     
    // if(contactId2A == contactId2)
     contact.Contact__c = contactId2;
     
     }
        
       }
       
       else if(contact.Email!=null && contact.FirstName!=null && contact.LastName!=null)
       {
       
       fullName = contact.FirstName+contact.LastName;
        contactMap.put(contact.Email, contact);
        contactMap.put(fullName, contact);
        
        
           for (Contact contactNew : [SELECT Id,Email FROM Contact
                      WHERE Email IN :contactMap.KeySet() and Full_Name__c IN :contactMap.KeySet()]){
       // Contact newContact = contactMap.get(contactNew.Phone);
        //newContact.Phone.addError('A Contact with this Phone '
          //                     +'number already exists.');
    if((contactNew.Email)!=null){
       flagEmail = true;
       
       } 
       
       contactId3 = contactNew.Id;
    }
    
    
       for (Contact contactNew : [SELECT LastName,FirstName FROM Contact
                      WHERE Full_Name__c IN :contactMap.KeySet()]){
       // Contact newContact = contactMap.get(contactNew.Phone);
        //newContact.Phone.addError('A Contact with this Phone '
          //                     +'number already exists.');
    
     if((contactNew.FirstName)!=null){
       flagName = true;
       
       } 
       
       //contactId2A = contactNew.Id;
       
    }
    
     if(flagEmail == true && flagName == true){
     
     System.Debug('In the phone and name block. With phone value as: '+fullName+' and Id as: '+contactId2+ ' and Id2A as: '+contactId2A);
     
   
     contact.Contact__c = contactId3;
     
     }
        
       }
     
       
       
}


}