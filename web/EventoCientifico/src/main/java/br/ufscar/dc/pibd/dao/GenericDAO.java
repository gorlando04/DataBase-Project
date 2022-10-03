package br.ufscar.dc.pibd.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

abstract public class GenericDAO {

	public GenericDAO() {
        try {
            
        	/* Setup Banco de dados Derby */
        	
        	// Class.forName("org.apache.derby.jdbc.ClientDriver");
            
        	/* Setup Banco de dados MySQL */
        	
        	Class.forName("org.postgresql.Driver");
        	
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    protected Connection getConnection() throws SQLException {
    	
    	/* Conexão banco de dados Derby */
    	
    	/* 
    	 * String url = "jdbc:derby://localhost:1527/Livraria";
    	 */
    	
    	/* Conexão banco de dados PostgreSQL */
    	
    	String url = "jdbc:postgresql://localhost:5432/eventocientifico";
    	
    	return DriverManager.getConnection(url, "postgres", "221n5ss@1");
    }
}
