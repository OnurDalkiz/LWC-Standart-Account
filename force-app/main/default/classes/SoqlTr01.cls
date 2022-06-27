public class SoqlTr01 {
    
    //Account Name lerini ve Telefon numaralarini
    //Console yazan bir method olusturunuz.
    
    public void method01(){
        
       List<Account> accs = [SELECT Name, Phone FROM Account];
       system.debug(accs);
        //Tum Data'yi tek satirda yazdirir.
        For(Account w : accs){
           system.debug('Account Name: '+ w.name + '- Account Phone: '
                        + w.Phone);
            //Her Bir Data'yi farkli bir satirda yazdirir.
        }
    }
    
    public static void Method02(){
        Map<Id, Account> accsMap = new Map <Id, Account>
            ([SELECT Name, Phone FROM Account]);
        system.debug(accsMap);
        
        for(Account w : accsMap.Values()){
            system.debug('Account Name: ' + w.Name);
            
        }
    }
    
    public static void method03(){
		List<Contact> contacts = 
            
            [SELECT Contact.Name, 
			Contact.Department, 
			Contact.Account.Name, 
			Contact.Account.Rating,
			(SELECT Case.CaseNumber, Case.Subject FROM Cases)

		FROM Contact];
        
        //Data'yi Ana Object'ten aliniz.
        
        //for(Contact w : contacts){
          //  system.debug(w.Name 
                       //  + '-' + w.Department 
                        // + '-' + w.Account.Name 
                        // + '-'+ w.Account.Rating );           
     //   }
        //Date'yi Child Object'ten(Case) almak.

        For(Contact w : contacts){
        	for(Case t : w.cases){
        		system.debug(t.CaseNumber + t.Subject);
        	}
	}
    
}
}