package scene.items
{
	import configs.PartSubTypeManager;
	
	import data.parts.Part;
	import data.parts.PartSelect;
	import data.parts.PartSelectOption;
	import data.parts.PartSeparator;
	
	import flash.display.Sprite;
	
	import org.aswing.ASColor;
	import org.aswing.ASFont;
	import org.aswing.AbstractButton;
	import org.aswing.AsWingConstants;
	import org.aswing.BorderLayout;
	import org.aswing.ButtonGroup;
	import org.aswing.EmptyLayout;
	import org.aswing.JCheckBox;
	import org.aswing.JComboBox;
	import org.aswing.JLabel;
	import org.aswing.JPanel;
	import org.aswing.JRadioButton;
	import org.aswing.JTextField;
	import org.aswing.SoftBoxLayout;
	import org.aswing.border.EmptyBorder;
	import org.aswing.geom.IntDimension;
	import org.aswing.geom.IntPoint;
	
	import ui.controls.DCPCheckBox;
	
	public class ItemSelect extends JPanel
	{
		private var part:PartSelect
		private var title:JTextField;
		private var intro:JTextField;
		
		private var selectOptionMaxPanel:JPanel;
		private var selectOptionPnael:JPanel;
		
		public function ItemSelect(p:PartSelect)
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
			intro.setLocation(new IntPoint(50, 26));
			intro.setPreferredSize( new IntDimension(700, 32) );
			
			selectOptionMaxPanel = new JPanel();
			selectOptionPnael = new JPanel( new SoftBoxLayout( SoftBoxLayout.Y_AXIS,2) )
			greateSelectOption();
			selectOptionMaxPanel.append(selectOptionPnael);
			
			append(title);
			if ( part.intro !=null && part.intro!=''){
				append(intro);
			}
			append(selectOptionMaxPanel);
			
		}
		private function greateSelectOption():void
		{
			if ( part.formType==PartSubTypeManager.SUBTYPERADIO ){
				greateRadio();
			}else if ( part.formType==PartSubTypeManager.SUBTYPESELECT ){
				greateSelect();
			}else if ( part.formType == PartSubTypeManager.SUBTYPECHECKBOX ){
				greateCheckBox();
			}
		}
		/**
		 * 建立单选
		 */		
		private function greateRadio():void
		{
			var h:Number = 0;
			var group:ButtonGroup = new ButtonGroup();
			for ( var i:int=0; i<part.selectOptionArr.length; i++ ){
				var tso:PartSelectOption = part.selectOptionArr[i];
				var tradio:JRadioButton = new JRadioButton(tso.label);
				tradio.setHorizontalAlignment(AbstractButton.LEFT);
				group.append(tradio);
				selectOptionPnael.append(tradio);
				h+=20;
			}
			//selectOptionMaxPanel.setHeight(h);
			selectOptionPnael.setSizeWH(80,h);
			selectOptionPnael.setX(10);
		}
		/**
		 *建立combobox
		 * 
		 */		
		private function greateSelect():void
		{
			var labelArr:Array=[];
			for ( var i:int=0; i<part.selectOptionArr.length; i++ ){
				var tso:PartSelectOption = part.selectOptionArr[i];
				labelArr.push( tso.label );
			}
			var combb:JComboBox = new JComboBox();
			combb.setListData(labelArr);
			combb.setPreferredWidth(100);
			
			selectOptionPnael.append(combb);
			selectOptionPnael.setX(10);
		}
		/**
		 * 建立多选框
		 * */		
		private function greateCheckBox():void
		{
			var h:Number=0;
			for ( var i:int=0; i<part.selectOptionArr.length; i++ ){
				var tso:PartSelectOption = part.selectOptionArr[i];
				var dcp:DCPCheckBox = new DCPCheckBox(tso.label, tso.allowSpecify);
				selectOptionPnael.append(dcp);
				h+=20;
			}			
			//selectOptionPnael.setHeight(h);
			selectOptionPnael.setX(10);
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}