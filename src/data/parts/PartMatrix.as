package data.parts
{
	import org.osmf.net.dynamicstreaming.INetStreamMetrics;

	public class PartMatrix extends Part
	{
		/**
		 *组合选择题
		 */		
		public function PartMatrix(obj:Object)
		{
			super(obj);
			
			isRequire = obj.is_require;
			formType = obj.form_type;
			hasScore = obj.has_score;
			preColumnOneResponse = obj.pre_column_one_response;
			subject = obj.subject;
			intro = obj.intro;
			
			matrixOptionArr=[];
		}
		/**
		 * 是否必填  0 or 1
		 */			
		public var isRequire:int;
		/**
		 * Radio 单选 checkbox多选
		 */	
		public var formType:String;
		/**
		 * 
		 */		
		public var hasScore:int
		/**
		 * 每列只能选一项
		 */		
		public var preColumnOneResponse:int
		/**
		 * 问题 
		 */		
		public var subject:String;
		/**
		 * 问题描述 
		 */		
		public var intro:String;
		
		
		/**
		 * 本题的选项，数组里保存选项的sn 
		 */		
		public var matrixOptionSNArr:Array;
		
		/**
		 * 本题的选项，保存数据 
		 */		
		public var matrixOptionArr:Array;
		
		
	}
}