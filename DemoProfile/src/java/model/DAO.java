/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class DAO extends DBContext {

    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        String query = "SELECT [id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "  FROM [dbo].[Account]";
        try (PreparedStatement st = connection.prepareStatement(query)) {
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Account p = new Account();
                    p.setId(rs.getInt("id"));
                    p.setUsername(rs.getString("username"));
                    p.setPassword(rs.getString("password"));
                    list.add(p);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Account getAccountById(int id) {
        String query = "SELECT [id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "  FROM [dbo].[Account]\n"
                + "  WHERE id = ?";

        try (PreparedStatement st = connection.prepareStatement(query)) {
            st.setInt(1, id);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    Account p = new Account();
                    p.setId(rs.getInt("id"));
                    p.setUsername(rs.getString("username"));
                    p.setPassword(rs.getString("password"));
                    return p;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Account authentication(String username, String password) {
        String query = "SELECT [id]\n"
                + "      ,[username]\n"
                + "  FROM [dbo].[Account]\n"
                + "  WHERE username = ? AND password = ?";

        try (PreparedStatement st = connection.prepareStatement(query)) {
            st.setString(1, username);
            st.setString(2, password);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    Account p = new Account();
                    p.setId(rs.getInt("id"));
                    p.setUsername(rs.getString("username"));
                    return p;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public Profile getProfile(int id) {
        String query = "SELECT [profileId]\n"
                + "      ,[email]\n"
                + "      ,[fullname]\n"
                + "      ,[phoneNumber]\n"
                + "      ,[address]\n"
                + "      ,[country]\n"
                + "      ,[state]\n"
                + "      ,[experience]\n"
                + "      ,[addDetail]\n"
                + "  FROM [dbo].[Profile]\n"
                + "  WHERE profileId = ?";

        try (PreparedStatement st = connection.prepareStatement(query)) {
            st.setInt(1, id);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    Profile p = new Profile();
                    p.setProfileId(rs.getInt("profileId"));
                    p.setEmail(rs.getString("email"));
                    p.setFullname(rs.getString("fullname"));
                    p.setPhoneNumber(rs.getString("phoneNumber"));
                    p.setAddress(rs.getString("address"));
                    p.setCountry(rs.getString("country"));
                    p.setState(rs.getString("state"));
                    p.setExperience(rs.getString("experience"));
                    p.setAddDetail(rs.getString("addDetail"));
                    
                    return p;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        DAO dao = new DAO();
        System.out.println(dao.authentication("tungld", "1234"));
    }
}
