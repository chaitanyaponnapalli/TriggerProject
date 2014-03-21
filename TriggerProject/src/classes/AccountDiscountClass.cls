public with sharing class AccountDiscountClass {
List<Account> accountLists = new List<Account>();
	AccountDiscountBusiness accountDiscountBusiness = new AccountDiscountBusiness();
	
	public void discountCalculate(Schema.sObjectType soType){

	for (SObject sobj : Trigger.new) {
  
  	accountDiscountBusiness.accountBusinessLogic(accountLists, (Account)sobj);
  	
  }
  
  insert accountLists;
		
	}
}