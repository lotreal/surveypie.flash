package data
{
	public class Page
	{
		
		public function Page(obj:Object)
		{
			rank = obj.rank;
			type = obj.type;
			create_time = obj.create_time;
			update_time = obj.update_time;
			sn = obj.sn;
			
			partDataArr = [];
		}
		/**
		 *类型 
		 */		
		public var type:String;
		/**
		 * 页码索引
		 */		
		public var rank:int;
		/**
		 * 当前页的sn 
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
		
		/**
		 * 保存当前页的各种栏目的sn
		 */		
		public var partDataSNArr:Array;
		
		/**
		 * 保存当前页的各种栏目数据 
		 */		
		public var partDataArr:Array;
		
		
	}
}