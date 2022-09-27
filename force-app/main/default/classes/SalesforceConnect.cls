public class SalesforceConnect {
  public static void SystemClass() {
    System.debug(System.Url.getSalesforceBaseUrl());
    System.debug(System.UserInfo.getSessionId().substring(15));
  }

  public static void getCasesFromOrgB() {
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    //  we can get rid of this hardcoded token passing and methods.
    /**request.setEndpoint(
      'https://saad-j-1-dev-ed.my.salesforce.com/services/apexrest/Cases'
    );
    request.setHeader(
      'Authorization',
      'Bearer !AQwAQLPf6VaWX5s9kugBQEcgtBLbcazOsBEPFQoAYCbmbEoWnhiS3CKTyqMxTIo6SCcVygBlnWMBeywmOPrS019RX9BR0KOR'
    );
    request.setMethod('GET');
    */
    // we use named credential oto make callout, to use named credential we have to use keyword call
    // callout, colon and want named credential.
    request.setEndpoint('callout:SF_Org_B_Connect/services/apexrest/Cases');
    request.setMethod('GET');
    HttpResponse response = http.send(request);
    if (response.getStatusCode() == 200) {
      //   System.debug(response.getBody());
      // Getting response array(JSON) in list of object.
      List<Object> results = (List<Object>) JSON.deserializeUntyped(
        response.getBody()
      );
      for (Object result : results) {
        Map<String, Object> mapOfCases = (Map<String, Object>) result;
        System.debug(
          mapOfCases.get('CaseNumber') +
          '--' +
          mapOfCases.get('Subject')
        );
      }
    }
  }

  public static void createCaseInSalesforceOrgB() {
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndpoint('callout:SF_Org_B_Connect/services/apexrest/Cases');
    request.setMethod('POST');
    request.setHeader('Content-Type', 'application/json;charset=UTF-8');
    request.setBody(
      '{"subject":"Case from Salesforce Org A","status":"New","origin":"Web", "priority":"Medium"}'
    );
    HttpResponse response = http.send(request);
    if (response.getStatusCode() == 200) {
      System.debug(response.getBody());
    }
  }

  public static void putCaseInSalesforceOrgB() {
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndpoint('callout:SF_Org_B_Connect/services/apexrest/Cases');
    request.setMethod('PUT');
    request.setHeader('Content-Type', 'application/json;charset=UTF-8');
    request.setBody(
      '{"Id":"5005g00000V034ZAAR","subject":"Case from Salesforce Org A Updated","status":"In Progress","origin":"Web", "priority":"Medium"}'
    );
    HttpResponse response = http.send(request);
    if (response.getStatusCode() == 200) {
      System.debug(response.getBody());
    }
  }

  public static void deleteCaseInSalesforceOrgB(String Id) {
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndpoint(
      'callout:SF_Org_B_Connect/services/apexrest/Cases/'+Id
    );
    request.setMethod('DELETE');
    HttpResponse response = http.send(request);
    if (response.getStatusCode() == 200) {
      System.debug(response.getBody());
    }
  }
}
