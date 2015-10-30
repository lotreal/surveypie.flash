package scene.items
{
	import data.parts.Part;
	import data.parts.PartSeparator;
	
	import flash.display.Sprite;
	
	import org.aswing.ASColor;
	import org.aswing.ASFont;
	import org.aswing.AsWingConstants;
	import org.aswing.BorderLayout;
	import org.aswing.JLabel;
	import org.aswing.JPanel;
	import org.aswing.JTextField;
	import org.aswing.SoftBoxLayout;
	import org.aswing.border.EmptyBorder;
	import org.aswing.geom.IntDimension;
	import org.aswing.geom.IntPoint;

	public class ItemSeparator extends JPanel
	{
		private var part:PartSeparator
		private var title:JTextField;
		private var intro:JTextField;
		public function ItemSeparator(p:PartSeparator)
		{
			this.setLayout( new SoftBoxLayout( SoftBoxLayout.Y_AXIS, 2) );
			
			part = p;
			
			title = new JTextField();
			title.setFont(new ASFont(null, 14, true, false, false, false));
			title.setForeground(new ASColor(0xffffff, 1));
			title.setBackground(new ASColor(0x339900, 1));
			title.setEditable(false);
			title.setEnabled(false);
			title.setBorder( new EmptyBorder() );
			title.setHtmlText(part.title);
			
			
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
			
			append(title);
			append(intro);
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}