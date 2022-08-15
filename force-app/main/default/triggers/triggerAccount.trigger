trigger triggerAccount on Account (before insert, after update){
    
        switch on trigger.operationType{
            when AFTER_UPDATE{            
                set<id> accIds = new set<id>();                
                for(Account acc : trigger.new){                    
                    if(acc.BillingCity != trigger.oldMap.get(acc.Id).BillingCity){                        
                        accIds.add(acc.Id); 
                    }
                }                 
                List<Contact> conList =[SELECT id, MailingCity, Account.BillingCity FROM Contact WHERE AccountId IN :accIds];                    
                for(Contact con:conList){
                    con.MailingCity = con.Account.BillingCity;
                }                
                update conList;                
        	}
            when BEFORE_INSERT{
                for(Account acc : trigger.new){
                    if(acc.Name == '007Bn'){
                        acc.Name.addError('TechProEdu is not allowed for Account Creations');
                    }else{
                        acc.Industry = 'Agriculture';
                    }   
                }
            }
    }
    
}