package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	
	import flashx.textLayout.accessibility.TextAccImpl;
	
	public class GuiTool
	{
		private var _useName:TextField;
		private var _inputText:TextField;
		private var _outputText:TextField;
		private var _messageBtn:Sprite;
		
		private var _clearBtn:Sprite;
		
		public function GuiTool(par:Sprite)
		{
			_messageBtn = createBtn();
			_useName = createText(5,10,50,20);
			_inputText = createText(70,10,200,20);
			_inputText.type= TextFieldType.INPUT;
			
			_outputText = createText(5,40,600,500);
			_messageBtn.addEventListener(MouseEvent.MOUSE_DOWN,sendMessage);
			
			par.addChild(_messageBtn);
			par.addChild(_useName);
			par.addChild(_inputText);
			par.addChild(_outputText);
		}
		
		private function sendMessage(e:MouseEvent):void
		{
			//	trace(_inputText.text);
			outMessage()
			
		}
		
		private function outMessage():void
		{
			var str:String = _useName.text + _inputText.text + "\n"
			_outputText.appendText(str)
			_inputText.text = "";
		}
		
		public function message(value:String,from:String = 'System'):void
		{
			var str:String= from + ":" + value + "\n"
			_outputText.appendText(str)
		}
		
		
		public function setUseName(value:String):void
		{
			_useName.text = value+":"
		}
		
		private function createText(x:Number,y:Number,wid:Number,hei:Number):TextField
		{
			var txt:TextField = new TextField();
			txt.x = x;
			txt.y = y;
			txt.border = true;
			txt.width = wid;
			txt.height = hei;
			return txt
		}
		
		private function createBtn(x:Number=400,y:Number=10):Sprite
		{
			var btn:Sprite = new Sprite()
			btn.buttonMode = true;
			btn.graphics.beginFill(0xFFCC00);
			btn.graphics.drawRect(0, 0, 30, 15);
			btn.graphics.endFill();
			btn.x = x
			btn.y = y
			return btn;
		}
		
		public function get messageBtn():Sprite
		{
			return _messageBtn;
		}
		
		public function get useName():TextField
		{
			return _useName;
		}
		
		public function get inputText():TextField
		{
			return _inputText;
		}
		
		public function get outputText():TextField
		{
			return _outputText;
		}
		
		
	}
}