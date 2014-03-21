public with sharing class BikesOrderMgmtQuoteHandler {
	
	 public void createHandler(Schema.sObjectType soType)

    {
    	
    	 List<Purchase_Order__c> bikeQuotesList = new List<Purchase_Order__c>();
    	 //Account account = new Account();
        for (SObject sObj : Trigger.new)

                {

                    BikesOrderMgmtQuoteBusiness.quotesBusinessLogic(bikeQuotesList,(Quote)sObj);

                }
       
      insert bikeQuotesList;
       
       


    }

}