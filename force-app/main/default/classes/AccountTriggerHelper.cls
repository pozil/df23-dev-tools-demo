public with sharing class AccountTriggerHelper {
  public static void beforeUpdate(List<Account> accounts) {
    checkBillingStateLength(accounts);
  }

  public static void checkBillingStateLength(List<Account> accounts) {
    for (Account account : accounts) {
      if (account.BillingState?.length() > 2) {
        account.BillingState.addError(
          'Billing State must be no more than two characters'
        );
      }
    }
  }
}
