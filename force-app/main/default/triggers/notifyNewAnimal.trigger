trigger notifyNewAnimal on Animal__c (after insert, after delete) {
    if (Trigger.isInsert) {
        Integer recordCount = Trigger.new.size();
        // Call a utility method from another class
        EmailManager.sendMail('gonzalo.rigobello18@gmail.com', 'Trailhead Trigger Tutorial', 
                    recordCount + ' animal(s) were inserted.');
    }
    else if (Trigger.isDelete) {
        // Process after delete
    }
}