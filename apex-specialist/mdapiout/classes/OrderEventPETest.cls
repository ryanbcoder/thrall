@isTest (SeeAllData=true)
public class OrderEventPETest {
    @isTest static void test1() {
        Order orderitem = [select Id, OrderNumber from Order LIMIT 1];  
         User userOwner = [select Id, Name, Email, Username from User where Username in ('test-zxfdkvcou2ln@example.com',
            'ryanthony.baronda@outlook-guestadmin.com') LIMIT 1];


        Order_Event__e orderEvent = new Order_Event__e (
            Has_Shipped__c=true,
            Order_Number__c= orderitem.OrderNumber);
        
        Test.startTest();

        Database.SaveResult sr = EventBus.publish(orderEvent);

        Test.stopTest();
        System.assertEquals(true, sr.isSuccess());
        List<Task> tasks = [select Id, Owner.Username from Task where OwnerId= :userOwner.Id];
        System.assert(tasks.size()>0);

    }
}