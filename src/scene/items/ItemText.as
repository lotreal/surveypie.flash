package scene.items
{
	import configs.PartSubTypeManager;
	
	import data.parts.PartText;
	
	import org.aswing.ASColor;
	import org.aswing.ASFont;
	import org.aswing.AsWingConstants;
	import org.aswing.EmptyLayout;
	import org.aswing.FlowLayout;
	import org.aswing.JPanel;
	import org.aswing.JTextArea;
	import org.aswing.JTextField;
	import org.aswing.SoftBoxLayout;
	import org.aswing.border.EmptyBorder;
	import org.aswing.geom.IntDimension;
	import org.aswing.geom.IntPoint;

	public class ItemText extends JPanel
	{
		private var part:PartText
		
		private var title:JTextField;
		private var intro:JTextField;
		private var inputTxt:JTextField;
		private var textareaTxt:JTextArea;
		
		public function ItemText(p:PartText)
		{
			this.setLayout( new SoftBoxLayout( SoftBoxLayout.Y_AXIS, 2, SoftBoxLayout.LEFT) );
			
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
			intro.setHtmlText(part.intro);
			var introTxtH:Number = (intro.getTextField().textHeight+4);
			intro.setPreferredSize( new IntDimension(700, 34) );
			
			var layout1:FlowLayout = new FlowLayout();
			layout1.setAlignment(AsWingConstants.LEFT);
			layout1.setHgap(0);
			layout1.setVgap(0);
			var inputPanel:JPanel = new JPanel(layout1);

			if ( part.formType == PartSubTypeManager.SUBTYPEINPUT) {
				inputTxt = new JTextField()
				inputTxt.setEditable(true);
				inputTxt.setEnabled(true);	
				inputTxt.setFont(new ASFont("Tahoma", 14, false, false, false, false));			
				inputTxt.setWordWrap(false);
				inputTxt.setColumns(20);
				inputPanel.append(inputTxt);
			}else if ( part.formType == PartSubTypeManager.SUBTYPETEXTAREA ){
				textareaTxt = new JTextArea();
				textareaTxt.setFont(new ASFont("Tahoma", 14, false, false, false, false));			
				textareaTxt.setWordWrap(true);
				textareaTxt.setColumns(20);
				textareaTxt.setRows(5);
				inputPanel.append(textareaTxt);
			}
						
			
			append(title);
			if ( part.intro!='' && part.intro!=null ){
				append(intro);
			}
			append(inputPanel);
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}