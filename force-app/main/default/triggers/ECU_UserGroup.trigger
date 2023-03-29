trigger ECU_UserGroup on User(after insert ) {

    Set<Id> usersId = new Set<Id>();

    if ( Trigger.isAfter && Trigger.isInsert) {

        for ( User us : Trigger.new ) {
            usersId.add(us.Id);

        }


        if ( usersId != null) {

            ECU_UserGroup.assignGroup(usersId);
            ECU_UserGroup.collaboraGroupPost(usersId);


        }


    }
}