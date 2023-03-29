@isTest
public with sharing class ECU_UserTriggerTest {
    @TestSetup
    static void makeData() {

        Profile ps = [SELECT Id,Name
                      FROM Profile
                      WHERE Name = 'Custom: Sales Profile'];

        User us = new User();
        us.FirstName = 'Carlone';
        us.LastName = 'Test';
        us.Alias = 'Test1';
        us.Username = 'ciao@gmail.com';
        us.ProfileId = ps.Id;
        us.TimeZoneSidKey = 'GMT';
        us.LanguageLocaleKey = 'en_US';
        us.Email = 'cavolone@gmail.com';
        us.EmailEncodingKey = 'ISO-8859-1';
        us.LocaleSidKey = 'en_US';

        insert us;
    }

    @isTest
    static void testValidProfile() {

        Set<Id> usersId = new Set<Id>();

        User us = [SELECT Id,FirstName,LastName,Username,ProfileId,Email
                   FROM User
                   WHERE FirstName = 'Carlone'];


        PermissionSet per = [SELECT Id,IsCustom,ProfileId,Name
                             FROM PermissionSet
                             WHERE Name = 'Sales_User_Permission'
                             LIMIT 1];

        List<PermissionSetAssignment> perSetAssign = [SELECT Id,AssigneeId,PermissionSetId,IsActive
                                                      FROM PermissionSetAssignment
                                                      WHERE PermissionSetId = :per.Id AND AssigneeId = :us.Id];

        usersId.add(us.Id);

        Test.startTest();


        ECU_UserTriggerHandler.assignPermissSet(usersId);

        System.assertEquals(1,perSetAssign.size(),'ok');


        Test.stopTest();
    }

    @isTest
    static void testNotValidProfile() {

        Set<Id> usersId = new Set<Id>();

        Profile ps = [SELECT Id,Name
                      FROM Profile
                      WHERE Name = 'Standard User'];

        User us = new User();
        us.FirstName = 'Carlo';
        us.LastName = 'Testolina';
        us.Alias = 'carol12';
        us.Username = 'ciao212121@gmail.com';
        us.ProfileId = ps.Id;
        us.TimeZoneSidKey = 'GMT';
        us.LanguageLocaleKey = 'en_US';
        us.Email = 'cavolone212121@gmail.com';
        us.EmailEncodingKey = 'ISO-8859-1';
        us.LocaleSidKey = 'en_US';

        insert us;


        PermissionSet per = [SELECT Id,IsCustom,ProfileId,Name
                             FROM PermissionSet
                             WHERE Name = 'Sales_User_Permission'
                             LIMIT 1];

        List<PermissionSetAssignment> perSetAssign = [SELECT Id,AssigneeId,PermissionSetId,IsActive
                                                      FROM PermissionSetAssignment
                                                      WHERE PermissionSetId = :per.Id AND AssigneeId = :us.Id];

        usersId.add(us.Id);

        Test.startTest();


        ECU_UserTriggerHandler.assignPermissSet(usersId);

        System.assertEquals(0,perSetAssign.size(),'ok');


        Test.stopTest();
    }

}