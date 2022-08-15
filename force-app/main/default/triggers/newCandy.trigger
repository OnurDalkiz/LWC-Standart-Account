trigger newCandy on Candidate__c (before insert, before update, after insert, after undelete) {    
    switch on trigger.operationType{        
        when BEFORE_INSERT{
            
            newCandyTriggerHandlerBEFORE_INSERT.handlerClass(trigger.new);

        }
        when BEFORE_UPDATE{
		//Candidate Objectinde Country Fieldi Turkey ise UK and USA secilemez.
            for(Candidate__c Candy:trigger.new){
                /*if(	Candy.isCorporate__c == true){                    
                    Candy.Scholarship__c = true;
                }
                if( string.isBlank(Candy.Last_Name__c)){
                    Candy.Last_Name__c.addError('Last Name field is Not Blank');
                }
                if(Candy.Gender__c == 'Mr.' && Candy.isCorporate__c == true){
                    Candy.First_Name__c = 'Test Trigger';
                    system.debug('Trigger Tetiklendi');
                }*/
    			if(trigger.oldMap.get(candy.Id).Country__c == 'TURKEY' && (candy.Country__c == 'UK' || candy.Country__c == 'USA')){
        			candy.addError('Country Fieldi Turkey ise UK and USA secilemez');
    			}
            }                    
        }
        when BEFORE_DELETE{
            //Teacher objectinden adı a ile başlayan recordları silerken hata ver.
            for(Candidate__c listCandy : trigger.old){
                if(listCandy.Name.startsWith('a')){
                    listCandy.Name.addError('Can Not Delete Record Because Record Start With A');
                }
            }
        }
        when AFTER_INSERT{
            /*list<Task> listTask = new List<Task>();
            for(Candidate__c Candy:trigger.new){
                Task newTask = new Task(Subject='New Candy created, please deal with.', whoId=Candy.Contact__r.iD, ownerId=Candy.OwnerId);
                listTask.add(newTask);
            }
            insert listTask;*/
            list<Account> newAcc = [SELECT Id, Industry FROM Account];
            for(Candidate__c candy : trigger.new){
                for(Account ccc : newAcc){
                    if(candy.Account__c == ccc.Id){
                        ccc.Industry = 'Education';
                    }
                }                
            }
            update newAcc;
        }
        when AFTER_UNDELETE{
            //Recycle bin'de bir kayıt undelete olduğunda console'a restored yazdırın.
            for(Candidate__c newCandy:trigger.new){
                system.debug('One Record Restored On Recycle Bin');
            }            
        }
    }
}
//Yeni bir Candidate olusturuldugun da isCorporate checksbox i seciliyse Account bos olamaz, iliskili Account un Industry fieldi Education olacaktir.