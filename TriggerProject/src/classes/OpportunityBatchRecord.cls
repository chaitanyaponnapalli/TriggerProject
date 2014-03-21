global class OpportunityBatchRecord implements Database.Batchable<sObject>, Database.Stateful{

global double totalAmount = 0;
String str = 'Closed Won'; 
global double totalSize = 0;
global Database.querylocator start(Database.BatchableContext BC){
	String query = 'SELECT StageName, Expected_Revenue__c, IsAggregated__c, Amount FROM Opportunity where IsAggregated__c = true AND  StageName=\'' + str + '\'';
	
	
	
            return Database.getQueryLocator(query);
            
        }

global void execute(Database.BatchableContext BC, List<sObject> scope){
    List<Opportunity> opportunities = new List<Opportunity>();
system.debug('The boolean value is: ');
   for(sObject sobjectIter : scope){
   		    Opportunity opportunity = (Opportunity)sobjectIter;
            system.debug('The boolean value is: '+opportunity.IsAggregated__c);
            opportunity.IsAggregated__c = true;
            opportunity.Expected_Revenue__c = 3200;
            if(opportunity.Amount != null)
            totalAmount = totalAmount+opportunity.Amount;
            opportunities.add(opportunity);
           system.debug('The boolean value is: '+totalAmount);
        }
totalSize = opportunities.size();
 update opportunities; 
   
}     
global void finish(Database.BatchableContext BC){
	String email = 'anakin.xuaser@gmail.com';
Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
system.debug('Start DateTime: '+CronTrigger.StartTime+' End DateTime: '+CronTrigger.EndTime+' Number of Opportunities Closed Won Today: '+totalSize+' Total Opportunity Amount for today: '+totalAmount);
mail.setToAddresses(new String[] {email});
//mail.setReplyTo('batch@acme.com');
mail.setSenderDisplayName('Batch Processing');
mail.setSubject('Daily Opportunity Amount Aggregator Job Complete');
mail.setPlainTextBody('Start DateTime: '+CronTrigger.StartTime+' End DateTime: '+CronTrigger.EndTime+' Number of Opportunities Closed Won Today: '+totalSize+' Total Opportunity Amount for today: '+totalAmount);

Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
}
}