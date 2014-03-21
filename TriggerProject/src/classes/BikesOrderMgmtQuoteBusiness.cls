public with sharing class BikesOrderMgmtQuoteBusiness {


public static void quotesBusinessLogic(List<Purchase_Order__c> purchaseList,Quote quote){
 
 system.debug('quote status is: '+quote.Status+'*************************');
 
	if(quote.Status == 'Accepted'){
	 system.debug('In here*****************************');
		
		purchaseList.add(new Purchase_Order__c(Name = 'Srinivas Purchase Order',
												Opportunity__c = quote.OpportunityId,
												Quote__c = quote.Id));
		
	}
		 	
	}

}