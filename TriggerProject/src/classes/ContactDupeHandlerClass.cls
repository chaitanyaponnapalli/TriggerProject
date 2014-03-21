public with sharing class ContactDupeHandlerClass {
	
	public void contactDupeHandler(Schema.sObjectType sobj){
	
	 Map<String, Contact> contactMap =new Map<String, Contact>();
    for (Sobject objectList : System.Trigger.new){
    	
    	ContactDupeTriggerBusiness.contactDupeHandler((Contact)objectList, contactMap);
    	
    	
    }
    
  
    
    
        // Using a single database query, find all the leads in
 
    // the database that have the same phone number as any
    
    // of the leads being inserted or updated.
    
    
    
	
	}
	

}