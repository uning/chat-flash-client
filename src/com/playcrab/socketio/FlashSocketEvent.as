package com.playcrab.socketio
{
	import flash.events.Event;
	
	public class FlashSocketEvent extends Event
	{
		public static const CLOSE:String = "close";
		public static const CONNECT:String = "connect";
		public static const MSG_STR:String = "MSG_STR";
		public static const MSG_JSON:String = "MSG_JSON";
		public static const EVENT:String = "event";
		public static const IO_ERROR:String = "ioError";
		public static const SECURITY_ERROR:String = "securityError";
		public static const DISCONNECT:String = "disconnect";
		public static const CONNECT_ERROR:String = "connectError";
		
		public var data:*;
		
		public function FlashSocketEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}