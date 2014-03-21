public with sharing class CampaignClassController {
  public List<String> selectOption {set;get;}
  
  public  String[] ps= new String[]{};
  public String[] getProfiles() 
  {
    return ps;
  }

  public void setProfiles(String[] ps) {
    this.ps = ps;
  }
  
  public List<SelectOption> getItems() {
  	System.Debug('In items............. ');
    List<SelectOption> op = new List<SelectOption>();
    op.add(new SelectOption('Recently Modified','Recently Modified'));
    op.add(new SelectOption('All Campaigns','All Campaigns'));
    op.add(new SelectOption('All Active Campaigns','All Active Campaigns'));
    op.add(new SelectOption('My Active Campaigns','My Active Campaigns'));
    op.add(new SelectOption('Inactive Campaigns','Inactive Campaigns'));
  
    return op;
  }
   public void fetchRecords()
   {
  
  System.Debug('The selected picklist value is: ');
  System.Debug('The selected picklist value is: '+ps);
 

 
   }
   
   public CampaignClassController(ApexPages.StandardController controller) {

    }

}