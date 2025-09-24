public class FarmManagementHandler {
    private static final Map<String, Decimal> yieldFactors = new Map<String, Decimal>{
        'Paddy' => 25,
        'Wheat' => 20
    };

    public static Decimal calculateExpectedYield(Farm__c farm, String cropType) {
        if (farm.Size_in_Acres__c == null || farm.Size_in_Acres__c <= 0) {
            return 0;
        }
        return yieldFactors.containsKey(cropType) ? farm.Size_in_Acres__c * yieldFactors.get(cropType) : 0;
    }

    public static Boolean validateSoilRecord(Soil_Record__c soil) {
        return soil.pH__c != null && soil.pH__c > 0 && soil.pH__c <= 14;
    }
}