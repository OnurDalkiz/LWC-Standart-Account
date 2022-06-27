trigger newOpp on Opportunity (before insert, after update) {

    switch on trigger.operationType{
        
        when BEFORE_INSERT{
            
            for(Opportunity oppRecord:Trigger.new){
               oppRecord.Name = oppRecord.Name+'opp';
            }
        }
        when AFTER_UPDATE{
            
            list<Task> taskList = new List<Task>();
            
            for(Opportunity oppRecord:Trigger.new){
                
                if(oppRecord.StageName == 'Negotiation/Review' && trigger.oldMap.get(oppRecord.Id).stageName != 'Negotiation/Review'){
                    Task newTask = new Task(subject='New Opp Created, Please deal with.', whatId=oppRecord.Id, ownerId=oppRecord.OwnerId);
                    taskList.add(newTask);
                }
                
            }
            
            insert taskList;
            
        }
    }
}