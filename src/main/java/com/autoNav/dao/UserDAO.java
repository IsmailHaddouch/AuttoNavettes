package com.autoNav.dao;

import java.sql.*;

import com.autoNav.jdbc.DBConnection;
import com.autoNav.model.User;

public class UserDAO {
	
	public User getUserByUsername(String username) {
		User user = null;
		String sql = "SELECT * FROM users WHERE username = ?;";
		
		try(Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(sql)){
			
			ps.setString(1, username);
			try(ResultSet rs = ps.executeQuery()){
				if(rs.next()) {
					user = new User();
					user.setId(rs.getInt("id"));
					user.setUsername(rs.getString("username"));
					user.setPassword(rs.getString("password"));
					user.setRole(rs.getString("role"));
				}
			}
			
		}catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
	}
	
	public boolean addUser(User  user) {
		String sql = "INSERT INTO users (username, password, role) VALUES (?, ?, ?)";
		try(Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(sql)){
			
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getRole());
			return ps.executeUpdate() > 0;
		}catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
	}
	
	public boolean updateUser(User user) {
        String sql = "UPDATE users SET username = ?, password = ? WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setInt(3, user.getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
