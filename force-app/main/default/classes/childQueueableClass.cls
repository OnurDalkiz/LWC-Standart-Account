public class childQueueableClass implements Queueable {
    
    public void execute (QueueableContext parameter){
        system.debug('This messages send with Child Queueable');
    }

}