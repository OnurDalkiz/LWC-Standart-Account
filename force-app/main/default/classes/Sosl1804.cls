public class Sosl1804 {
    
    public static void method01(){
        
        list<list<sObject>> result = [FIND 'Un*' IN NAME FIELDS RETURNING Account(Name), Contact(Firstname, Lastname)];
        
       	list<Account> myList = result[0];
        
        list<Contact> myList2 = result[1];
        
        for(Account w:myList){
            
            system.debug('Account Name====' + w.Name);
            	
        }
        
        for(Contact k:myList2){
            
        	system.debug('Contact First-Last Name====' + k.FirstName + k.LastName);
            	
        }
            
            
        }
        
    }