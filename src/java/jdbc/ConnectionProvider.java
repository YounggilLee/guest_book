/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author yglee
 */
public class ConnectionProvider {

	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(
				"jdbc:apache:commons:dbcp:guestbook");
	}
}