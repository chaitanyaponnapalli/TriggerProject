public with sharing class AccountBusinessLogic {
	
	public static void accountCreationLogic(Account soType, List<Task> taskLists){
		

        //Iterating over the loop and creating a new task and inserting in list
            taskLists.add(new Task(
                         whatid=soType.Id,
                         OwnerId=soType.OwnerId,
                         Subject= 'meeting with '+soType.Name
                         ) ) ;

        
	}

}