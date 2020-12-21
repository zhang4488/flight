package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    public Connection getConnection() throws SQLException {
        //注册驱动类
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        //获取连接
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/flayflayflay?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=Asia/Shanghai&&"
                + "user=root&password=691011");

        return con;

    }


}
