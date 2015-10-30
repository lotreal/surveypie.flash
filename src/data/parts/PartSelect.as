package data.parts
{
	public class PartSelect extends Part
	{
		/**
		 * 选择题
		 * 单选题的form_type是radio或select，多选题的form_type是checkbox
		 */		
		public function PartSelect(obj:Object)
		{
			super(obj);
			
			isRequire = obj.is_require;
			formType = obj.form_type;
			columnPerRow = obj.column_per_row;
			leastChoice = obj.least_choice;
			mostChoice = obj.most_choice;
			shuffleOptions = obj.shuffle_options;
			subject = obj.subject;
			intro = obj.intro;
			
			selectOptionArr = [];
		}
		
		/**
		 * 是否必填  0 or 1
		 */		
		public var isRequire:int
		/**
		 * 单选题的form_type是radio或select，多选题的form_type是checkbox
		 */		
		public var formType:String;
		
		/**
		 * 用于组合选择题 matrix, 是否每列只能选一个， 0否，1是
		 */		
		public var columnPerRow:int;
		
		/**
		 *至少选择几项，多选题时有效，0表示不控制 
		 */		
		public var leastChoice:int;
		/**
		 *最多选择几项，多选题时有效，0表示不控制 
		 */		
		public var mostChoice:int;
		/**
		 *选项随机排列 
		 */		
		public var shuffleOptions:int;
		
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
		public var selectOptionSNArr:Array;
		
		/**
		 * 本题的选项，保存数据 
		 */		
		public var selectOptionArr:Array;
		
		
		
		
		
		
		
		
		
		
	}
}