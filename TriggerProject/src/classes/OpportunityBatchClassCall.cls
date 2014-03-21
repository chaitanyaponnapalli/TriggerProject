public with sharing class OpportunityBatchClassCall {
	
	public void opportunityBatchMethod(){
	
OpportunityBatchRecord reassign = new OpportunityBatchRecord();
//reassign.query = 'SELECT Id, IsAggregated__c,Amount FROM Opportunity WHERE IsAggregated__c == false';
//reassign.email='anakin.xuaser@gmail.com';
ID batchprocessid = Database.executeBatch(reassign);
	}
}