public with sharing class WeatherService {

    /**
    * @description This asynchronous method makes a callout to an external weather API.
    * @param cropCycleId The ID of the Crop Cycle record to associate the new Advisory with.
    * @param location A string representing the location for the weather forecast (e.g., a city name or postal code).
    */
    @future(callout=true)
    public static void getRainfallForecast(Id cropCycleId, String location) {
        // 1. Prepare the HTTP Request
        HttpRequest req = new HttpRequest();

        // Use the Named Credential 'WeatherAPI' that we created in the previous step.
        // This is secure and avoids hardcoding URLs.
        req.setEndpoint('callout:WeatherAPI/forecast/daily?location=' + location + '&units=metric');
        req.setMethod('GET');

        // 2. Send the Request
        Http http = new Http();
        HttpResponse res = http.send(req);

        // 3. Process the Response
        if (res.getStatusCode() == 200) {
            // Deserialize the JSON response into a map of objects.
            Map<String, Object> responseMap = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
            Map<String, Object> forecastMap = (Map<String, Object>) responseMap.get('forecast');
            Decimal rainfall = (Decimal) forecastMap.get('rainfall_mm');

            // 4. Take action based on the data
            if (rainfall > 10) {
                // Create an Advisory Record if rainfall is significant
                Advisory__c newAdvisory = new Advisory__c(
                    Name = 'Heavy Rainfall Forecast',
                    Crop_Cycle__c = cropCycleId,
                    Type__c = 'Irrigation', // This must be a valid picklist value on your object
                    Advisory_Text__c = 'Heavy rainfall of ' + rainfall + 'mm is expected. Adjust irrigation schedule accordingly.'
                );
                insert newAdvisory;
            }
        } else {
            // If the callout fails, log the error for debugging.
            System.debug('Callout failed with status code: ' + res.getStatusCode() + ' and body: ' + res.getBody());
        }
    }
}