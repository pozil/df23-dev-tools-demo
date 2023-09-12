trigger StateTrigger on Account(before update) {
  if (Trigger.isBefore) {
    AccountTriggerHelper.beforeUpdate(Trigger.new);
  }
}
