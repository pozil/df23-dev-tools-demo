@isTest
private class AccountTriggerHelperTest {
  
  @isTest
  static void testBillingStateLength() {
    // Prepare mock data
    List<Account> accounts = new List<Account>{
      new Account(Name = 'Test Account', BillingState = 'California')
    };

    // Call trigger handler code
    AccountTriggerHelper.beforeUpdate(accounts);

    // Assert that we triggered an error on BillingState
    Account account = accounts[0];
    Assert.isTrue(account.hasErrors(), 'Account record should have an error');
    Database.Error error = account.getErrors()[0];
    Assert.isTrue(error.fields.contains('BillingState'), 'Account record should have an error on BillingState');
  }
}

            