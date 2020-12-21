package data;

public class Flight {
    String flag;
    String company;
    String flightnumber;

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getFlightnumber() {
        return flightnumber;
    }

    public void setFlightnumber(String flightnumber) {
        this.flightnumber = flightnumber;
    }

    public String getAircraftmodel() {
        return aircraftmodel;
    }

    public void setAircraftmodel(String aircraftmodel) {
        this.aircraftmodel = aircraftmodel;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getDeparturetime() {
        return departuretime;
    }

    public void setDeparturetime(String departuretime) {
        this.departuretime = departuretime;
    }

    public String getLandingtime() {
        return landingtime;
    }

    public void setLandingtime(String landingtime) {
        this.landingtime = landingtime;
    }

    public String getAirportofdeparture() {
        return airportofdeparture;
    }

    public void setAirportofdeparture(String airportofdeparture) {
        this.airportofdeparture = airportofdeparture;
    }

    public String getLandingAirport() {
        return LandingAirport;
    }

    public void setLandingAirport(String landingAirport) {
        LandingAirport = landingAirport;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getRemainingtickets() {
        return remainingtickets;
    }

    public void setRemainingtickets(int remainingtickets) {
        this.remainingtickets = remainingtickets;
    }

    String aircraftmodel;
    String duration;
    String departuretime;
    String landingtime;
    String airportofdeparture;
    String LandingAirport;
    int price;
    int remainingtickets;
}
