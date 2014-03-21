trigger PurchaseOrderLineItem on Purchase_Order__c(after insert) {

PurchaseOrderLineItemHandler purchaseOrderLineItemHandler = new PurchaseOrderLineItemHandler();

List<Purchase_Order__c> purchaseOrderList = new List<Purchase_Order__c>();
//purchaseOrderList.add(trigger.new);

purchaseOrderLineItemHandler.createHandler(trigger.new); 

}