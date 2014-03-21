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
@isTest(SeeAllData=True)
private class LeadRestTestClass {

  static testMethod void testDoGet() {
  	    
    RestRequest req = new RestRequest(); 
    RestResponse res = new RestResponse();
 
    // pass the req and resp objects to the method		 
    req.requestURI = 'https://ap1.salesforce.com/services/apexrest/Lead/*';  
    req.httpMethod = 'POST';
    RestContext.request = req;
    RestContext.response = res;
    	
    LeadRestClass.msgDisplay results = LeadRestClass.doPostLead('ABC','last','9898989898','email@gmail.com','eternus');
    
    System.assertEquals('isSuccess', results.isSuccess);
    System.assertEquals('10', results.jId);
    System.assertEquals('True', results.jStatus);
    
    RestRequest req1 = new RestRequest(); 
    RestResponse res1 = new RestResponse();
    
    req1.requestURI = 'https://ap1.salesforce.com/services/apexrest/Lead/?';  
    req1.httpMethod = 'DELETE';
    RestContext.request = req1;

 	//req1.addParameter('Vibhor', 'Goel', '919898989898','vibhor@gmail.com');
    	
    	
    LeadRestClass.msgDisplay resultsDelete = LeadRestClass.doDelete();
    
    
    
    System.assertEquals('isSuccess', resultsDelete.isSuccess);
    System.assertEquals('10', resultsDelete.jId);
    System.assertEquals('True', resultsDelete.jStatus);

 
  }
  

    
}