import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

import javax.sound.sampled.ReverbType;

/*  Γράψτε ένα πρόγραμμα Java το οποίο δέχεται από το χρήστη τον κωδικό παραγγελίας και
εκτυπώνει τα στοιχεία της παραγγελίας (το τιμολόγιο δηλαδή). */

public class OrderDetails {
	
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
    
    public static void printOrderDetails() throws Exception {
    	
    	try{
            connect();
            Scanner sc = new Scanner(System.in);
            System.out.println("Please enter the order code for the order you want details about. ");
            int ordercode = sc.nextInt();
            sc.nextLine();

            String query = "SELECT * FROM  " + "[order] " + "WHERE ordercode = " + ordercode;
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            System.out.println("The details for the order with the ordercode " + ordercode + " are the following:");
            //System.out.println(statement.executeQuery(query));
            
            resultSet.next();
           	System.out.println("Order code: " + resultSet.getInt("ordercode"));
           	System.out.println("Date of order: " + resultSet.getDate("orderdate"));
           	System.out.println("Date of shipping: " + resultSet.getDate("shippingdate"));
           	System.out.println("Customer code: " + resultSet.getInt("customercode"));
           	
           	query = "SELECT C.productcode, P.[name], P.description, P.price, C.quantity  FROM " + " consistsof AS C, [order] AS O, product AS P"
            		+ " WHERE C.ordercode = O.ordercode AND C.productcode = P.productcode AND O.ordercode = " + ordercode; 
            statement = connection.createStatement();
            resultSet = statement.executeQuery(query);
            
            System.out.println("Product code     Product name     Product description     Product price     Product quantity");
            while(resultSet.next()) {
            	System.out.println(resultSet.getInt("productcode") +"             "+ resultSet.getString("name")
            			+" "+ resultSet.getString("description") +" "+ resultSet.getDouble("price") +" "+ resultSet.getInt("quantity"));
            	
            }
            System.out.println("---------------------------------------------------------------------------");
            query = "SELECT SUM(P.price * C.quantity) AS SUM FROM product AS P, consistsof AS C, [order] AS O"
            		+ " WHERE P.productcode = C.productcode AND C.ordercode = O.ordercode AND O.ordercode = " + ordercode;
            statement = connection.createStatement();
            resultSet = statement.executeQuery(query);
            while(resultSet.next()) {
            	System.out.println("TOTAL: " + resultSet.getDouble("SUM"));
            }
            
            
            System.exit(0);
            sc.close();

        } catch(Exception e) {
            System.out.println("Something went wrong/printOrderDetails() " + e.getMessage());
            return;
        }

    }
}
