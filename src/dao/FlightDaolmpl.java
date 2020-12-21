package dao;

import data.Flight;
import data.RoteDate;
import db.DBConnection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class FlightDaolmpl implements FlightDao {
    DBConnection db = new DBConnection();
    @Override
    public String flightnumber(String tpoint, String lpoint, String ttime) {
        String flight=null;
        //获取数据库连接
        try {
            //获取数据库连接
            Connection con = db.getConnection();

            //执行查询
            Statement st = con.createStatement();
            ResultSet rs  = st.executeQuery("select flag FROM roteanddate WHERE Takeoffpoint ='"+tpoint+"' and Landingpoint='"+lpoint+"' and riqi='"+ttime+"'");
            if (rs.next()){
                flight = rs.getString("flag");
            }else {
                flight=null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flight;
    }

    @Override
    public List<Flight> getflight(String flightnumber) {
        List<Flight> flights = new ArrayList<Flight>();
        try {
            Connection con = db.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from flight where flag='"+flightnumber+"'");

            while (rs.next()) {
                Flight flight = new Flight();
                flight.setFlag(rs.getString("flag"));
                flight.setCompany(rs.getString("company"));
                flight.setFlightnumber(rs.getString("flightnumber"));
                flight.setAircraftmodel(rs.getString("aircraftmodel"));
                flight.setDuration(rs.getString("duration"));
                flight.setDeparturetime(rs.getString("departuretime"));
                flight.setLandingtime(rs.getString("landingtime"));
                flight.setAirportofdeparture(rs.getString("airportofdeparture"));
                flight.setLandingAirport(rs.getString("landingAirport"));
                flight.setPrice(rs.getInt("price"));
                flight.setRemainingtickets(rs.getInt("remainingtickets"));
                flights.add(flight);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flights;
    }

    @Override
    public RoteDate getrotedate(String flag) {
        RoteDate roteDate = new RoteDate();
        try {
            Connection con = db.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from roteanddate where flag='"+flag+"'");

            if (rs.next()) {
                roteDate.setTakeofpoint(rs.getString("Takeoffpoint"));
                roteDate.setLandingpoint(rs.getString("Landingpoint"));
                roteDate.setRiqi(rs.getString("riqi"));
                roteDate.setFlag(rs.getString("flag"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return roteDate;
    }

    @Override
    public Flight findflight(String flightnumber) {
        Flight flight = new Flight();
        try {
            Connection con = db.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from flight where flightnumber='"+flightnumber+"'");

            if (rs.next()) {
                flight.setFlag(rs.getString("flag"));
                flight.setCompany(rs.getString("company"));
                flight.setFlightnumber(rs.getString("flightnumber"));
                flight.setAircraftmodel(rs.getString("aircraftmodel"));
                flight.setDuration(rs.getString("duration"));
                flight.setDeparturetime(rs.getString("departuretime"));
                flight.setLandingtime(rs.getString("landingtime"));
                flight.setAirportofdeparture(rs.getString("airportofdeparture"));
                flight.setLandingAirport(rs.getString("landingAirport"));
                flight.setPrice(rs.getInt("price"));
                flight.setRemainingtickets(rs.getInt("remainingtickets"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flight;
    }
}
