public class Deneme03 {
    
    public static void method01(){
		List<Contact> contacts = 
            
            [SELECT Contact.Name, 
			Contact.Department, 
			Contact.Account.Name, 
			Contact.Account.Rating,
			(SELECT Case.CaseNumber, Case.Subject FROM Cases)

		FROM Contact];
        
        for(Integer i = 0 ; i<contacts.size() ; i++ ){
        for(Contact w : contacts){
            system.debug(w.Name 
                         + '-' + w.Department 
                         + '-' + w.Account.Name 
                         + '-' + w.Account.Rating);
				return;            
        }
        for(Contact w : contacts){
                for(Case t : w.Cases){
                    system.debug(t.Subject + '---'
                                + t.CaseNumber);
                    return;
                }
        }
        }
    }
}