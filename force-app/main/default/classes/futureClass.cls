public class futureClass {
	@future
    public static void newPS(String psName, String userName){
        
        PermissionSet psId = [SELECT Id FROM PermissionSet WHERE Name = :psName];
    	User UI = [SELECT Id FROM User WHERE username = :userName];        
    	PermissionSetAssignment PSA = new PermissionSetAssignment(AssigneeId=UI.Id, PermissionSetId=psId.Id);
    	insert PSA;//DML 2
        
    }

}