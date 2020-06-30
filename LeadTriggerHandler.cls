public class LeadTriggerHandler{

  public static void handleAfterUpdate(List<Lead> leadList){
    UpdateStatusonDupes(leadList);
  }
    
 /**************** Begin - Method to identify dupe Leads based on Email of converted Lead and update their Status to Disqualified *****************/
   Public static void UpdateStatusonDupes(List<Lead> leadList){
    String ConvertingLeadEmail;
     for(Lead L : leadList){
       if(L.Email != null && L.Email !='' && L.IsConverted){
           ConvertingLeadEmail = L.Email;
           system.debug('Email of converting Lead is: '+ConvertingLeadEmail);
       }    
     }
     
     List<Lead> LeadstoUpdate = new list<lead>();
     List<lead> DupeLeads = [Select Id, Email from Lead where Email =: ConvertingLeadEmail AND IsConverted = false AND Status != 'Disqualified'];
     system.debug('Identified Duplicate leads are: '+DupeLeads);
     for(Lead DL : DupeLeads){
       DL.Status = 'Disqualified';
       LeadstoUpdate.add(DL);
       system.debug('Status Update on: '+LeadstoUpdate);
     }
     if(LeadstoUpdate.size() > 0){
       update LeadstoUpdate;
     }
   }
 /**************** End - Method to identify dupe Leads based on Email of converted Lead and update their Status to Disqualified *****************/
}