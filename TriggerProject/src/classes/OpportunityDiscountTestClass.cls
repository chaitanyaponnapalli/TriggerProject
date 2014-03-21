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
private class OpportunityDiscountTestClass {

    static testMethod void myUnitTest() {

       Date d = date.ValueOf('2014-01-10');
       Id profileId;
       profileId = Userinfo.getProfileId();
       Opportunity_Discount__c opportunityDiscountProf = Opportunity_Discount__c.getInstance(profileId);
       decimal ActualAmountVal = 500-(500 * (opportunityDiscountProf.DiscountPercent__c)/100);
	   Opportunity opportunity = new Opportunity(Name = 'Industrial', CloseDate = d, StageName = 'Prospecting', Amount= 500, ActualAmount__c=ActualAmountVal);
       insert opportunity;
       Opportunity opportunityTest = [select ActualAmount__c from Opportunity where id = :opportunity.Id];
       system.assertEquals(200.00,opportunityTest.ActualAmount__c);

    }
}