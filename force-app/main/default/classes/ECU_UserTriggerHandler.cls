public with sharing class ECU_UserTriggerHandler {
    @future
    public static void assignPermissSet(Set<Id> usrId) {


        List<PermissionSet> perSet = [SELECT Id,IsCustom,ProfileId,Name
                                      FROM PermissionSet
                                      WHERE Name = 'Sales_User_Permission'
                                      LIMIT 1];


        List<PermissionSetAssignment> perSetAssign = new List<PermissionSetAssignment>();


        List<User> users = [SELECT Id,LastName,Firstname
                            FROM User
                            WHERE Id IN:usrId];

        for ( User us : users) {

            for ( PermissionSet ps : perSet) {

                PermissionSetAssignment pa = new PermissionSetAssignment(PermissionSetId = ps.Id,AssigneeId = us.Id);
                perSetAssign.add(pa);

            }


        }

        try {

            upsert perSetAssign;

        } catch ( Exception e) {
            System.debug('<<<<<<EXception Message' + e.getMessage() + '<<<<<<LineError' + e.getLineNumber());
        }
    }

}