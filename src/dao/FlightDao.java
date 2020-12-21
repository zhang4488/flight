package dao;

import data.Flight;
import data.RoteDate;

import java.util.List;

public interface FlightDao {
    String flightnumber(String tpoint, String lpoint, String ttime);

    List<Flight> getflight(String flightnumber);

    RoteDate getrotedate(String flag);

    Flight findflight(String flightnumber);
}
