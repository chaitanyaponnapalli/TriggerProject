public with sharing class AccountTaskHandlerClass {
 
 public void createHandler(Schema.sObjectType soType)

    {
    	
    	 List<Task> taskLists = new List<Task>();
    	 //Account account = new Account();
        for (SObject sObj : Trigger.new)

                {

                    AccountBusinessLogic.accountCreationLogic((Account)sObj,taskLists);

                }
       
      insert taskLists;
       
       


    }
 
 
 
}