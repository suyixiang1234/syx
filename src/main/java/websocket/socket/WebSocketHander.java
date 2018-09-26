package websocket.socket;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

import websocket.rooms.RoomHandler;
@Component
public class WebSocketHander implements WebSocketHandler {
	@Autowired
	private RoomHandler roomHandler;
	private static final Logger logger = Logger.getLogger(WebSocketHander.class);
	//public static ArrayList<WebSocketSession> allSession = new ArrayList<WebSocketSession>();
	public static HashMap<String, WebSocketSession> userSession = new HashMap<String, WebSocketSession>();
	
	// 初次链接成功执行
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//allSession.add(session);
		System.out.println("新的链接加入");
		// 发送链接成功提醒
		session.sendMessage(new TextMessage("owebsokect链接成功"));
		//sendMessageToAllSession(new TextMessage("owebsokect链接成功"));
	}

	private void sendMessageToAllSession(TextMessage message) throws IOException {
		// TODO Auto-generated method stub
		System.out.println("发送消息"+message);
		
		
		
		//发送信息给全部在线用户
		/*for (WebSocketSession session : allSession) {
			session.sendMessage(message);
		}*/
	}

	// 接受消息处理消息

	public void handleMessage(WebSocketSession webSocketSession, WebSocketMessage<?> webSocketMessage)
			throws Exception {
		//处理用户与webSocketSession绑定
		userSession.put((String) webSocketMessage.getPayload(), webSocketSession);
		System.out.println("接受消息"+ webSocketMessage.getPayload());
		
	}

	public void handleTransportError(WebSocketSession webSocketSession, Throwable throwable) throws Exception {
		logger.debug("链接出错，关闭链接......");
		error(webSocketSession);
	}

	private void error(WebSocketSession session) throws IOException, InterruptedException {
		// TODO Auto-generated method stub
		Collection<WebSocketSession> col = userSession.values();
		col.remove(session);
		//roomHandler.error(session);//处理异常用户

	}

	public void afterConnectionClosed(WebSocketSession webSocketSession, CloseStatus closeStatus) throws Exception {
		logger.debug("链接关闭......" + closeStatus.toString());
		error(webSocketSession);
	}

	public boolean supportsPartialMessages() {
		// TODO Auto-generated method stub
		return false;
	}

}