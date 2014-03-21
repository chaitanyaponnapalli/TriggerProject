/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest(SeeAllData=true)
private class accountBusinessTestClass {

    static testMethod void myUnitTest() {
        
        
        Account account = new Account(Name = 'BusinessAcount', Currency__c = 2000);
        AccountDiscount__c accountDiscount = AccountDiscount__c.getValues('AccountDiscountValue');
	    account.Currency__c = account.Currency__c - (account.Currency__c*accountDiscount.AccDiscountPercent__c/100);
	    insert account;
	    Account accountTest = [select Currency__c from account where id = :account.Id];
	    system.assertEquals(2000, accountTest.Currency__c);
		
    }
}