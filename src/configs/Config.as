package configs
{
	public class Config
	{
		public function Config()
		{
		}
		
		public static const jwindowsWidth:Number = 760;
		public static const jwindowsHeight:Number = 460;
		
		public static const jcontentWidth:Number = 730;
		
		public static const tempUrl:String = 'http://www.diaochapai.com/swf/e13dc3a0-7895-4972-850e-adbd04177bdd/survey.swf'
		
		/**
		 * 使用post方法发送数据地址 
		 */		
		public static const postDataUrl:String = 'http://www.diaochapai.com/survey/flash?sn='
		
		/**
		 * 使用get方法根据sn获取对应调查表的数据xml形式 
		 */			
		public static const getXMLDataUrl:String = 'http://www.diaochapai.com/survey/xml?sn='
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}