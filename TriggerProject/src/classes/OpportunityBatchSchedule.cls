global class OpportunityBatchSchedule implements Schedulable {
   global void execute(SchedulableContext sc) {
      OpportunityBatchRecord batchOppor = new OpportunityBatchRecord(); 
      database.executebatch(batchOppor);
   }
}