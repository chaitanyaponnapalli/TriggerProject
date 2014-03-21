@RestResource(urlMapping='/Lead/*')
global with sharing class LeadRestClass {
@HttpPost
    global static msgDisplay doPostLead(String firstName, String lastName, String phone, String email, String company) {
       RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        Lead lead = new Lead();
        lead.FirstName = firstName;
        lead.Phone = phone;
        lead.Email = email;
        lead.LastName = lastName;
        lead.Company = company;
        try{
        	insert lead;
        	return new msgDisplay('isSuccess',lead.id,'True');
        }
        
        catch(Exception excep){
        	return new msgDisplay(excep.getMessage(),'', 'False');
        }
        
        
    }
    
    
    @HttpDelete
    global static msgDisplay doDelete() {
        try{
       RestRequest req = RestContext.request;
       RestResponse res = RestContext.response;
       
       String firstNameVal = RestContext.request.params.get('firstName');
	   String lastNameVal = RestContext.request.params.get('lastName');
	   String phoneVal = RestContext.request.params.get('phone');
	   String emailVal = RestContext.request.params.get('email');

       List<Lead> leadList = [SELECT Id FROM Lead WHERE FirstName = :firstNameVal and LastName = :lastNameVal and Phone = :phoneVal and Email = :emailVal];

        delete leadList;
        return new msgDisplay('isSuccess',leadList[0].Id,'True');
        	
        }
        catch(Exception exceptionVal){
        	return new msgDisplay(exceptionVal.getMessage(),'','False');
        }
        
    }  	
    
    
    @HttpPatch
    global static msgDisplay doPostUpdate(String firstName, String lastName, String phone, String email, String company) {
       RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
       Lead leadList = [SELECT Email, Phone, LastName FROM Lead WHERE FirstName = :firstName and LastName = :lastName];
       leadList.Email = email;
       leadList.Phone = phone;
        try{
        	update leadList;
        	return new msgDisplay('isSuccess',leadList.id,'True');
        }
        
        catch(Exception excep){
        	return new msgDisplay(excep.getMessage(),'', 'False');
        }
        
        
    }
    
    
    
    
    
     global with sharing class msgDisplay
    {
     global String isSuccess;
     global String jId;
     global String jStatus;
     
     global msgDisplay(String isSuccess, String jId, String jStatus){
      this.isSuccess = isSuccess;
      this.jId = jId;
      this.jStatus = jStatus;  
     }
    }
   
    
}