public with sharing class AccountProcessor {
     
    @future
    public static void countContacts(Set<Id> accountIds) {
        // List<Account> acnts = new List<Account>();
        // Map<Id, Integer> acntMap = new Map<Id,Integer>([select Id, (select count() from contact) from Account]);
        // for (Id acntId : acntMap.keySet()) {
        //     acnts.add(Id=acntId, Number_of_Contacts__c=acnt.get(acntId));
        // }


        // List<Account> acnts = new List<Account>([select Id, Number_of_Contacts__c from Account]);
        // for (Account acnt : acnts) {
        //     acnt.Number_of_Contacts__c = [select count() from Contact where AccountId = :acnt.Id];
        // }

        List<Account> acnts = new List<Account>();
        Map<Id,Account> acntMap = new Map<Id,Account>([select Id, Number_of_Contacts__c, (select Id from Contacts) from Account]);
        for (Id acntId : acntMap.keyset())
        {
            Account acnt = acntMap.get(acntId);
            acnt.Number_of_Contacts__c = acnt.Contacts.size();
            acnts.add(acnt);
        }

        update acnts;
    }
}
