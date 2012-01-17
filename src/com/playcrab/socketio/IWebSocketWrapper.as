package com.playcrab.socketio {
	
	public interface IWebSocketWrapper {
		function getOrigin():String;
		function getCallerHost():String;
	 	function log(message:String):void;
		function fatal(message:String):void;
		function error(message:String):void;
	}
}