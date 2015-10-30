package data.parts
{
	public class PartSelectOption extends Part
	{
		/**
		 * 选择题选项
		 */		
		public function PartSelectOption(obj:Object)
		{
			super(obj);
			
			mime = obj.mime
			score = obj.score
			allowSpecify = obj.allow_specify;
			inputWidth = obj.input_width;
			leastInput = obj.least_input;
			mostInput = obj.most_input;
			label = obj.label;
			url = obj.url
		}
		/**
		 * 选项类型， text文字/plain图片
		 */		
		public var mime:String;
		/**
		 * 
		 */		
		public var score:int;
		/**
		 * 是否允许填写更多信息，比如“其它，请注明”0不允许，1允许
		 */		
		public var allowSpecify:int=0;
		/**
		 * 输入框的宽度
		 */		
		public var inputWidth:int;
		/**
		 * 最少填写多少字 0表示不限制
		 */		
		public var leastInput:int;
		/**
		 * 最多填写多少字 0表示不限制
		 */		
		public var mostInput:int;
		
		/**
		 * 选项文字
		 */
		public var label:String;
		
		/**
		 * 图片地址，这个选项是带图片的
		 */
		public var url:String
		
		
		
		
		
		
		
	}
}