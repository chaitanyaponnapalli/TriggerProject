public with sharing class CompaignExtension {	

    public CompaignExtension(CustomPickListDemo controller) {

    }


 public CompaignExtension(ApexPages.StandardController controller) {
       
    }

 Campaign currentrecord = new Campaign();
     
    public Campaign getcurrentrecord(){
         currentrecord = [select Id,
                Name,
                Type,
                StartDate,
                NumberSent,
                EndDate,
                Status,
                OwnerId,
                ParentId,
                             CreatedById,
                             LastModifiedById,
                             Description
                          from Campaign 
                          where Id= :ApexPages.currentPage().getParameters().get('Id')];
        return currentrecord;
     }
     public void setcurrentrecord(Campaign currentrecord){
        this.currentrecord=currentrecord;
     }
     public PageReference redirectoEdit()
     {
       if(currentrecord!=null)
       {
       PageReference editPage = new PageReference('/'+currentrecord.Id+'/e?retURL=%' + currentrecord.Id);
       editPage.setRedirect(true);
         return editPage;
       }
      else{
                  PageReference errPage = new PageReference('/apex/editFixtureOrderError');
                  errPage.setRedirect(true);
                  return errPage;
 
              }

         return null; 
     }
     public PageReference redirectoClone()
     {
      if(currentrecord!=null)
       {
       PageReference clonePage = new PageReference('/'+currentrecord.Id+'/e?clone=1—retURL=' + currentrecord.Id);
       clonePage.setRedirect(true);
         return clonePage;
       }
      

         return null; 
     }
     
}