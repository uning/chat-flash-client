package
{
	import com.adobe.serialization.json.*;
	import com.playcrab.socketio.*;
	import com.playcrab.socketio.WebSocket;
	
	import flash.display.Sprite;
	
	public class nodechat extends Sprite
	{
		private var fs:FlashSocket;
		private var ui:GuiTool
		public function nodechat()
		{
			ui = new GuiTool(this)
			var msg:Message = new Message(Message.MSG_USER);
		//	msg["c"] = 'it is me' 
		//	trace(JSON.encode(msg));
		//	return;
			fs = new FlashSocket("192.168.1.50:8880",'cid=3734974386_586896101&name=test100')
			fs.addEventListener(FlashSocketEvent.CONNECT, onConnect);
			fs.addEventListener(FlashSocketEvent.EVENT, onEvent);
			fs.addEventListener(FlashSocketEvent.MSG_JSON, onMessageJson); 
			fs.addEventListener(FlashSocketEvent.MSG_STR, onMessageStr);
			fs.addEventListener(FlashSocketEvent.IO_ERROR, onError); 
			fs.addEventListener(FlashSocketEvent.SECURITY_ERROR, onError); 
			fs.addEventListener(FlashSocketEvent.CONNECT_ERROR, onError); 
			fs.addEventListener(FlashSocketEvent.CLOSE, onClose); 
			
			
			
			
		}
		
		/**
		 *  msg.t 't'=> 0  '消息类型，1 -世界聊天，2- 公会聊天，3 系统，4 系统通知，默认0 玩家一对一或1对多聊天
		 */
		protected function onMessageJson(event:FlashSocketEvent):void{
			ui.message('recv json msg: ' +  JSON.encode(event.data));
		//	fs.send(event.data);
		}
		
		protected function onMessageStr(event:FlashSocketEvent):void{
			ui.message('recv str msg: ' +  event.data);
			//	fs.send(event.data);
		}
		
		
		//时间
		protected function onEvent(event:FlashSocketEvent):void{
			trace('we got a event: ' +  JSON.encode(event.data));
			ui.message('recv event: ' +  JSON.encode(event.data));
		//	fs.send(event.data);
			
		}
		
		protected function onConnect(event:FlashSocketEvent):void {
			
			trace("onConnect",event)  
			ui.message('connect: ' +  JSON.encode(event.data));
			fs.send({hello:'world'});
			
		}
		
		protected function onError(event:FlashSocketEvent):void {
			
			trace("onError",event)   
			ui.message('onError: ' +  JSON.encode(event));
			
		}
		protected function onClose(event:FlashSocketEvent):void {
			ui.message('onClose: ' +  JSON.encode(event));
			trace("onClose",event)    
			
		}	
	}
}