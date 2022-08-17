public Abstract class Honda {
    
    Public Void Music(){
        system.debug('Pro');
    }
    
    Public Abstract Void Engine();
    
/*
     * 1)Abstraction Methodlarin Body si olmaz
     * 2)Body'si olan methodlara 'non-abstact' ve 'concrete'
     * denir.
     * 3)Abstract Methodlar tum Child Methodlar tarafindan
     * Override edilmelidir.
     * 4)Abstract methodlar ancak Abstract class'lar icinde
     * olusturulabilir.
     * 5)Abstract class'lar hem Abstract method hem de 
     * Concrete Method icerebilirler.
     * 6)Concrete methodlar child class'lar tarafindan istenirse
     * Override edilebilirler.
     
*/
    
    /*
     

	'Virtual' Class ile 'Abstract' class arasindaki farklar.
	i)'Virtual' class'lardan obje olusturulabilir ama
	'Abstract' classlardan obje olusturulamaz.
	ii)'Abstract' classlardaki tum abstract methodlar
	tarafindan Override edilmelidir ama Virtual CLass da
	boyle bir durum yoktur cunku 'Virtual' classlarda Abstract
	Method olusturulamaz.
     
	
     */

}