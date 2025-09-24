public class ProcurementTriggerHandler {
    
    public static void handleAfterInsert(List<Procurement__c> procs) {
        if (procs == null || procs.isEmpty()) {
            return;
        }

        List<Traceability_Ledger__c> ledgers = new List<Traceability_Ledger__c>();

        for (Procurement__c proc : procs) {
            ledgers.add(new Traceability_Ledger__c(
                Name = 'Ledger for ' + proc.Name,
                Stage__c = 'Created',
                Related_Procurement__c = proc.Id
            ));
        }

        if (!ledgers.isEmpty()) {
            insert ledgers;
        }
    }
        public static void publishProcurementEvents(List<Procurement__c> newProcurements) {
        List<Procurement_Order_Event__e> eventsToPublish = new List<Procurement_Order_Event__e>();

        for (Procurement__c proc : newProcurements) {
            // Create a new event instance for each procurement record
            Procurement_Order_Event__e event = new Procurement_Order_Event__e(
                Procurement_ID__c = proc.Id,
                Order_Quantity__c = proc.Order_Qty__c,
                Buyer_Name__c = proc.Buyer_Account_Name__c // Assuming you have a field like this
            );
            eventsToPublish.add(event);
        }

        // Publish the list of events. This is bulk-safe.
        if (!eventsToPublish.isEmpty()) {
            EventBus.publish(eventsToPublish);
        }
    }
}