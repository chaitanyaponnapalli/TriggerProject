public with sharing class PurchaseOrderLineItemBusiness {


public static void purchaseBusinessLogic(List<Purchase_order_LineItem__c> purchaseItemList, List<Purchase_Order__c> purchaseList){

List<Quote> valuesList = new List<Quote>();

decimal quantityVal = 0.0;



valuesList = [Select q.Id,(Select quoteItem.Id, quoteItem.Quantity, quoteItem.UnitPrice, quoteItem.Discount From QuoteLineItems quoteItem) From Quote q WHERE q.OpportunityId =:purchaseList[0].Opportunity__c];

//List<QuoteLineItem> quoteItemList = new List<QuoteLineItem>();

//quoteLineList = [Select (Select p.Product2Id From PricebookEntry p) From QuoteLineItem q where q.]
	
	for(Quote quoteList: valuesList){
		
		for(QuoteLineItem quoteLineList: quoteList.QuoteLineItems){
			
			
			List<OpportunityLineItem> quoteItemList = new List<OpportunityLineItem>();

			//quoteLineList = [Select qlIt.Id, (Select p.Product2Id From PricebookEntry p) From QuoteLineItem qlIt];
			
			quoteItemList = [Select PricebookEntry.Product2Id, OpportunityId From OpportunityLineItem WHERE OpportunityId = :purchaseList[0].Opportunity__c];
			
			system.debug('size of Quote is: '+valuesList.size());
			system.debug('size of QuoteItemList is: '+quoteItemList.size());
			
			//quantityVal = (quoteLineList.Quantity);
	        //system.debug('The quantity is: '+quantityVal);
	        
	        purchaseItemList.add(new Purchase_order_LineItem__c(Purchase_Order_Id__c = purchaseList[0].Id,
	           													Total_Quantity__c = quoteLineList.Quantity,
	        													Actual_Price__c = quoteLineList.UnitPrice,
	        													Product__c = quoteItemList[0].PricebookEntry.Product2Id,
	        													DiscountPercent__c = 	quoteLineList.Discount));		
	        
			
		}
		
		
	}
	
	
	
	//List <Opportunity> opportunityVal = new List<Opportunity>();
	
	//opportunityVal = [Select Id,(Select (Select Product2Id From PricebookEntries) From Pricebook2) From Opportunity op];
	
		 	
	}

}