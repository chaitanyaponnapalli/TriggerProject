public with sharing class OpportunityDiscountClass {
List<Opportunity> oppLists = new List<Opportunity>();
	OpportunityDiscountBusiness opportunityDiscountBusi = new OpportunityDiscountBusiness();
	
	public void discountCalculate(Schema.sObjectType soType){

	for (SObject sobj : Trigger.new) {
  
  	opportunityDiscountBusi.opportunityBusinessLogic(oppLists, (Opportunity)sobj);
  	
  }
  
  insert oppLists;
		
	}



}