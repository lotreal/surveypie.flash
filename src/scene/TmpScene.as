package scene
{
	import configs.PartTypeManager;
	
	import data.Data;
	import data.parts.PartMatrix;
	import data.parts.PartMatrixOption;
	import data.parts.PartSelect;
	import data.parts.PartSelectOption;
	import data.parts.PartSeparator;
	import data.parts.PartText;
	
	import flash.display.Sprite;
	import flash.profiler.showRedrawRegions;
	
	import flashx.textLayout.tlf_internal;
	
	import org.aswing.ASColor;
	import org.aswing.AsWingManager;
	import org.aswing.BorderLayout;
	import org.aswing.Container;
	import org.aswing.EmptyFont;
	import org.aswing.EmptyLayout;
	import org.aswing.JButton;
	import org.aswing.JComboBox;
	import org.aswing.JFrame;
	import org.aswing.JPanel;
	import org.aswing.JScrollPane;
	import org.aswing.JViewport;
	import org.aswing.JWindow;
	import org.aswing.SoftBoxLayout;
	import org.aswing.border.LineBorder;
	import org.aswing.geom.IntDimension;
	
	import scene.items.ItemMatrix;
	import scene.items.ItemSelect;
	import scene.items.ItemSeparator;
	import scene.items.ItemText;
	
	import ui.controls.DCPCheckBox;
	
	public class TmpScene extends Sprite
	{
		private var xdata:Data;
		
		/**
		 * 主窗口 
		 */		
		private var mainWindow:JWindow;
		/**
		 * 所有part的容器 
		 */		
		private var jWinPanel:Container;
		
		private var jscrollPane:JScrollPane;
		private var jcontent:JPanel;
		
		public function TmpScene()
		{
			xdata = Data.instance;
			AsWingManager.initAsStandard(this);
			
			var bg:Sprite = new Sprite();
			bg.graphics.beginFill(0xffffff);
			bg.graphics.drawRect(0,0,800,500);
			bg.graphics.endFill();
			this.addChild(bg);
			
			mainWindow = new JWindow();
			mainWindow.setSizeWH(760,460);
			mainWindow.show();
			
			jWinPanel = mainWindow.getContentPane();			
			mainWindow.x=20;
			mainWindow.y=20;
			jWinPanel.setBorder( new LineBorder(null, new ASColor(0xcccccc)) );
			
			jcontent = new JPanel( new SoftBoxLayout(SoftBoxLayout.Y_AXIS,20));
			jcontent.setPreferredWidth(730);
			jscrollPane = new JScrollPane(jcontent, 0,1);		
			
			/*jscrollPane.setBorder( new LineBorder(null, new ASColor(0x00ff00), 2) );
			jcontent.setBorder( new LineBorder(null, new ASColor(0xff0000)) );*/
			
			jWinPanel.append(jscrollPane);
			
			addItemSeparator();
			addItemText();
			addItemTextarea();
			addItemRadio();
			addItemSelect()
			addItemCheckBox();			
			addItemMatrix();
		}
		/**
		 * 分隔符
		 */		
		private function addItemSeparator():void
		{
			var obj:Object = new Object();
			obj.rank = 1;
			obj.type = PartTypeManager.TYPESEPARATOR;
			obj.create_time = 00;
			obj.update_time = 00;
			obj.sn = "snsn";
			obj.title = "ASWing是个SB"
			obj.intro = "ASWing是个SBASWing是个SBASWing是个SBASWing是个SB"
			var bb:PartSeparator = new PartSeparator(obj);
			
			var item:ItemSeparator = new ItemSeparator(bb);
			jcontent.append( item )
		}
		/**
		 * 填空题
		 */		
		private function addItemText():void
		{
			var obj:Object = new Object();
			obj.rank = 1;
			obj.type = PartTypeManager.TYPETEXT;
			obj.create_time = 00;
			obj.update_time = 00;
			obj.sn = "snsn";
			obj.form_type = "input"
			obj.subject = "1. <font color='#339900'>姓名（填空题）</font><font color='#ff0000'>*</font>"
			obj.intro = "随便你叫什么都可以（填空题描述文字)"
			var bb:PartText = new PartText(obj);
			
			var item:ItemText = new ItemText(bb);
			jcontent.append( item )
		}
		/**
		 * 填空题Textarea
		 */		
		private function addItemTextarea():void
		{
			var obj:Object = new Object();
			obj.rank = 1;
			obj.type = PartTypeManager.TYPETEXT;
			obj.create_time = 00;
			obj.update_time = 00;
			obj.sn = "snsn";
			obj.form_type = "textarea"
			obj.subject = "2. <font color='#339900'>说点什么（问答题）</font><font color='#ff0000'>*</font>"
			obj.intro = ""
			var bb:PartText = new PartText(obj);
			
			var item:ItemText = new ItemText(bb);
			jcontent.append( item )
		}
		/**
		 * 选择题radio
		 */		
		private function addItemRadio():void
		{
			var obj:Object = new Object();
			obj.rank = 1;
			obj.type = PartTypeManager.TYPESELECT;
			obj.create_time = 00;
			obj.update_time = 00;
			obj.sn = "snsn";
			obj.form_type = "radio"
			obj.subject = "3. <font color='#339900'>性别（选择题 单选）</font><font color='#ff0000'>*</font>"
			obj.intro = "人妖死开（选择题描述文字）"
			var bb:PartSelect = new PartSelect(obj);
			var obj1:Object = new Object();
			obj1.label = "男";
			var bb1:PartSelectOption = new PartSelectOption(obj1);
			var obj2:Object = new Object();
			obj2.label = "女";
			var bb2:PartSelectOption = new PartSelectOption(obj2);
			bb.selectOptionArr.push(bb1, bb2);
			
			var item:ItemSelect = new ItemSelect(bb);
			jcontent.append( item )
		}
		
		/**
		 * 选择题select
		 */		
		private function addItemSelect():void
		{
			var obj:Object = new Object();
			obj.rank = 1;
			obj.type = PartTypeManager.TYPESELECT;
			obj.create_time = 00;
			obj.update_time = 00;
			obj.sn = "snsn";
			obj.form_type = "select"
			obj.subject = "4. <font color='#339900'>所在地（选择题 单选）</font><font color='#ff0000'>*</font>"
			obj.intro = ""
			var bb:PartSelect = new PartSelect(obj);
			var obj1:Object = new Object();
			obj1.label = "重庆";
			var bb1:PartSelectOption = new PartSelectOption(obj1);
			var obj2:Object = new Object();
			obj2.label = "火星";
			var bb2:PartSelectOption = new PartSelectOption(obj2);
			bb.selectOptionArr.push(bb1, bb2);
			
			var item:ItemSelect = new ItemSelect(bb);
			jcontent.append( item )
		}
		/**
		 * 选择题checkbox
		 */		
		private function addItemCheckBox():void
		{
			var obj:Object = new Object();
			obj.rank = 1;
			obj.type = PartTypeManager.TYPESELECT;
			obj.create_time = 00;
			obj.update_time = 00;
			obj.sn = "snsn";
			obj.form_type = "checkbox"
			obj.subject = "5. <font color='#339900'>爱好（选择题 多选）</font><font color='#ff0000'>*</font>"
			obj.intro = ""
			var bb:PartSelect = new PartSelect(obj);
			var obj1:Object = new Object();
			obj1.label = "音乐";
			var bb1:PartSelectOption = new PartSelectOption(obj1);
			var obj2:Object = new Object();
			obj2.label = "美食";
			var bb2:PartSelectOption = new PartSelectOption(obj2);
			var obj3:Object = new Object();
			obj3.label = "拉粑粑";
			obj3.allow_specify=1
			var bb3:PartSelectOption = new PartSelectOption(obj3);			
			
			bb.selectOptionArr.push(bb1, bb2, bb3);
			
			var item:ItemSelect = new ItemSelect(bb);
			jcontent.append( item )
		}
		/**
		 * 组合选择题
		 */		
		private function addItemMatrix():void
		{
			var obj:Object = new Object();
			obj.rank = 1;
			obj.type = PartTypeManager.TYPEMATRIX;
			obj.create_time = 00;
			obj.update_time = 00;
			obj.sn = "snsn";
			obj.form_type = "radio"
			obj.subject = "5. <font color='#339900'>感觉如何（组合选择题 单选）</font><font color='#ff0000'>*</font>"
			obj.intro = "... （组合选择题描述文字）"
			var bb:PartMatrix = new PartMatrix(obj);
			
			var obj1:Object = new Object();
			obj1.direction = "row"
			obj1.label = "今天心情如何（行选项）"
			obj1.width = 250;
			var bb1:PartMatrixOption = new PartMatrixOption(obj1);
			
			var obj2:Object = new Object();
			obj2.direction = "row"
			obj2.label = "今天心情如何（行选项）"
			obj2.width = 150;
			var bb2:PartMatrixOption = new PartMatrixOption(obj2);
				
			var obj3:Object = new Object();
			obj3.direction = "row"
			obj3.label = "今天心情如何（行选项）"
			obj3.width = 150;
			var bb3:PartMatrixOption = new PartMatrixOption(obj3);
				
			var obj4:Object = new Object();
			obj4.direction = "col"
			obj4.label = "很好"
			obj4.width = 150;
			var bb4:PartMatrixOption = new PartMatrixOption(obj4);
				
			var obj5:Object = new Object();
			obj5.direction = "col"
			obj5.label = "好"
			obj5.width = 100;
			var bb5:PartMatrixOption = new PartMatrixOption(obj5);
				
			var obj6:Object = new Object();
			obj6.direction = "col"
			obj6.label = "一般"
			obj6.width = 60;
			var bb6:PartMatrixOption = new PartMatrixOption(obj6);
				
			var obj7:Object = new Object();
			obj7.direction = "col"
			obj7.label = "差"
			obj7.width = 40;
			var bb7:PartMatrixOption = new PartMatrixOption(obj7);
			
			bb.matrixOptionArr.push(bb1, bb2, bb3, bb4, bb5, bb6, bb7);
			
			var item:ItemMatrix = new ItemMatrix(bb);
			jcontent.append( item )
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}