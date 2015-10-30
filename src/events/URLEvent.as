package events
{
	import flash.events.Event;
	
	public class URLEvent extends Event
	{
		public function URLEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		/**
		 * 广播通过url获得的数据 
		 */		
		public static const DISPATCHURLDATA:String = 'dispatchURLData'
		public var data:Object;
		
		
		
		
		
		
		
		
		
		
		
	}
}