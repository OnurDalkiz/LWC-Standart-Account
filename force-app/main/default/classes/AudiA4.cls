public class AudiA4 implements Engine, Klima, Fren{ 
    //Interface'leri Parent yapmak icin 'Implements' Keyword
    //Kullanirlir.
    //AudiA4 class'i Engine Interface'i icindeki tum methodlari
    //override etmek zorundadir.
    //AudiA4 class'i Engine Interface'i icindeki tum methodlari
    //override etmek zorunda oldugundan Methodlarin bas kismina
    //"Override" yazmak gerekmez.
    
    
    //////ENGINE/////
    public void eco(){
            system.debug('AudiA4 Use To Eco Engine');
        }
    
    Public Void Turbo(){
            system.debug('AudiA4 Use To Turbo Engine');
        }
	
    Public Void Gas(){
            system.debug('AudiA4 Use To Gas Engine');
        
    //////KLIMA/////
        }
    public void Mevsimsel(){
            system.debug('AudiA4 Use To MEvsimsel Klima');
        }
    
    Public Void Digital(){
            system.debug('AudiA4 Use To Digital Klima');
        }
    
    /////FREN/////
	
    Public Void ABS(){
            system.debug('AudiA4 Use To ABS Break');
        }
    public void Secure(){
            system.debug('AudiA4 Use To Secure Break');
        }
}