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
@isTest
private class SearchTestClass {

    static testMethod void myUnitTest() {
    	
    	 Date d = date.ValueOf('2014-01-10');
         Lead lead = new Lead(LastName = 'Ashish', Company = 'Espl', Status = 'Open - Not Contacted');
         insert lead;
        
         Account account = new Account(Name = 'BusinessAcount', Currency__c = 2000);
         insert account;
        
         Contact contact = new Contact(LastName = 'Akshay', Email = 'sashank@gmail.com', Phone = '919898989898');
         insert contact;
         
         Opportunity opportunity = new Opportunity(Name = 'Industrial', CloseDate = d, StageName = 'Prospecting', Amount= 500);
         insert opportunity;
         
         
         theController searchController = new theController();
         searchController.setSearchText('Akshay');
         searchController.doSearch();
         
         System.assertEquals(true, searchController.getContactValue());

       
       
        
    }
}