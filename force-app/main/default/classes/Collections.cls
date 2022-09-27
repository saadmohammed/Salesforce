public with sharing class Collections {
  public Collections() {
  }

  public static void Maps(Boolean isRun) {
    if (isRun) {
      Map<String, Object> keyValue = (Map<String, Object>) JSON.deserializeUntyped(
        '{"description":"An appliance","accessories":["powerCord",{"right":"door handle1","left":"door handle2"}],"dimensions":{"height":5.5,"width":3,"depth":2.2},"type":null,"inventory":2000,"price":1023.45,"isShipped":true,"modelNumber":"123"}'
      );
      for (String key : keyValue.keySet()) {
        System.debug(key + '-' + keyValue.get(key));
      }
    }
  }
}
