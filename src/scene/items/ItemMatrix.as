package scene.items
{
	import data.parts.PartMatrix;
	import data.parts.PartMatrixOption;
	
	import org.aswing.ASFont;
	import org.aswing.AsWingConstants;
	import org.aswing.ButtonGroup;
	import org.aswing.JLabel;
	import org.aswing.JPanel;
	import org.aswing.JRadioButton;
	import org.aswing.JTextField;
	import org.aswing.LayoutManager;
	import org.aswing.SoftBoxLayout;
	import org.aswing.border.EmptyBorder;
	import org.aswing.geom.IntDimension;
	import org.aswing.geom.IntPoint;
	
	public class ItemMatrix extends JPanel
	{
		private var part:PartMatrix
		
		private var title:JTextField;
		private var intro:JTextField;
		
		private var martixPanel:JPanel;
		private var rowPanel:JPanel;
		private var colPanel:JPanel;
		
		private var rowMatrixOptionArr:Array;
		private var colMatrixOptionArr:Array;
		
		private var rowGroupButtonArr:Array;
		
		public function ItemMatrix(p:PartMatrix)
		{
			this.setLayout( new SoftBoxLayout( SoftBoxLayout.Y_AXIS, 2) );
			
			part = p;
			
			title = new JTextField();
			title.setFont(new ASFont(null, 14, true, false, false, false));
			title.setEditable(false);
			title.setEnabled(false);
			title.setBorder( new EmptyBorder() );
			title.setHtmlText(part.subject);
			
			intro = new JTextField()
			intro.setWordWrap(true);
			intro.setEditable(false);
			intro.setEnabled(false);
			intro.setBorder( new EmptyBorder() );
			intro.setFont(new ASFont("Tahoma", 12, false, false, false, false));
			intro.setBackground(null);
			intro.setText(part.intro);
			
			//加载选项容器
			martixPanel = new JPanel( new SoftBoxLayout(SoftBoxLayout.X_AXIS, 2) );			
			rowPanel = new JPanel( new SoftBoxLayout(SoftBoxLayout.Y_AXIS, 2) );			
			colPanel = new JPanel( new SoftBoxLayout(SoftBoxLayout.X_AXIS,2) );
			martixPanel.appendAll(rowPanel, colPanel);
			
			handOutMatrixOption();
			
			append(title);
			if ( part.intro !=null && part.intro!=''){
				append(intro);
			}
			append(martixPanel);			
		}
		private function handOutMatrixOption():void
		{
			rowMatrixOptionArr = [];
			colMatrixOptionArr = [];
			for ( var i:int=0; i<part.matrixOptionArr.length; i++ ){
				var p:PartMatrixOption = part.matrixOptionArr[i];
				if ( p.direction == "row" ){
					rowMatrixOptionArr.push(p);
				}else if ( p.direction == "col" ){
					colMatrixOptionArr.push(p);
				}
			}
			addRows();
			addCols();
		}
		
		private function addRows():void
		{
			rowGroupButtonArr=[];
			var txttmp:JLabel = new JLabel(" ");
			txttmp.setPreferredHeight(30);
			rowPanel.append(txttmp);
			var rowWidth:Number=0;
			for ( var i:int=0; i<rowMatrixOptionArr.length; i++ ){
				var p:PartMatrixOption = rowMatrixOptionArr[i];
				var txt:JLabel = new JLabel(p.label);
				txt.setHorizontalAlignment(AsWingConstants.LEFT);
				txt.setPreferredHeight(30);
				rowPanel.append(txt);
				if ( p.width > rowWidth ){
					rowWidth = p.width;
				}
				rowGroupButtonArr.push(new ButtonGroup());
			}
			rowPanel.setPreferredWidth(rowWidth);
		}
		private function addCols():void
		{
			for ( var i:int=0; i<colMatrixOptionArr.length; i++ ){
				var p:PartMatrixOption = colMatrixOptionArr[i];
				var ccPanel:JPanel = new JPanel( new SoftBoxLayout(SoftBoxLayout.Y_AXIS,2) );
				var txt:JLabel = new JLabel(p.label);
				txt.setPreferredHeight(30);
				ccPanel.append(txt);
				for ( var j:int=0; j<rowMatrixOptionArr.length; j++ ){
					var radio:JRadioButton = new JRadioButton();
					radio.setPreferredSize( new IntDimension(30, 30) );
					ccPanel.append(radio);
					var group:ButtonGroup = rowGroupButtonArr[j];
					group.append(radio);
				}
				ccPanel.setPreferredWidth(p.width);
				colPanel.append(ccPanel);
			}
		}
		
		/*private function addCols():void
		{
			colGroupButtonArr=[];
			for ( var i:int=0; i<colMatrixOptionArr.length; i++ ){
				var p:PartMatrixOption = colMatrixOptionArr[i];
				var ccPanel:JPanel = new JPanel( new SoftBoxLayout(SoftBoxLayout.Y_AXIS,2) );
				var txt:JLabel = new JLabel(p.label);
				txt.setPreferredHeight(30);
				ccPanel.append(txt);
				var group:ButtonGroup = new ButtonGroup();
				colGroupButtonArr.push(group);
				for ( var j:int=0; j<rowMatrixOptionArr.length; j++ ){
					var radio:JRadioButton = new JRadioButton();
					radio.setPreferredSize( new IntDimension(30, 30) );
					ccPanel.append(radio);
					group.append(radio);
				}
				ccPanel.setPreferredWidth(p.width);
				colPanel.append(ccPanel);
			}
		}*/
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}