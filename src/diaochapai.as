package
{
	import configs.Config;
	import configs.PartTypeManager;
	
	import data.Data;
	import data.Page;
	import data.parts.PartMatrix;
	import data.parts.PartMatrixOption;
	import data.parts.PartSelect;
	import data.parts.PartSelectOption;
	import data.parts.PartSeparator;
	import data.parts.PartText;
	
	import events.URLEvent;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	
	import org.osmf.layout.AbsoluteLayoutFacet;
	
	import scene.SceneMC;
	import scene.TmpScene;
	
	import utils.DisposeXMLData;
	import utils.GetUrlData;
	
	[SWF(width="800", height="500", frameRate="30",backgroundColor= "#cccccc")]
	public class diaochapai extends Sprite
	{
		
		private var xdata:Data;
		
		private var getUrlData:GetUrlData;
		private var disposeXMLData:DisposeXMLData;
		
		private var sceneMC:SceneMC;
		
		public function diaochapai()
		{
			xdata = Data.instance;
			xdata.init();			
			
			var tArr:Array = Config.tempUrl.split(/\//);
			var sn:String = tArr[4];			
			var xmlUrl:String = Config.getXMLDataUrl+sn;
			getUrlData = new GetUrlData(xmlUrl);
			getUrlData.addEventListener(URLEvent.DISPATCHURLDATA, getXMLHandler);
			getUrlData.init();
		}
		private function getXMLHandler(e:URLEvent):void
		{
			getUrlData.removeEventListener(URLEvent.DISPATCHURLDATA, getXMLHandler);
			getUrlData=null;
			var loader:URLLoader = URLLoader(e.data);			
			xdata.xml = new XML(loader.data);
			//disposeXML(xdata.xml);
			disposeXMLData = new DisposeXMLData(xdata.xml);
			disposeXMLData.addEventListener(Event.COMPLETE, xmlDataHandler);
			disposeXMLData.init();
		}
		private function xmlDataHandler(e:Event):void
		{
			disposeXMLData.removeEventListener(Event.COMPLETE, xmlDataHandler);
			//xml数据处理完成
			/*sceneMC = new SceneMC();
			this.addChild(sceneMC);*/
			var tmps:TmpScene = new TmpScene();
			this.addChild(tmps);
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}