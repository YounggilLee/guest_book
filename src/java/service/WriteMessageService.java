/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.MessageDao;
import java.sql.Connection;
import java.sql.SQLException;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import model.Message;

/**
 *
 * @author yglee
 */
public class WriteMessageService {
	private static WriteMessageService instance = new WriteMessageService();

	public static WriteMessageService getInstance() {
		return instance;
	}

	private WriteMessageService() {
	}

	public void write(Message message) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			MessageDao messageDao = MessageDao.getInstance();
			messageDao.insert(conn, message);
		} catch (SQLException e) {
			throw new ServiceException(
					"fail to write a message: " + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn);
		}
	}

}
