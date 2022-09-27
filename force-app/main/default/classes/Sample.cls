public with sharing class Sample {
    public Sample() {

    }

    public static void getAccounts(){
        List<Account> listAccount = new List<Account>([SELECT Name FROM Account LIMIT 2]);
        System.debug(listAccount);
    }
}
