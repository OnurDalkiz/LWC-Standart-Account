@isTest
private class TestClass {
    
    @isTest
    static void testPositive (){
        
        String sign = testingClass.displaySign(12);
        system.assertEquals('Positive', sign);
    }
    
    @isTest
    static void testNeuter(){
        String sign = testingClass.displaySign(0);
        system.assertEquals('Neuter', sign);
    }
    
    @isTest
    static void testNegative(){
        String sign = testingClass.displaySign(-5);
        system.assertEquals('Negative', sign);
    }
    
    @isTest
    static void testBMI1(){  
        Decimal bmi = TestingClass.calculateBMI(60, 1.2);
        system.assertNotEquals(41.66, bmi, 'BMI gelen iki positif deger ile hesaplanamadi');
    }
    
    
    
    
}