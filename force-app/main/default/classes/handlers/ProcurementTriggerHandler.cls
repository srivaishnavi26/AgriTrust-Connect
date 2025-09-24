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
}