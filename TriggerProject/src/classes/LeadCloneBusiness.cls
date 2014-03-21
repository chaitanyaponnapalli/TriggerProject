public with sharing class LeadCloneBusiness {
	
	
	public void leadBusinessLogic(List<Lead> leadLists,Lead lead){
		
		 if(lead.Status == Label.LeadStatus){
        	 
        	 //crate a new lead after checking the status
        	 leadLists.add(new Lead(
                         //whatid=Trigger.new[lead].Id,
                         Status = Label.LeadStatus2,
                         LastName = lead.LastName,
                         FirstName = lead.FirstName,
                         Company = lead.Company
                         
                         ) ) ;
        }
	
		
	}
	 

}