package com.mobileshop;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class MobileDAO {

    public static int addMobile(Mobile m) {
        int status = 0;

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO mobiles(brand,model,price,quantity,ram,storage,color) VALUES(?,?,?,?,?,?,?)"
            );

            ps.setString(1, m.getBrand());
            ps.setString(2, m.getModel());
            ps.setDouble(3, m.getPrice());
            ps.setInt(4, m.getQuantity());
            ps.setString(5, m.getRam());
            ps.setString(6, m.getStorage());
            ps.setString(7, m.getColor());

            status = ps.executeUpdate();

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}