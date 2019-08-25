package testdemo;

import oracle.jdbc.driver.OracleDriver;
import java.sql.*;
import java.util.Properties;

public class JdbcTest
{
    public static void main(String[] args) {
        Connection connect = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            //第一步：注册驱动
            //第一种方式：类加载(常用)
            //Class.forName("oracle.jdbc.OracleDriver");
			
            //第一种方式：利用DriverManager（常用）
            //connect = DriverManager.getConnection("jdbc:oracle:thin:@//cnrac48-scan.gss5.hk.hsbc:2001/hbcnaml.cn.hsbc", "hbcnaml", "oracle");

            //测试connect正确与否
            System.out.println(connect);  


            //第三步：获取执行sql语句对象
  

            //第二种方式：PreStatement
            PreparedStatement preState = connect.prepareStatement("select * from FUNCTION_INFO T where T.FUNCID = ?");


            //第二种方式：
            preState.setInt(1, 10);//1是指sql语句中第一个？,  2是指第一个？的values值
            //resultSet = preState.executeQuery();        //执行查询语句
            

            //第五步：处理结果集
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
                    if (statement!=null) preState.close();
                    if (connect!=null) connect.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
        }
    }
}
