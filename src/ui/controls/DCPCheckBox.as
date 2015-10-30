package ui.controls
{
	import org.aswing.Icon;
	import org.aswing.JCheckBox;
	import org.aswing.JPanel;
	import org.aswing.JTextField;
	
	public class DCPCheckBox extends JPanel
	{
		public function DCPCheckBox(txt:String='', inp:int=0)
		{
			super();
			
			checkBox = new JCheckBox(txt);
			append(checkBox);
			if ( inp==1 ){
				inputTxt = new JTextField();
				inputTxt.setColumns(10);
				append(inputTxt);
			}
			
		}
		public var checkBox:JCheckBox;
		
		public var inputTxt:JTextField;
		
		
		
		
		
	}
}