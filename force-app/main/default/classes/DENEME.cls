public class DENEME {
    public void Method01(){
    List<Account> accs = [SELECT Name, Phone FROM Account];
        //system.debug(Accs);
        For(Account w : Accs){
            System.debug('Account Name :' + w.name + '-' 
                        + 'Account Phone :' + w.Phone);
        }
    }
}