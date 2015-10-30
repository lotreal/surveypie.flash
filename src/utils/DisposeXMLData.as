package utils
{
	import configs.PartTypeManager;
	
	import data.Data;
	import data.Page;
	import data.parts.PartMatrix;
	import data.parts.PartMatrixOption;
	import data.parts.PartSelect;
	import data.parts.PartSelectOption;
	import data.parts.PartSeparator;
	import data.parts.PartText;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;

	public class DisposeXMLData extends EventDispatcher
	{
		private var xdata:Data;
		private var xml:XML;
		/**
		 * 把XML的信息转换成 按 页 存储的 各种 栏目数据
		 */		
		public function DisposeXMLData(xm:XML)
		{
			xdata = Data.instance;
			xml = xm;
		}
		public function init():void
		{
			for each ( var x:XML in xml.part ){
				//对每页的处理
				//trace (x.@rank)
				var obj:Object = new Object();
				obj.rank = int(x.@rank);
				obj.type = String(x.@type);
				obj.create_time = String(x.@create_time);
				obj.update_time = String(x.@update_time);
				obj.sn = String(x.@sn);
				var tPage:Page = new Page(obj);
				xdata.pageDataArr.push(tPage);				
				initXMLPageData(x, tPage);
			}
			trace (xdata.pageDataArr)
			this.dispatchEvent( new Event(Event.COMPLETE) );
		}
		/**
		 * 初始化一页的数据
		 */		
		private function initXMLPageData(xml:XML, p:Page):void
		{
			for each ( var x:XML in xml.part ){
				//处理本页数据
				//trace (x)
				var partType:String = String( x.@type );
				if ( partType == PartTypeManager.TYPESEPARATOR ){
					p.partDataArr.push( initPartSeparator(x) );
				}else if ( partType == PartTypeManager.TYPETEXT ){
					p.partDataArr.push( initPartText(x) );
				}else if ( partType == PartTypeManager.TYPESELECT ){
					p.partDataArr.push( initPartSelect(x) );
				}/*else if ( partType == PartTypeManager.TYPESELECTOPTION ){
					p.partDataArr.push( initPartSelectOption(x) );
				}*/else if ( partType == PartTypeManager.TYPEMATRIX ){
					p.partDataArr.push( initPartMatrix(x) );
				}/*else if ( partType == PartTypeManager.TYPEMATRIXOPTION){
					p.partDataArr.push( initPartMatrixOption(x) );
				}*/
			}
			//trace (p)
		}
		/**
		 *处理栏目父级的属性
		 */		
		private function disposeSuperP(obj:Object, xml:XML):void
		{
			obj.rank = int(xml.@rank);
			obj.type = String(xml.@type);
			obj.create_time = String(xml.@create_time);
			obj.update_time = String(xml.@update_time);
			obj.sn = String(xml.@sn);
		}
		/**
		 * 初始化一个栏目：分割线
		 */		
		private function initPartSeparator(xml:XML):PartSeparator
		{
			var obj:Object = new Object();
			disposeSuperP(obj, xml);			
			obj.title = String( xml.title )
			obj.intro = String( xml.intro );
			var part:PartSeparator = new PartSeparator(obj);
			return part;
		}
		/**
		 * 初始化一个栏目：填空/问答题
		 */
		private function initPartText(xml:XML):PartText
		{
			var obj:Object = new Object();
			disposeSuperP(obj, xml);
			obj.is_require = int( xml.@is_require );
			obj.form_type = String( xml.@form_type );
			obj.form_height = int( xml.@form_height );
			obj.form_width = int( xml.@form_width );
			obj.least_input = int( xml.@least_input );
			obj.most_input = int( xml.@most_input );
			obj.subject = String( xml.subject );
			obj.intro = String( xml.intro );
			obj.validator = String( xml.@validator );
			var part:PartText = new PartText(obj);
			return part;
		}
		/**
		 * 初始化一个栏目：选择题
		 */
		private function initPartSelect(xml:XML):PartSelect
		{
			var obj:Object = new Object();
			disposeSuperP(obj, xml);
			obj.is_require = int( xml.@is_require );
			obj.form_type = String( xml.@form_type );
			obj.column_per_row = int( xml.@column_per_row );
			obj.least_choice  = int( xml.@least_choice );
			obj.most_choice  = int( xml.@most_choice );
			obj.shuffle_options  = int( xml.@shuffle_options );
			obj.subject  = String( xml.subject );
			obj.intro  = String( xml.intro );
			var part:PartSelect = new PartSelect(obj);			
			for each ( var x:XML in xml.part ){
				if ( String( x.@type ) == PartTypeManager.TYPESELECTOPTION ){
					part.selectOptionArr.push( initPartSelectOption(x) );
				}
			}			
			return part;
		}
		/**
		 * 初始化一个栏目：选择题选项
		 */
		private function initPartSelectOption(xml:XML):PartSelectOption
		{
			var obj:Object = new Object();
			disposeSuperP(obj, xml);
			obj.mime = String( xml.@mime );
			obj.score = int( xml.@score );
			obj.allow_specify = int( xml.@allow_specify );
			obj.input_width = int( xml.@input_width );
			obj.least_input = int( xml.@least_input );
			obj.most_input = int( xml.@most_input );
			obj.label = String( xml.label );
			obj.url = String( xml.url );
			var part:PartSelectOption = new PartSelectOption(obj);
			return part;
		}
		/**
		 * 初始化一个栏目：组合选择题
		 */
		private function initPartMatrix(xml:XML):PartMatrix
		{
			var obj:Object = new Object();
			disposeSuperP(obj, xml);
			obj.is_require = int( xml.@is_require );
			obj.form_type = String( xml.@form_type );
			obj.has_score = int( xml.@has_score );
			obj.pre_column_one_response = int( xml.@pre_column_one_response );
			obj.subject = String( xml.subject );
			obj.intro = String( xml.intro );
			var part:PartMatrix = new PartMatrix(obj);
			for each ( var x:XML in xml.part ){
				if ( String( x.@type ) == PartTypeManager.TYPEMATRIXOPTION ){
					part.matrixOptionArr.push( initPartMatrixOption(x) );
				}
			}	
			return part;
		}
		/**
		 * 初始化一个栏目：组合选择题选项
		 */
		private function initPartMatrixOption(xml:XML):PartMatrixOption
		{
			var obj:Object = new Object();
			disposeSuperP(obj, xml);
			obj.direction = String( xml.@direction );
			obj.label = String( xml.label );
			var part:PartMatrixOption = new PartMatrixOption(obj);
			return part;
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}