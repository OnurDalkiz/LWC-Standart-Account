public class SoqlTr06 {
    
    //1)Database'e bir tane Lead Object'i Insert ediniz.
    //2)Insert ettiginiz Lead object'inin LastName ini "Xyz" yapiniz.
    
    
    public static void method01(){
        
        //Lead leads = new Lead(FirstName='Ali', LastName='B76', Company='Migros');
        
        //insert leads;
        
		//Note: Update, Delete, Undelete operasyonlari kritik
		//operasyonlardir. Bu operasyonlar "Id" olmadan 
		//"YAPILAMAZLAR..."  
		
        List<Lead> Leads =[SELECT Id FROM Lead WHERE Firstname='Ali' AND Lastname='B76' AND Company='Migros'];
        
        for(Lead w : leads){
            
			w.LastName ='Xyz';
            
        }
        
        Update leads;//Database.update(leads, false);
        
        
    }

}