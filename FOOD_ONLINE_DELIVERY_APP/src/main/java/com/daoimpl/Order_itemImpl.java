package com.daoimpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.Order_Itemdao;
import com.daomodel.Order_item;

public class Order_itemImpl implements Order_Itemdao{
	
	
	private static String url="jdbc:mysql://localhost:3306/project";
	private static  String username="root";
	private static String password="Raju@1229";
	String query1=  "INSERT INTO `order_item` (`order_id`, `menu_id`, `quantity`, `total_price`) VALUES (?,?,?,?)";
	String query2="UPDATE `order_item` SET `order_id` = ?,` menu_id` = ?, `quantity` = ?, `total_price` = ? WHERE `order_item_id` = ?";
	String query3="DELETE FROM `order_item` WHERE `order_item_id` = ?";
	String query4="SELECT * FROM order_item WHERE order_item_id = ?";
	String query5= "SELECT * FROM order_item";
	static Order_item order_item;


	@Override
	public void addOrder_item(Order_item order_item) {
		// TODO Auto-generated method stub
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			try {
				Connection con=DriverManager.getConnection(url,username,password);
			 PreparedStatement pstmt=	con.prepareStatement(query1);
			
			 pstmt.setInt(1, order_item.getOrder_id());
			 pstmt.setInt(2, order_item.getMenu_id());
			 pstmt.setInt(3, order_item.getQuantity());
			 pstmt.setInt(4, order_item.getTotal_price());
			  int res=pstmt.executeUpdate();
			  System.out.println("Order_items are added Sucessfully");
			 
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
		

	@Override
	public void updateOrder_item(Order_item order_item) {
		// TODO Auto-generated method stub
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			try {
				Connection con=DriverManager.getConnection(url,username,password);
				 PreparedStatement pstmt=con.prepareStatement(query2);
				
				 pstmt.setInt(1, order_item.getOrder_id());
				 pstmt.setInt(2, order_item.getMenu_id());
				 pstmt.setInt(3, order_item.getQuantity());
				 pstmt.setInt(4, order_item.getTotal_price());
				 pstmt.setInt(5, order_item.getOrder_item_id());
				  int res=pstmt.executeUpdate();
				  System.out.println("Order_item details are updated sucessfully");
				 
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteOrder_item(int order_item_id) {
		// TODO Auto-generated method stub
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			try {
				Connection con=DriverManager.getConnection(url,username,password);
			PreparedStatement pstmt=	con.prepareStatement(query3);
			pstmt.setInt(1, order_item_id);
			int res=pstmt.executeUpdate();
			System.out.println("order_item detaila are deleted suceesfully");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public Order_item getOrder_item(int order_item_id) {
		// TODO Auto-generated method stub
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			try {
				Connection con=DriverManager.getConnection(url, username,password);
			 PreparedStatement pstmt=	con.prepareStatement(query4);
			 pstmt.setInt(1, order_item_id);
			 ResultSet res=pstmt.executeQuery();
			 while(res.next()) {
				
				  int oi_id=res.getInt(1);
				  int order_id=res.getInt(2);
				  int menu_id=res.getInt(3);
				  int  quantity=res.getInt(4);
				  int total_price =res.getInt(5);
				
				  
				order_item  =new Order_item(order_id, menu_id, quantity, total_price);
				order_item.setOrder_item_id(oi_id);
				
				  
				  
			  }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return order_item;
		
		
	
	}

	@Override
	public List<Order_item> getAllOrder_item() {
		// TODO Auto-generated method stub
		List<Order_item> order_list=new ArrayList<Order_item>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			try {
				Connection con=DriverManager.getConnection(url, username, password);
		PreparedStatement 	pstmt=	con.prepareStatement(query5);
		ResultSet res=pstmt.executeQuery();
		 while(res.next()) {
			 
			  int order_item_id=res.getInt(1);
			  int order_id=res.getInt(2);
			  int menu_id=res.getInt(3);
			  int  quantity=res.getInt(4);
			  int total_price =res.getInt(5);
			
			  
			order_item  =new Order_item(order_id, menu_id, quantity, total_price);
			order_item.setOrder_item_id(order_item_id);
			order_list.add(order_item);
			
			  
			  
		  }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return order_list;
	}

}

