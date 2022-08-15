public class newCandyTriggerHandlerBEFORE_INSERT {
    
    public static void handlerClass(list<Candidate__c> listCandy){
		for(Candidate__c Candy:listCandy){
            if(string.isBlank(Candy.Last_Name__c)){
                Candy.Last_Name__c.addError('Last Name field is Not Blank');
            }
            if(string.isBlank(Candy.Country__c)){
                Candy.Country__c = 'USA';
            }
            if(string.isBlank(Candy.Account__c) && candy.isCorporate__c == true){
                candy.isCorporate__c.addError('isCorporate checksbox i seciliyse Account bos olamaz');
            }
        }
    }
}