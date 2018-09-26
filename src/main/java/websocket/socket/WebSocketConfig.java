package websocket.socket;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
@Configuration
@EnableWebSocket // 开启websocket
public class WebSocketConfig implements WebSocketConfigurer {
	@Autowired
	private WebSocketHander webSocketHander;

	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		System.out.println("======================websocket启动成功========================");
		registry.addHandler(webSocketHander, "/echo");

	}
}