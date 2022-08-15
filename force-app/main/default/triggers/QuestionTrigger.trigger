trigger QuestionTrigger on Question__c (after insert,after delete,after update,after undelete){
    Set<Id> examId = new Set<Id>();
    if(trigger.isinsert || trigger.isundelete){
        for(Question__c qsc:trigger.new){
            examId.add(qsc.Exam__c);
        }
        Handlerquestion.handlerQuestiontriggerafterinsert(examId);
    }
    if(trigger.isupdate && trigger.isafter){
        for(Question__c qsc:trigger.new){
            if(qsc.exam__c!=trigger.oldMap.get(qsc.Id).Exam__c || qsc.score__c!=trigger.oldMap.get(qsc.Id).score__c){
                examId.add(qsc.Exam__c);
        		examId.add(trigger.oldmap.get(qsc.Id).Exam__c);  
        		Handlerquestion.handlerQuestiontriggerafterinsert(examId);
            }
        }
    }
    if(trigger.isafter && trigger.isdelete){
        for(Question__c qsc:trigger.new){
            examId.add(qsc.Exam__c);
        }
        Handlerquestion.handlerQuestiontriggerafterinsert(examId);
    }
}
/*trigger QuestionTrigger on Question__c (after insert, after update){
    SWITCH ON Trigger.operationType{
        WHEN AFTER_INSERT{
            list<Exam__c> SumOfScore =[Select total_score__c ,(Select Score__c from Questions__r) from Exam__c];
            for(Exam__c i:SumOfScore){
                decimal num = 0;
                for(Question__c t:i.Questions__r){
                    num = num + t.Score__c;
                }
                i.total_score__c = num;
            }
		update SumOfScore;           
        }
        WHEN AFTER_UPDATE{
            
        }
    }
}*/