package com.playcrab.socketio
{
	public class Message extends Object
	{
		//msg.type 'type'=> 0  '消息类型，1 -世界聊天，2- 公会聊天，3 系统，4 系统通知，默认0 玩家一对一或1对多聊天
		public var t:int = 0;
		public static const MSG_WORLD:int = 1,MSG_QUN:int = 2,MSG_SYS:int = 3,MSG_NOTICE:int = 4,MSG_USER:int = 0;

		public function Message(type:int = MSG_USER)
		{
			this.t = type;
		}
	}
}