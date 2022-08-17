public class newPsaHandleClass {
	
    @future 
    public static void newPsa(){            
        PermissionSet psId = [SELECT Id FROM PermissionSet WHERE Name = 'ReadOnlyContract'];
        User userId = [SELECT Id FROM User WHERE username ='onurdalkiz34@gmail.com'];
        
        PermissionSetAssignment newPSA = new PermissionSetAssignment(AssigneeId=userId.Id, PermissionSetId=psId.Id);
        insert newPSA;
    }    
}