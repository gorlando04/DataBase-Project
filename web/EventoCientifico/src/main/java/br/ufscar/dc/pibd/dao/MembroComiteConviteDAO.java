package br.ufscar.dc.pibd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.ufscar.dc.pibd.domain.MembroComiteConvite;

public class MembroComiteConviteDAO extends GenericDAO {

    public void insert(MembroComiteConvite mcc){
        String sql = "call InsertMembroComiteConvite(?)";

        try{
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(3, mcc.getIdCompostoPor());
          
            statement.close();
            conn.close();
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
    }

    public MembroComiteConvite get(Long id){
        MembroComiteConvite mcc = null;

        String sql = "SELECT * FROM MembroComiteConvite WHERE idCompostoPor = ?";

        try{
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next()){
                mcc = new MembroComiteConvite(id);
            }
            resultSet.close();
            statement.close();
            conn.close();
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
        return mcc;
    }

    public List<MembroComiteConvite> getAll(){
        List<MembroComiteConvite> listaCm = new ArrayList<>();
        String sql = "SELECT * FROM MembroComiteConvite";

        try{
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            while(resultSet.next()){
                Long idCompostoPor = resultSet.getLong("idCompostoPor");
    
                MembroComiteConvite mcc = new MembroComiteConvite(idCompostoPor);
                listaCm.add(mcc);
            }
            resultSet.close();
            statement.close();
            conn.close();
        }catch(SQLException e ){
            throw new RuntimeException(e);
        }
        return listaCm;
    }

    public void update(MembroComiteConvite mcc){
        String sql = "call UpdateMembroComiteConvite(?)";

        try{
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(3, mcc.getIdCompostoPor());
            statement.executeUpdate();

            statement.close();
            conn.close();
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
    }

}
