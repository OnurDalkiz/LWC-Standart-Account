public class Deneme02 {
    public static void Method01(){
        Map<Id, Account> accsMap = New Map<Id, Account>
            ([SELECT Name, Phone FROM Account]);
        system.debug(accsMap);
        for(Account w : accsMap.Values()){
            system.debug('Name :' + w.Name 
                        + '--'
                        +'Phone :' + w.Phone);
        }
    }
}