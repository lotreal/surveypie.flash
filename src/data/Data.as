package data
{
	public class Data
	{
		private static var _instance:Data
		public function Data(enforcer:DataEnforcer){}
		public  static function get instance():Data{
			if(Data._instance == null){
				Data._instance = new Data(new DataEnforcer);
			}
			return _instance;
		}	
		
		/**
		 * 获取的调查表原始数据，为xml格式 
		 */
		public var xml:XML;
		/**
		 * 二维数组， 保存整个调查表的数据， 按页保存, 
		 */		
		public var pageDataArr:Array;
		
		public function init():void
		{
			pageDataArr = [];
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}
class DataEnforcer{
}