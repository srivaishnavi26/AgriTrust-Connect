public with sharing class ProcurementController {
    @AuraEnabled(cacheable=true)
    public static String getProcurementStatus(Id procurementId) {
        Procurement__c proc = [
            SELECT Status__c
            FROM Procurement__c
            WHERE Id = :procurementId
            LIMIT 1
        ];
        return proc.Status__c;
    }
}