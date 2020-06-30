trigger LeadTrigger on Lead(after update){
 
   If(Trigger.isafter && Trigger.isUpdate){
      LeadTriggerHandler.handleAfterUpdate(trigger.new);
   }
}