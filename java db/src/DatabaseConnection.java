import java.sql.*;
import java.util.Scanner;

public class DatabaseConnection {
    public static Connection connection = null;

    public static void connect() throws Exception {
        try {
//            String url = "jdbc:sqlserver://sql.dmst.aueb.gr:1433;";
//            String db = "databaseName=DB52;";
//            String user = "user=G552;";
//            String password = "password=385te3vf934;";
            connection = DriverManager.getConnection("jdbc:sqlserver://sqlserver.dmst.aueb.gr:1433;databaseName=DB52;user=G552;password=385te3vf934;");
            if (connection != null) {
                System.out.println("Connected to the database");
            }
            try{
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            } catch (java.lang.ClassNotFoundException e) {
                System.out.println("ClassNotFoundException");
            }
        } catch (Exception e) {
            System.out.println("Something went wrong/connect :" + e.getMessage());
        }
    }

    public boolean findId(int custcode) throws Exception {
        try{
            connect();
            String query = "SELECT  FROM " + "customer" + "WHERE customercode = " + custcode;
            Statement statement = connection.createStatement();
            ResultSet resultSet =  statement.executeQuery(query);

        } catch(Exception e) {
            System.out.println("Something went wrong/findId" + e.getMessage());
        }
        return false;
    }

    public static void delete() throws Exception {
        try{
            connect();
            Scanner sc = new Scanner(System.in);
            System.out.println("Please enter the customer code for the customer you wish to delete. ");
            int custcode = sc.nextInt();
            sc.nextLine();

            String query = "DELETE FROM " + "customer " + "WHERE customercode = " + custcode;
            Statement statement = connection.createStatement();
            statement.executeUpdate(query);
            System.out.println("Update executed successfully.\n"
            					+ "Customer with customercode: " + custcode + " was deleted");
            System.exit(0);
            sc.close();

        } catch(Exception e) {
            System.out.println("Something went wrong/delete() " + e.getMessage());
            return;
        }
    }

}
