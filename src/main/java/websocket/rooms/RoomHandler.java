package websocket.rooms;

import java.io.IOException;
import java.util.HashMap;

import org.springframework.stereotype.Service;
import org.springframework.web.socket.WebSocketSession;

@Service
public class RoomHandler {
	private HashMap<WebSocketSession, String> sessionNumber = new HashMap<WebSocketSession, String>();

	public void creatRoom(WebSocketSession session) throws IOException, InterruptedException {
	
	
	}

	private int creatRoomNumber() {
		return 0;
	}

	public void receiveMessage(WebSocketSession session, String request) throws 
	IOException, InterruptedException {
		
		
	}

	private void joinRoom(WebSocketSession session, String number) throws IOException, InterruptedException {
		
		
	}

	public void error(WebSocketSession session) throws IOException, InterruptedException {
		
	}

}
