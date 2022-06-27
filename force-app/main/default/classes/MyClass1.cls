public class MyClass1 {
    
    public static string rastgeleBirHarfVer(){
        string alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
        integer maxIndex = alphabet.length()-1;
        integer rastgeleIndex = integer.valueOf(math.random()*maxIndex);
        return alphabet.substring(rastgeleIndex, rastgeleIndex+1);
       }
}


    //Create:Rastgele bir harf ureten fonksiyon olusturunuz.
    ///////////methoda "static" key word unu koyarsak o methoda sadece class in ismini yazarak ulasabiliriz.
    //"math.random()"methodu bize (0 ile 1.0) arasi rastgele deger verir.
    //"integer.valueof() virgullu sayilarda virgulden sonraki rakami siler"