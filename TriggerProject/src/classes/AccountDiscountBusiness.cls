public with sharing class AccountDiscountBusiness {
Integer currencyValue = 0;

public void accountBusinessLogic(List<Account> accountList,Account account){
 
	
		AccountDiscount__c accountDiscount = AccountDiscount__c.getValues('AccountDiscountValue');
		
		System.debug('In here..................');
		
		
		//discount = opportunityDiscount.DiscountPercent__c;
		
		//opportunity.ActualAmount__c = opportunity.Amount-(opportunity.Amount * (opportunityDiscount.DiscountPercent__c)/100);
		
		System.debug('The value of currency is: '+account.Currency__c);
		System.debug('The value in custom setting is: '+accountDiscount.AccDiscountPercent__c);
		if(account.Currency__c!=0)
		{
			System.debug('In the loop........');
			//currencyValue = (account.Currency__c*accountDiscount.AccDiscountPercent__c);
			account.Currency__c = account.Currency__c - (account.Currency__c*accountDiscount.AccDiscountPercent__c/100);
			//account.Currency__c = 300;
		}
		 	
	}
}