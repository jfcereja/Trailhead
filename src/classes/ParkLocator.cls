public class ParkLocator {
    public static List<String> country(String city){
        List<String> tst = new List<String>();
        ParkService.ParksImplPort getParks = new ParkService.ParksImplPort();
        List<String> listParks = getParks.byCountry(city);
        system.debug(listParks);
        
        return listParks;
    }
}