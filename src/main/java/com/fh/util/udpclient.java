package com.fh.util;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.rmi.UnknownHostException;

public class udpclient {  
    private static DatagramSocket socket;  
    private DatagramPacket packet;  
    private int port = 8001;  
  
    public static void main(String agrs[]){  
        udpclient client = new udpclient();  
        try {  
            socket = new DatagramSocket();  
            while (true){  
                client.sendMessage();  
                client.receivMessage();  
            }  
        } catch (SocketException e) {  
            e.printStackTrace();  
        }  
  
  
    }  
    public void sendMessage(){  
        try {  
            byte[] datas = "hello this is client echo".getBytes();  
            packet = new DatagramPacket(datas,datas.length, InetAddress.getLocalHost(),port);  
            socket.send(packet);  
  
        } catch (SocketException e) {  
            e.printStackTrace();  
        } catch (UnknownHostException e) {  
            e.printStackTrace();  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
    }  
  
    public void receivMessage(){  
        try {  
            byte[] data = new byte[100];  
            packet = new DatagramPacket(data,data.length);  
            socket.receive(packet);  
            System.out.println(new String(packet.getData(),0,packet.getLength()));  
  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
    }  
}  