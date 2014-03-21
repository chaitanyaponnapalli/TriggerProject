public with sharing class ExAccountController {

private string accountID = '';
  public Account accountItem{get;set;}
 
  public ExAccountController(){
    //Constructor
    list<account> accountList = new list<account>();
    accountID = System.currentPageReference().getParameters().get('aId');  
    accountList = [Select ID, Name From Account Where ID = :accountID];
    if(accountList.isEmpty() == false){
    	system.debug('The accountList[0] is: '+accountList[0]);
      accountItem = accountList[0];
    }else{
      ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.ERROR, 'The Account ID is invalid.');
      ApexPages.addMessage(msg);
    }
  }
 
  public pageReference cancelAction(){
  	system.debug('In cancel************');
    return returnToOrigination();
  }
 
  public pageReference saveItem(){
    //Do something to the Account object and then update it
    //update accountItem;
    system.debug('In save***********');
    return returnToOrigination();
  }
 
  private pageReference returnToOrigination(){
    PageReference page = new PageReference('/' + accountID);
    page.setRedirect(true);
    system.debug('page is: ' +page.getUrl());
    return page;
  }
}