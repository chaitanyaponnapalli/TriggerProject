public with sharing class theController {
public String searchText;
List<List<SObject>> results;
List<Lead> leadList = new List<Lead>();
List<Contact> contactList = new List<Contact>();
List<Opportunity>opportunityList = new List<Opportunity>();
List<Account> accountList = new List<Account>();
public boolean listBool, contactBool, opporBool, accountBool;

boolean listValue, contactValue, opportunityValue, accountValue;


public String getSearchText() {
return searchText;
}
public void setSearchText(String s) {
searchText = s;
}
public List<Lead> getResults() {
return leadList;
}
public List<Contact> getContacts(){
return contactList;
}
public List<Opportunity> getOpportunities(){  
return opportunityList;  
}
public List<Account> getAccounts(){
return accountList;
}
   
   
   
   public Boolean getListValue(){
	if (leadList.size()>0)
	{
		listValue = true;
		return true;
	
	}
	
	return false;
	//listValue = true;
	
}

public boolean getContactValue(){
	if (contactList.size()>0)
	{
		contactValue = true;
		return true;
	}
	return false;
	
}

public boolean getOpportunityValue(){
	if (opportunityList.size()>0)
	{
		opportunityValue = true;
		return true;
	}
	return false;
	
}

public boolean getAccountValue(){
	if (accountList.size()>0)
	{
		accountValue = true;
		return true;
	}
	return false;
	
}
   
   
   
public PageReference doSearch() {
	 String strTest = '*' + searchText + '*';
		
		
if(searchText.contains(' ') || searchText.isNumeric() || searchText.length() < 2)
  {
            
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Please Enter Appropriate Value In Search Input Field.'));
            return null;
  }
		
		
		
else
 {
String serachQuery = 'FIND ' + '\'' +  strTest + '\'' + ' IN ALL FIELDS RETURNING Lead(Name), Contact(Name), Opportunity(Name),Account(Name)';
List<List<sObject>> results = search.query(serachQuery);	


leadList = new list<Lead>();
contactList = new list<Contact>();
opportunityList = new list<Opportunity>();
accountList = new list<Account>();

System.debug('lead: '+leadList.size()+' and: '+contactList.size()+' and: '+opportunityList.size());

if(results[0].size()>0 || results[1].size()>0 || results[2].size()>0 || results[3].size()>0)
        {
      
          leadList=((List<Lead>) results[0]);
          if(leadList.size()>0)
          {
            listBool=true;
          }
        
          contactList=((List<Contact>) results[1]);
           if(contactList.size()>0)
          {
            contactBool=true;
          }
          
         
          opportunityList=((List<Opportunity>) results[2]);
           if(opportunityList.size()>0)
          {
            opporBool=true;
          }
          
          
          
          accountList=((List<Account>) results[3]);
          if(accountList.size()>0)
          {
             accountBool=true;
          }
          
        }
        
        else{
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Please Enter Appropriate Value In Search Input Fields'));
        
            return null;
        }
           
          return null ;
        }


}   
}