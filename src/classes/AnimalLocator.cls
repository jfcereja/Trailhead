public class AnimalLocator {
    public static String getAnimalNameById(Integer id){
        String rs = '';
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        req.setMethod('GET');
        
        HttpResponse res = http.send(req);
        
        if(res.getStatusCode() == 200){           
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
            //{"animal":{"id":1,"name":"chicken","eats":"chicken food","says":"cluck cluck"}}
            Map<String, Object> nme = (Map<String, Object>) results.get('animal');
            rs = string.valueOf(nme.get('name'));
            system.debug('Debug: '+rs);
        }
        return rs;
    }
}