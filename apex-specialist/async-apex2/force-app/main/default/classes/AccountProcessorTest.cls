@isTest
public with sharing class AccountProcessorTest {
   
    @IsTest
    public static void TestPositive(){
        // Create accounts
        List<Account> newAcnts = new List<Account>();
        newAcnts.add (new Account(Name='Test1'));
        newAcnts.add (new Account(Name='Test2'));
        insert newAcnts;

        // Create Ccontacts
        List<Contact> newContacts = new List<Contact>();
        for (Account acnt : newAcnts) {
            for (Integer i=0; i<3; i++) {
                newContacts.add(new Contact(LastName=acnt.Name + '-' + (i+1), AccountId=acnt.Id));
            }
        }
        insert newContacts;

        Map<Id,Account> acntMap = new Map<Id,Account>( [select Id, Number_of_Contacts__c, (select Id from Contacts) from Account]);
        // List <Account> accounts = [select Id,(select Contact.Id from Contact) from Account];
        
        Set<Id> idSet = acntMap.keyset();

        Test.startTest();
        AccountProcessor.countContacts(idSet);
        Test.stopTest();

        Map<Id,Account> acntMapUpdated = new Map<Id,Account>( [select Id,Number_of_Contacts__c, (select Id from Contacts) from Account]);
        
        for (Id acntId : acntMapUpdated.keySet()) {
            Account acnt = acntMapUpdated.get(acntId);
            System.assertEquals(acnt.Number_of_Contacts__c,acnt.Contacts.size());
        }

        // List<Account> acnts = [select Id, Number_of_Contacts__c from Account];
        // for (Account acnt : acnts) {
        //     List<Contact> contacts = acntMap.get(acnt.Id).Contacts;
        //     System.assertEquals(contacts.size(), acnt.Number_of_Contacts__c);
        // }
        // for (Id eachId : idSet) {
        //     for (Contact eachContact : acntMap.get(eachId)) {
        //         System.assertEquals();
        //     }

        // }
    }
}
