package data.parts
{
	public class Part
	{
		/**
		 *栏目，父级
		 */		
		public function Part(obj:Object)
		{
			rank = obj.rank;
			type = obj.type;
			create_time = obj.create_time;
			update_time = obj.update_time;
			sn = obj.sn;
		}
		/**
		 * 栏目索引 
		 */		
		public var rank:int;
		/**
		 * 栏目类别 
		 */		
		public var type:String;
		/**
		 * 栏目sn 
		 */		
		public var sn:String;		
		/**
		 * 创建时间 
		 */		
		public var create_time:String;
		/**
		 * 刷新时间 
		 */		
		public var update_time:String;
		
		
		
		
		
		
		
		
		
		
		
		
	}
}