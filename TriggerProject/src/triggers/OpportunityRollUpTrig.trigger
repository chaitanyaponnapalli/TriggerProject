trigger OpportunityRollUpTrig on Opportunity (after insert, after update, before delete) {

Double TotalAmount =0;
Set<Id> opportunityList = new Set<Id>();

//Iterating over the opportunities object and storing in list
for (Opportunity opportunity : Trigger.new) {

    if(opportunity.Amount != null) {
         System.debug('In first.........');
        opportunityList.add(opportunity.Id);
    }
    else
    {
        System.debug('In first else.........');
       opportunityList.add(opportunity.Id);
    }
}


 //Iterating over the parent opportunities and storing Id in list whose amount are not null
Set<Id> oppParent = new Set<Id>();
for(Opportunity opportunity1:[Select OpportunityRollup__c from Opportunity Where Id IN:opportunityList ]) {
    System.debug('In first bbbbbbbbbbb.........');
oppParent.add(opportunity1.OpportunityRollup__c);
}




List<Opportunity> opportunityforupdate = new List<Opportunity>();

//Iterating over the total opportunities
for(Opportunity c:[Select Id, Expected_Revenue__c from Opportunity where Id IN:oppParent ]) {

//List<Id> lstAllChildOpps = new List<Id>([select id from Opportunity where OpportunityRollUp__c = c.Id]);


//Iterating over the child oppurtunitites
 for(Opportunity c1:[Select Id, Amount from Opportunity where OpportunityRollup__c IN:oppParent]) {

    //Opportunity opp = c.Opportunity;        



     TotalAmount += c1.Amount;
     System.debug('The amount is..' +TotalAmount);
 

}
c.Expected_Revenue__c =TotalAmount ;
opportunityforupdate.add( c  );
}

update opportunityforupdate;

}