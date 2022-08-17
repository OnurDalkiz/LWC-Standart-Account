public class Students {
    
    private String name = 'Ali Can';
    
    private Integer age = 13;//Eger Access Modifier koymazsak Apex onu otomatik olarak 'Private' Kabul eder.
    
    private Boolean successful = true;
    
    //name, age ve succesfull data'larini okunabilir yapin.
    
    public String getName(){
        return name;
    }
    public Integer getAge(){
        return age;
    }
    public Boolean isSuccessful(){//Data Type Boolean oldugunda Get() method'larda Isim 'is' ile baslar.
        return successful;
    }

    //name, age ve succesfull data'larini degistirilebilir yapin.
    /////Yeni Data uretmeyen Method'larin Return Type'lari "VOID" olur.
    //Set() method yeni data uretmez, var olan Data yi degistirir.
    //Bu yuzden Return Type'lari "VOID" olmali.
    
    public Void setName(String name){
        this.name = name;        
    }
    public Void setAge(Integer Age){
        this.Age = Age;
    }
    public Void SetSuccessful(Boolean Successful){
        This.Successful = Successful;
    }
}