package utils
{
	import events.URLEvent;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;

	public class GetUrlData extends EventDispatcher
	{
		private var xmlUrl:String
		/**
		 * 通过Get方法从一个url获取到数据
		 */		
		public function GetUrlData(url:String)
		{
			xmlUrl = url;				
		}
		public function init():void
		{
			var request:URLRequest = new URLRequest(xmlUrl);
			request.method = URLRequestMethod.GET;
			
			var loader:URLLoader = new URLLoader();
			configureListeners(loader);
			loader.load(request);
		}
		private function configureListeners(dispatcher:IEventDispatcher):void
		{
			dispatcher.addEventListener(Event.COMPLETE, completerHandler);
		}
		private function completerHandler(e:Event):void
		{
			var urlE:URLEvent = new URLEvent(URLEvent.DISPATCHURLDATA);
			urlE.data = e.target;
			this.dispatchEvent( urlE );
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}