public with sharing class ECU_UserGroup {
    public static void assignGroup(Set<Id> usersId) {

        List<GroupMember> members = new List<GroupMember>();


        List<User> users = [SELECT Id,FirstName,LastName,Email,Username
                            FROM User
                            WHERE Id IN:usersId];

        List<Group> grps = [SELECT Id,Type,Name
                            FROM Group
                            WHERE Name = 'All_Users'
                            LIMIT 1];


        for ( User us : users) {

            for ( Group gr : grps) {

                GroupMember mbr = new GroupMember(GroupId = gr.Id,UserOrGroupId = us.Id);
                members.add(mbr);
            }

        }


        try {

            if ( members != null) {

                insert members;

            }

        } catch ( Exception e) {

            System.debug('ExceptionMessage' + e.getMessage() + e.getLineNumber());

        }
    }

    @future
    public static void collaboraGroupPost(Set<Id> usersId) {
        List<CollaborationGroupMember> collMember = new List<CollaborationGroupMember>();
        List<FeedItem> postList = new List<FeedItem>();

        List<User> users = [SELECT Id,FirstName,LastName,Email,Username
                            FROM User
                            WHERE Id IN:usersId];

        List<CollaborationGroup> collGroup = [SELECT Id,Name
                                              FROM CollaborationGroup
                                              WHERE Name = 'Users'
                                              LIMIT 1];


        for ( User us : users) {
            for ( CollaborationGroup cb : collGroup) {

                CollaborationGroupMember member = new CollaborationGroupMember(CollaborationGroupId = cb.Id,MemberId = us.Id);
                collMember.add(member);

                FeedItem post = new FeedItem(Title = 'Welcome ' + us.Username,Body = 'Congratulatin to ' + us.Username + ' join with us',ParentId = cb.Id);
                postList.add(post);
            }

        }

        try {

            if ( collMember != null) {

                insert collMember;

            }

            if ( postList != null) {
                insert postList;

            }
        } catch ( Exception e) {
            System.debug('<<<<<Exception ' + e.getMessage() + e.getLineNumber());

        }
    }

}