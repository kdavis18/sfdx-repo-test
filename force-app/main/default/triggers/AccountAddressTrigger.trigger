trigger AccountAddressTrigger on Account (before update, after update) {
    System.debug('Enter Before Trigger: '+Trigger.isBefore);
    System.debug('Enter After Trigger: '+Trigger.isAfter);
}