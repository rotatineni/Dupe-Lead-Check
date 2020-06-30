# Dupe-Lead-Check

1. LeadDeDupeTrigger - To identify duplicate Leads based on Email before insert and update

2. LeadTrigger.trigger - Trigger invoking LeadTriggerHandler

3. LeadTriggerHandler - Handler Class invoked by LeadTrigger to run after update upon conversion to identify any other Leads with same email and set their Status to Disqualified.
