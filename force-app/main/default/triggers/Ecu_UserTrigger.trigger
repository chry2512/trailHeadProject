trigger Ecu_UserTrigger on User(after insert ) {

    Set<Id> userId = new Set<Id>();

    if ( Trigger.isAfter & Trigger.isInsert) {

        Profile pr = [SELECT Id,Name
                      FROM Profile
                      WHERE Name = 'Custom: Sales Profile'];

        for ( User us : Trigger.new ) {

            if ( us.ProfileId == pr.Id) {
                userId.add(us.Id);

            }

        }

        if ( userId != null) {

            ECU_UserTriggerHandler.assignPermissSet(userId);

        }

    }
}