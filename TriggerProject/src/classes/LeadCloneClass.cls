public with sharing class LeadCloneClass {
	
	List<Lead> leadLists = new List<Lead>();
	LeadCloneBusiness leadCloneBusiness = new LeadCloneBusiness();
	
	public void leadCreateHandler(Schema.sObjectType soType){

	for (SObject sobj : Trigger.new) {
  	leadCloneBusiness.leadBusinessLogic(leadLists, (Lead)sobj);
  	
  	
  }
  
  insert leadLists;
		
	}

}