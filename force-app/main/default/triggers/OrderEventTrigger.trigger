trigger OrderEventTrigger on Order_Event__e (after insert) {
    
    // List to hold all order
    List<Task> tsks = new List<Task>();
    
    // Iterate through each notification.
    for (Order_Event__e event : Trigger.New) {
        
        if (event.Has_Shipped__c == true) {
            // Create Task
            Task tsk = new Task();
            tsk.Priority = 'Medium';
            tsk.Subject = 'Follow up on shipped order ' + event.Order_Number__c;
            tsk.OwnerId = event.CreatedById ;
        
            
            tsks.add(tsk);
            
        }
        
    }
    
    insert tsks;
}