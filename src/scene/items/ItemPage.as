package scene.items
{
	import data.Page;
	
	import org.aswing.JPanel;
	import org.aswing.JScrollPane;
	import org.aswing.LayoutManager;
	
	public class ItemPage extends JPanel
	{
		/**
		 * 滚动控制 
		 */		
		private var scrollPane:JScrollPane;
		/**
		 * 装part的容器 
		 */		
		private var page:JPanel;
		
		public function ItemPage()
		{
			super();
			
			page = new JPanel();
			scrollPane = new JScrollPane(page);
			
			
			
		}
		
		
		
		
		
		
		
		
		
		
		
		
	}
}