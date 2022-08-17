public class TaskUtils {
    public static void remindOWnersForOpp(list<Opportunity> oppIds){
        list<Task> taskList = new List<Task>();
        for(Opportunity tsk:oppIds){
            Task newTask = new Task	(Subject=tsk.Name + ' close date was '+ tsk.closeDate,
                                     ownerId=tsk.ownerId,
                                     Status='Open',
                                     Priority='Normal',
                                     whatId=tsk.Id,
                                     whoId=tsk.ContactId
                                   	);
            tasklist.add(newTask);
        }
        if(taskList.size()>0){
            Database.insert(taskList);
        }
    }
}