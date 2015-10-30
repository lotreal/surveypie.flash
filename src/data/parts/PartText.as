package data.parts
{
	public class PartText extends Part
	{
		/**
		 * 填空/问答题 
		 * formType的属性：Input是填空题 textarea是问答题
		 */		
		public function PartText(obj:Object)
		{
			super(obj);
			
			isRequire = obj.is_require;
			formType = obj.form_type;
			formHeight = obj.form_height;
			formWidth = obj.form_width;
			leastInput = obj.least_input;
			mostInput = obj.most_input;
			subject = obj.subject;
			intro = obj.intro;
			
			validator = obj.validator;
		}
		
		/**
		 * 是否必填  0 or 1
		 */		
		public var isRequire:int
		/**
		 * Input是填空题 textarea是问答题
		 */		
		public var formType:String;
		/**
		 *form_type是textarea时的高度 
		 */		
		public var formHeight:int;
		/**
		 *文本框宽度
		 */		
		public var formWidth:int;
		/**
		 *至少填写多少字 0表示不限制 
		 */		
		public var leastInput:int;
		/**
		 *最多填写多少字 0表示不限制 
		 */		
		public var mostInput:int;		
		/**
		 * 验证限制   email/number/date 现只能填以上三种
		 */		
		public var validator:String;
		
		/**
		 * 问题 
		 */		
		public var subject:String;
		/**
		 * 问题的描述 
		 */		
		public var intro:String;
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}