package data.parts
{
	public class PartMatrixOption extends Part
	{
		/**
		 *组合选择题选项
		 */		
		public function PartMatrixOption(obj:Object)
		{
			super(obj);
			
			direction = obj.direction;
			label = obj.label;
			width = obj.width;
		}
		/**
		 *Row 行选项 col 列选项 
		 */		
		public var direction:String
		/**
		 *选项文字 
		 */		
		public var label:String
		
		public var width:Number;
		
		
		
		
		
		
		
		
		
	}
}