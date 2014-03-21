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
private class OpportunityRollupTriggerTest {

    static testMethod void myUnitTest() {
      
      Date d = date.ValueOf('2013-12-10');
      
      Opportunity opportunityRollupId = new Opportunity(Name = 'Krish', CloseDate = d, StageName = 'Qualification');
      insert opportunityRollupId;
      
      Opportunity opportunityA = new Opportunity(Name = 'Murali', CloseDate = d, StageName = 'Qualification', OpportunityRollup__c = opportunityRollupId.Id, Amount = 50);
      insert opportunityA;
      
      Opportunity opportunityB = new Opportunity(Name = 'Karthik', CloseDate = d, StageName = 'Qualification', OpportunityRollup__c = opportunityRollupId.Id, Amount = 100);
      insert opportunityB;
      
      Opportunity opportunityC = new Opportunity(Name = 'Prasad', CloseDate = d, StageName = 'Qualification', OpportunityRollup__c = opportunityRollupId.Id, Amount = 150);
      insert opportunityC;

      Opportunity opportunityTest = [select Expected_Revenue__c from Opportunity where Id = :opportunityRollupId.Id];
      System.assertEquals(300, opportunityTest.Expected_Revenue__c);
      
      
      
    }
}