public class Handlerquestion {
     
    public static void handlerQuestiontriggerafterinsert(set<Id> examId){
      
  list<Exam__c> examlist= [Select total_score__c, (Select Score__c From Questions__r) From Exam__c Where Id=:ExamId];
        for(Exam__c ex:examlist){
                    decimal num=0;
        for(Question__c t:ex.Questions__r){
                    num = num + t.Score__c;
                }
        ex.Total_Score__c=num;
        }
        update examlist;
    }
}