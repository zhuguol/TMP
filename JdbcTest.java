package testdemo;

import oracle.jdbc.driver.OracleDriver;
import java.sql.*;
import java.util.Properties;

public class JdbcTest
{
    public static void main(String[] args) {
        Connection connect = null;
        PreparedStatement preState = null;
        ResultSet resultSet = null;

        try {
         
            Class.forName("oracle.jdbc.OracleDriver");
			connect = DriverManager.getConnection("jdbc:oracle:thin:@//cnrac48-scan.gss5.hk.hsbc:2001/hbcnaml.cn.hsbc", "hbcnaml", "oracle");
			preState = connect.prepareStatement("select * from FUNCTION_INFO T where T.FUNCID = ?");
            preState.setInt(1, 10);
            resultSet = preState.executeQuery();
            while (resultSet.next())
            {
                int id = resultSet.getInt("FUNCID");
                String name = resultSet.getString("FUNNAME");
                System.out.println(id+"-----"+name);  //打印输出结果集
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            //第六步：关闭资源
                try {
                    if (resultSet!=null) resultSet.close();
                    if (preState!=null) preState.close();
                    if (connect!=null) connect.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
        }
    }
}
