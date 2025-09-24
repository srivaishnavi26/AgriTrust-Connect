public class CropCycleTriggerHandler {
    public static void handleBeforeInsert(List<Crop_Cycle__c> cycles) {
        for (Crop_Cycle__c cycle : cycles) {
            if (cycle.Harvest_Date__c != null && cycle.Sowing_Date__c != null &&
                cycle.Harvest_Date__c < cycle.Sowing_Date__c) {
                cycle.addError('Harvest Date cannot be before Sowing Date.');
            }
        }
    }
}