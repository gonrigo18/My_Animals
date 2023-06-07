public with sharing class AnimalHelper {
    public static void newAnimal(List<Animal__c> animals) {
        List <Animal__c> animalesUpdated = new List<Animal__c> (); // creo una lista de animales
        for(Animal__c a : animals){
            Animal__c animal = new Animal__c (); // por cada animal de la lista que trae el trigger creo un nuevo animal
            Integer age = Date.today().year() - a.Date_of_birth__c.year();
            if (Date.today().month() < a.Date_of_birth__c.month() ||
                (Date.today().month() == a.Date_of_birth__c.month() && Date.today().day() < a.Date_of_birth__c.day())) {
                age--; // Restamos 1 al resultado si aún no ha cumplido años en este año   
            }
            animal.years__c = age;
            animal.Id = a.Id;
            animalesUpdated.add(animal);
        }
        update animalesUpdated;
    }

    public static void checkNameFieldBeforeCreate (List<Animal__c> animals){
        List <Animal__c> animalToCreate = new List<Animal__c> ();
        for ( Animal__c animal : animals){
            if(animal.Name.length() < 4){
                animal.Name.addError('El nombre del animal debe contener un mínimo de 4 caracteres');
            }else{
            animalToCreate.add(animal);
            }
        }
    }

    public static void checkDateOfBirthFieldBeforeCreate(List<Animal__c> animals){
        List <Animal__c> animalToCreate = new List<Animal__c> ();
        for (Animal__c animal : animals){
            if (animal.Date_of_birth__c > Date.today()){
                animal.Date_of_birth__c.addError('La fecha de nacimiento no puede ser mayor a la fecha actual');
            }
            else{
                animalToCreate.add(animal);
            }
        }
    }
    
}