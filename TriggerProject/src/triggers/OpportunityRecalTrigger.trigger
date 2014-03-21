trigger OpportunityRecalTrigger on Opportunity (before insert, before update) {
    
    OpportunityDiscountClass opportunityDiscountClass = new OpportunityDiscountClass();

OpportunityDiscountClass.discountCalculate(Opportunity.sObjectType);

}