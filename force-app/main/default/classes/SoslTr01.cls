public class SoslTr01 {
    
    public static void method01(){
    
    List <List<sObject>> result = [FIND 'United' IN NAME FIELDS RETURNING Account(Name), Contact(Firstname, Lastname)];
		system.debug(result);
       }
    //SOSL'i Class'da kullanirken dikkat edilmesi gerekenler;
    //1)List'in icine List koyacagiz. 
    //2)Data Type'ina <sObject> Demeliyiz.
    //3)Normal Query Editor'de {} aramasini yapiyoruz, Class'in
    //icine yazdigimizda ise '' icine yazmaliyiz.
    
    public static void method02(){
        
        //SOSL'lerde "*" operatoru Regex'deki "%" sembolu
        //gibi calisir.(Devaminda ne olursa olsun)
        
      List<List<sObject>> result = [FIND 'Un*' IN NAME FIELDS RETURNING Account(Name), Contact(Firstname, Lastname)];
        
          system.debug(result);
    }
    
}