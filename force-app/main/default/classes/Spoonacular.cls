public with sharing class Spoonacular {
  private static final String SPOONACULAR_API = 'https://api.spoonacular.com';
  private static final String API_KEY = '5566743123654f96ab5a545a88c49fe4';

  @AuraEnabled
  public static String getRandomRecipe() {
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndpoint(SPOONACULAR_API + '/recipes/random?apiKey=' + API_KEY);
    request.setMethod('GET');

    HttpResponse response = http.send(request);
    // System.debug('response'+response.getStatusCode());
    if (response.getStatusCode() == 200) {
      System.debug(response.getBody());
      return response.getBody();
    }
    return '';
  }

  @AuraEnabled
  public static String getRecipe(String recipeId) {
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndpoint(
      SPOONACULAR_API +
      '/recipes/' +
      recipeId +
      '/information?apiKey=' +
      API_KEY
    );
    request.setMethod('GET');

    HttpResponse response = http.send(request);
    System.debug('response' + response.getStatusCode());
    if (response.getStatusCode() == 200) {
      System.debug(response.getBody());
      return response.getBody();
    }
    return '';
  }

  @AuraEnabled
  public static String getRecipeByIngredients(String ingredients) {
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndpoint(
      SPOONACULAR_API +
      '/recipes/findByIngredients?ingredients=' +
      ingredients +
      '&number=10&apiKey=' +
      API_KEY
    );
    request.setMethod('GET');

    HttpResponse response = http.send(request);
    System.debug('response' + response.getStatusCode());
    if (response.getStatusCode() == 200) {
      System.debug(response.getBody());
      return response.getBody();
    }
    return '';
  }
}
