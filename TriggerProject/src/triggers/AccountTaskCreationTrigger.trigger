trigger AccountTaskCreationTrigger on Account (after insert, after update) {



AccountTaskHandlerClass accountTaskHandlerClass = new AccountTaskHandlerClass();

accountTaskHandlerClass.createHandler(Account.sObjectType);

}//end trigger