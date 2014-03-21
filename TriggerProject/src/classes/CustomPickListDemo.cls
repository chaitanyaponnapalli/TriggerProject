public with sharing class CustomPickListDemo {

    public CustomPickListDemo() {

    }

    
    Public String SelectedCity{get;set;}

  
    List<Campaign> campaignList= new List<Campaign>();
   
    public CustomPickListDemo(ApexPages.StandardController controller) {

    }
    
    public List<SelectOption> getCity() {
        List<SelectOption> CityOptions = new List<SelectOption>();
        CityOptions.add(new SelectOption('Recently Modified','Recently Modified'));
        CityOptions.add(new SelectOption('All Campaigns','All Campaigns'));
        CityOptions.add(new SelectOption('All Active Campaigns','All Active Campaigns'));
        CityOptions.add(new SelectOption('My Active Campaigns','My Active Campaigns'));
        CityOptions.add(new SelectOption('Inactive Campaigns','Inactive Campaigns'));
        return CityOptions ;
        }
        
        public String getSelectedCity() {
            return SelectedCity;
        }
            
        public void setSelectedCity(String camp) {
            this.SelectedCity = SelectedCity;
        }
       
       public List<Campaign> getcampaignList() {
            return campaignList;
        }
            
        public void setcampaignList(List<Campaign> campaignList) {
            this.campaignList = campaignList;
        }
       
        public void GO() {
        Id userId = UserInfo.getUserId();
         
       if(SelectedCity!=null)
         {
          if(SelectedCity=='Inactive Campaigns')
          {
            campaignList=[select Name,Status,Type,StartDate 
                          from Campaign where IsActive =false
                          order by StartDate desc];
          }
          else if(SelectedCity=='All Campaigns')
          {
           campaignList=[select Name,Status,Type,StartDate 
                          from Campaign 
                          order by StartDate desc];
          }
             else if(SelectedCity=='All Active Campaigns')
          {
           campaignList=[select Name,Status,Type,StartDate 
                          from Campaign where IsActive=true
                          order by StartDate desc];
          }
          else if(SelectedCity=='My Active Campaigns')
          {
          List<Campaign> campaignListTemp=new List<Campaign>();
              campaignListTemp=[select Name,Status,Type,StartDate,OwnerId 
                          from Campaign where IsActive=true
                          order by StartDate desc];
             for(Campaign obj:campaignListTemp)
                          {
                           if(obj.OwnerId==userId)
                              campaignList.add(obj);
                          }
          }
          else 
          {
            campaignList=[select Name,Status,Type,StartDate 
                          from Campaign 
                          order by LastModifiedDate desc];
          }
         }
         
       
        
    }
    
      public PageReference redirect ()
        {
         PageReference pageRef = new PageReference('/apex/CompaignManagement');
         pageRef.setRedirect(true);
         return pageRef;
        }
        
         
    }