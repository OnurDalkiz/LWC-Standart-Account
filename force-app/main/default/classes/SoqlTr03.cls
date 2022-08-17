public class SoqlTr03 {
    
    //Account Ismi 'GenePoint', 'Burlington Textiles Corp America', 'sForce', 'Dickenson plc' olan Account'larin 
    //Rating'lerini Account isimleri ile birlikte console yazdiran methodu olusturunuz.
    
    //1.Way(Not Recommended):
    public static void Method01(){
        
        List<Account> result =[SELECT Name, Rating FROM Account WHERE Name IN('GenePoint', 'Burlington Textiles Corp of America', 'sForce', 'Dickenson plc')];
        
        //system.debug(result);
        
        for(Account w : result){
            
            system.debug(w.name + ' - ' + w.Rating);
            
        }
    }
    //2.Way(Recommended):
    public static void Method02(){
        
        List<String> accountNames = new List<String>{'GenePoint', 'Burlington Textiles Corp of America', 'sForce', 'Dickenson plc'};
        
        List<Account> result1 =[SELECT Name, Rating FROM Account WHERE Name IN :accountNames];
        
        //":" ifadesi isimleri bu List ten al demektir. ":accountNames" ifadelerine Binding Variable denir
        //Binding Variable'lar "IN", "NOT IN", "=", "!=", "LIMIT", "OFFSET" lerde kullanilabilir.
        
        //Use "IN"
        for(Account w : result1){
            
            system.debug(w.name + ' - ' + w.Rating);
            
        }
        
        system.debug('==========================');
        
        //Use "NOT IN"
        List<Account> result2 =[SELECT Name, Rating FROM Account WHERE Name NOT IN :accountNames];
        
        for(Account w : result2){
            
            system.debug(w.name + ' - ' + w.Rating);
    
        }
        
        system.debug('===========================');
        
        //Use "="
        List<Account> result3 =[SELECT Name, Rating FROM Account WHERE Name = :accountNames];
        
        for(Account w : result3){
            
            system.debug(w.name + ' - ' + w.Rating);
        }
        system.debug('===========================');
        
        //Use "="
        List<Account> result4 =[SELECT Name, Rating FROM Account WHERE Name != :accountNames];
        
        for(Account w : result4){
            
            system.debug(w.name + ' - ' + w.Rating);
        }
    }
    
    //Account Ismimlerini Alfabetik siraya koydukdan sonra 4. 5. ve 6. Account'larin 
    //Rating'lerini Account isimleri ile birlikte console yazdiran methodu olusturunuz.
    	
    //1.Way:
    
    public static void method03(){
        
        List<Account> result =[SELECT Name, Rating FROM Account ORDER BY Name LIMIT 3 OFFSET 3];
        
        for(Account w : result){
            
            system.debug(w.Name + '-' + w.Rating);
            
        }
}
    //2.Way:
    public static void method04(){
        
        Integer lim = 3;
        
        Integer oset = 3;
        
        List<Account> result =[SELECT Name, Rating FROM Account ORDER BY Name LIMIT :lim OFFSET :oset];
        
        for(Account w : result){
            
            system.debug(w.Name + '-' + w.Rating);
            
        }
}
    //3.Way(Is The Best Way):
    public static void method05(Integer lim, Integer oset){
           
        List<Account> result =[SELECT Name, Rating FROM Account ORDER BY Name LIMIT :lim OFFSET :oset];
        
        for(Account w : result){
            
            system.debug(w.Name + '-' + w.Rating);
            
        }
}

}