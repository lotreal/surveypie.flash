package scene
{
	import configs.PartTypeManager;
	
	import data.Data;
	import data.Page;
	import data.parts.PartSeparator;
	
	import flash.display.Sprite;
	
	import org.aswing.ASColor;
	import org.aswing.AsWingManager;
	import org.aswing.BorderLayout;
	import org.aswing.Container;
	import org.aswing.JButton;
	import org.aswing.JFrame;
	import org.aswing.JWindow;
	
	import scene.items.ItemSeparator;

	public class SceneMC extends Sprite
	{
		private var xdata:Data;
				
		/**
		 * 主窗口 
		 */		
		private var mainWindow:JWindow;
		/**
		 * 按顺序保存每个页 
		 */		
		private var itemPageArr:Array;
		/**
		 *当前页 
		 */
		private var curPage:Number;
		/**
		 *总页数 
		 */
		private var totalPage:Number;
		
		/**
		 * 所有part的容器 
		 */		
		private var jWinPanel:Container;
		
		public function SceneMC()
		{
			xdata = Data.instance;
			AsWingManager.initAsStandard(this);
			
			var bg:Sprite = new Sprite();
			bg.graphics.beginFill(0xffffff);
			bg.graphics.drawRect(0,0,800,600);
			bg.graphics.endFill();
			this.addChild(bg);
			
			mainWindow = new JWindow();
			mainWindow.setSizeWH(760,400);
			mainWindow.show();
			
			jWinPanel = mainWindow.getContentPane();
			jWinPanel.setLayout( new BorderLayout() );
			mainWindow.x=20;
			mainWindow.y=20;
			
			curPage=1;
			totalPage = xdata.pageDataArr.length;
			show(curPage);
		}
		private function show(num:Number):void
		{
			
		}
		
		private function greatePage(p:Page):void
		{
			
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}