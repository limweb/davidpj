package
{
	import flash.events.MouseEvent;
	
	import mx.containers.HBox;
	import mx.controls.Image;
	import mx.controls.Label;
	import mx.controls.dataGridClasses.*;
	import mx.core.DragSource;
	import mx.core.UIComponent;
	import mx.managers.DragManager;
	
	public class ImageRenderer extends HBox
	{
		//private var imageReference:Image = null;
		private var img:Image = new Image();
		private var lbl:Label = new Label();

		[Embed("assets/Button.png")]
		private var Button:Class;
		
		[Embed("assets/CheckBox.png")]
		private var CheckBox:Class;
		
		[Embed("assets/ComboBox.png")]
		private var ComboBox:Class;
		
		[Embed("assets/DataGrid.png")]
		private var DataGrid:Class;
		
		[Embed("assets/DateChooser.png")]
		private var DateChooser:Class;
		
		[Embed("assets/RadioButton.png")]
		private var RadioButton:Class;
		
		[Embed("assets/TextArea.png")]
		private var TextArea:Class;
		
		[Embed("assets/TextInput.png")]
		private var TextInput:Class;		

		/*=================================*/
		[Embed("assets/real/Button.png")]
		private var Button1:Class;
		
		[Embed("assets/real/CheckBox.png")]
		private var CheckBox1:Class;
		
		[Embed("assets/real/ComboBox.png")]
		private var ComboBox1:Class;
		
		[Embed("assets/real/DataGrid.png")]
		private var DataGrid1:Class;
		
		[Embed("assets/real/DateChooser.png")]
		private var DateChooser1:Class;
		
		[Embed("assets/real/RadioButton.png")]
		private var RadioButton1:Class;
		
		[Embed("assets/real/TextArea.png")]
		private var TextArea1:Class;
		
		[Embed("assets/real/TextInput.png")]
		private var TextInput1:Class;		
		
		override public function set data(value:Object):void
		{
			//if(value != null && imageReference == null)
			if(value != null)
			{
				/*if(value.InStock > 0) {
					img.source = "assets/in_stock.png";
				}
				else if(value.InStock == 0){
					img.source = "assets/not_in_stock.png";
				}*/
				if (value.list == "Button")
				{
					img.source = Button;
				}
				else if (value.list == "CheckBox")
				{
					img.source = CheckBox;
				}
				else if (value.list == "ComboBox")
				{
					img.source = ComboBox;
				}
				else if (value.list == "DataGrid")
				{
					img.source = DataGrid;
				}
				else if (value.list == "DateChooser")
				{
					img.source = DateChooser;
				}
				else if (value.list == "RadioButton")
				{
					img.source = RadioButton;
				}
				else if (value.list == "TextArea")
				{
					img.source = TextArea;
				}
				else if (value.list == "TextInput")
				{
					img.source = TextInput;
				}				
				//img.source = value.icon;
				addChild(img);
				img.addEventListener(MouseEvent.MOUSE_DOWN, doDrag);
				lbl.text = "(" + value.list + ")";
				addChild(lbl);
				img.toolTip = value.list;
				//imageReference = img;
				//setStyle("verticalAlign", "middle");
				//setStyle("paddingLeft","5");
				
			}
			
			
		}
		
		private function doDrag(event:MouseEvent):void
		{
			//var img:Image = event.currentTarget as Image;
			var img1:Image = new Image();
			var target:UIComponent = event.currentTarget as UIComponent;
			
			var dragImg:Image = new Image();
			//dragImg.source = img.source;

			if (img.toolTip == "Button")
			{
				dragImg.source = Button1;
			}
			else if (img.toolTip == "CheckBox")
			{
				dragImg.source = CheckBox1
			}
			else if (img.toolTip == "ComboBox")
			{
				dragImg.source = ComboBox1;
			}
			else if (img.toolTip == "DataGrid")
			{
				dragImg.source = DataGrid1;
			}
			else if (img.toolTip == "DateChooser")
			{
				dragImg.source = DateChooser1;
			}
			else if (img.toolTip == "RadioButton")
			{
				dragImg.source = RadioButton1;
			}
			else if (img.toolTip == "TextArea")
			{
				dragImg.source = TextArea1;
			}
			else if (img.toolTip == "TextInput")
			{
				dragImg.source = TextInput1;
			}
			
			dragImg.move(target.mouseX,target.mouseY);
			
			var dsource:DragSource = new DragSource();
			dsource.addData(img, 'img');
			
			DragManager.doDrag(img, dsource , event, dragImg);
		}		
		
	}
}
