trigger AnimalTrigger on Animal__c (after insert,before insert, after update) {
    if(trigger.isAfter && trigger.isInsert){
        AnimalHelper.newAnimal(Trigger.new);
    }


    if(trigger.isAfter && trigger.isUpdate){
        for(Animal__c newAnimal : Trigger.new){
            Animal__c oldAnimal = Trigger.oldMap.get(newAnimal.Id);
            if (oldAnimal.Date_of_birth__c != newAnimal.Date_of_birth__c){
                AnimalHelper.newAnimal(Trigger.new);
            }
        }
    }

    if(trigger.isBefore && trigger.isInsert){
        AnimalHelper.checkNameFieldBeforeCreate(Trigger.new);
        AnimalHelper.checkDateOfBirthFieldBeforeCreate(Trigger.new);
    }

}