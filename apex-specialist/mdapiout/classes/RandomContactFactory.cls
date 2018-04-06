public  class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numContacts, 
        String lastName) {

        List<Contact> contacts = new List<Contact>();

        for (Integer i=0; i<numContacts; i++) {
            contacts.add(new Contact(FirstName='Alice ' + 101+i, LastName=lastName));
        }
        return contacts;
    }
}
