trigger LeadCloneTrigger on Lead (after insert) {
    
    LeadCloneClass leadCloneClass = new LeadCloneClass();

leadCloneClass.leadCreateHandler(Lead.sObjectType);
    
    

}