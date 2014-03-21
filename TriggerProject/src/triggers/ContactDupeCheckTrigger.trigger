trigger ContactDupeCheckTrigger on Contact (before insert, before update) {
    
    
    ContactDupeHandlerClass contactDupeHandlerClass = new ContactDupeHandlerClass();
    contactDupeHandlerClass.contactDupeHandler(Contact.sObjectType);
    
    //contactDupeHandlerClass.handlerTrigger();
    
    
}