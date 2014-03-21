public with sharing class OpportunityDiscountBusiness {

String profileId = null;
//number discount = 0;
public void opportunityBusinessLogic(List<Opportunity> oppLists,Opportunity opportunity){
		
   
	
	profileId = Userinfo.getProfileId();
		
		System.debug('The profileId is :'+profileId+' and the userId is: '+Userinfo.getUserId());
		
		Opportunity_Discount__c opportunityDiscount = Opportunity_Discount__c.getInstance(Userinfo.getUserId());
		
		Opportunity_Discount__c opportunityDiscountProf = Opportunity_Discount__c.getInstance(Userinfo.getProfileId());
		
		System.debug('The value of discount is: '+opportunityDiscount.DiscountPercent__c);
		
		/* if(lead.Status == 'Open - Not Contacted'){
        	 
        	 //crate a new lead after checking the status
        	 leadLists.add(new Lead(
                         //whatid=Trigger.new[lead].Id,
                         Status = 'Working – Contacted',
                         LastName = lead.LastName,
                         FirstName = lead.FirstName,
                         Company = lead.Company
                         
                         ) ) ;
        }*/
		
		//discount = opportunityDiscount.DiscountPercent__c;
		
		opportunity.ActualAmount__c = opportunity.Amount-(opportunity.Amount * (opportunityDiscountProf.DiscountPercent__c)/100);
	}
}