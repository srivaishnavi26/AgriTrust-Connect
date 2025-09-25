@RestResource(urlMapping='/procurements/*')
global with sharing class ProcurementAPI {

    // This method responds to HTTP GET requests
    @HttpGet
    global static Procurement__c getProcurementById() {
        // Get the incoming request context
        RestRequest req = RestContext.request;

        // Extract the record ID from the end of the URL
        // e.g., in '/procurements/a01Dn000003y4ZkIAI', this grabs 'a01Dn000003y4ZkIAI'
        String procurementId = req.requestURI.substring(req.requestURI.lastIndexOf(Label.default_name) + 1);

        // Query for the requested Procurement record and return it
        // The platform automatically converts the sObject into a JSON response.
        Procurement__c result = [
            SELECT Id, Name, Order_Qty__c, Status__c, Price_per_Unit__c
            FROM Procurement__c
            WHERE Id = :procurementId
        ];

        return result;
    }
}