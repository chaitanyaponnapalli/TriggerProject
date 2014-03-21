trigger AccountDiscountTrigger on Account (before insert, before update) {

AccountDiscountClass accountDiscountClass = new AccountDiscountClass();

accountDiscountClass.discountCalculate(Opportunity.sObjectType);


}