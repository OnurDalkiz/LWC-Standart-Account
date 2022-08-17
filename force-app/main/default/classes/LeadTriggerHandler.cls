public class LeadTriggerHandler {
    
    public Static Boolean firstCall = false;
    
    public static void beforeInsertHandler(list<Lead> leadList){
        
        for(Lead leadRecord : leadList){
            if(string.isBlank(leadRecord.status)){
                    leadRecord.LeadSource = 'Other';
            }
            
            if(string.isBlank(leadRecord.Industry)){
                leadRecord.Industry.addError('Industry field is Not Blank!');
            }
        }
    }
    
    public Static void beforeUpdateHandler(list<Lead> leadList, map<Id, Lead> leadOldMap){
        
            for(Lead leadRecord : leadList){
                if(string.isBlank(leadRecord.LeadSource)){
                    leadRecord.LeadSource = 'Web';
                }
                
                if((leadRecord.Status == 'Closed - Converted' || leadRecord.Status == 'Closed - Not Converted') && leadOldMap.get(leadRecord.Id).status == 'Open - Not Contacted'){
                    leadRecord.Status.addError('Lead with contact');
                }
                
            }        
        
    }
    
    public Static void afterInsertHandler(list<Lead> leadList){        
        
        list<task> newTask = new List<Task>();
        
        for(Lead leadRecord : leadList){
            Task taskNew = new Task(Subject = leadRecord.Lastname + 'Olusturuldu', whoId= leadRecord.Id);
            newTask.add(taskNew);
        }
        
        insert newTask;
        
        if(!firstCall){
            firstCall = true;
            Lead newLead = new Lead(Lastname = 'Test Lead Single', Status = 'Open - Not Contacted', Company = 'TechProEd LLC', Industry = 'Finance');
            insert newLead;
        }      
    }
    
}