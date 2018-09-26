package com.fh.util;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.rmi.UnknownHostException;


public class udpserver {

	    private static DatagramSocket socket;  
	    private DatagramPacket packet;  
	    private static int port = 8001;  
	   
	    
	    public static void main(String[] args) {  
	        udpserver server = new udpserver();  
	        try {  
	            socket = new DatagramSocket(port);  
	            while (true){  
	                DatagramPacket packet = server.receiveMessage(socket);  
	                server.sendMessage(socket,packet);  
	            }  
	        } catch (SocketException e) {  
	            e.printStackTrace();  
	        }  
	  
	    }  
	    public void sendMessage(DatagramSocket socket,DatagramPacket receive_packet){  
	        try {  
	            byte[] datas = "hello this is udpserver echo".getBytes();  
	            //receive_packet接受到的客服端的ip地址和端口  
	            packet = new DatagramPacket(datas,datas.length,receive_packet.getAddress(),receive_packet.getPort());  
	            socket.send(packet);  
	  
	        } catch (UnknownHostException e) {  
	            e.printStackTrace();  
	        } catch (SocketException e) {  
	            e.printStackTrace();  
	        } catch (IOException e) {  
	            e.printStackTrace();  
	        }  
	    }  
	    
	    public DatagramPacket receiveMessage(DatagramSocket socket){  
	        try {  
	            byte[] data = new byte[100];  
	            packet = new DatagramPacket(data,data.length);  
	            socket.receive(packet);  
	            System.out.println(new String(packet.getData(),0,packet.getLength()));  
	  
	        } catch (IOException e) {  
	            e.printStackTrace();  
	        }  
	        //返回接受到的客服端的ip地址和端口  
	        return packet;  
	    }  
	 

	
	
	
	
}
