trigger OrderEventTrigger on Order_Event__e (after insert) {

    List<Task> tasks = new List<Task>();

    User userOwner = [select Id, Name, Email, Username from User where Username in ('test-zxfdkvcou2ln@example.com',
        'ryanthony.baronda@outlook-guestadmin.com') LIMIT 1];

    for (Order_Event__e event : Trigger.New) {
        if (event.Has_Shipped__c == true) {
            Task newTask = new Task (
                Priority='Medium',
                Status='New',
                Subject='Follow up on shipped order ' + event.Order_Number__c,
                OwnerId=userOwner.Id            
            );
            tasks.add(newTask);
        }
    }

    insert tasks;
}