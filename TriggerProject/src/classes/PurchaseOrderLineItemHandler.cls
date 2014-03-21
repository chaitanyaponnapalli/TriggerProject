public with sharing class PurchaseOrderLineItemHandler {


List<Purchase_order_LineItem__c> purchaseOrderItem = new List<Purchase_order_LineItem__c>(); 

 public void createHandler(List<Purchase_Order__c> purchaseOrderList)

  {
    	

    	PurchaseOrderLineItemBusiness.purchaseBusinessLogic(purchaseOrderItem,purchaseOrderList);
    	
        insert purchaseOrderItem;
    }



}