package component
{
	
	/*
	* @Developer : Sutthikit Phunthanasap (Praem)
	* 
	* @Designer, Project manager, Business Analyst :  David Merit
	*
	* @Reference : http://www.adobe.com/devnet/flex/articles/itemrenderers_pt5.html
	*/	
	
	import mx.controls.AdvancedDataGrid;
	import mx.controls.Label;
	import mx.controls.advancedDataGridClasses.AdvancedDataGridColumn;
	import mx.controls.advancedDataGridClasses.AdvancedDataGridListData;
	import mx.controls.advancedDataGridClasses.MXAdvancedDataGridItemRenderer;
	import mx.core.UIComponent;
	import mx.utils.ColorUtil;
	
	public class CompletionBarItemRenderer extends MXAdvancedDataGridItemRenderer
	{

		private var uic:UIComponent;
		private var lb:Label;
		
		// Range between 0 - 100, if more than 100 set to 100
		private var _completionBarPercent:Number = 0;
		private var _completionBarColor:Number = 0x000000;
		private var _rowPadding:Number = 4;
		private var _labelFontColor:String = '0xffffff';
		private var _labelStyleName:String = 'CompletionBarLabel';
		
		//need to set value to completionBarPercent property
		override public function set data(value:Object):void
		{	
			super.data = value;	
			//completionBarPercent = value.completionBarPercent;
			//completionBarColor = value.completionBarColor;
			
			//after execute invalidateProperties() call commitProperties()
			invalidateProperties();
		}
		
		public function CompletionBarItemRenderer()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			uic = new UIComponent();
			this.addElement(uic);
			
			lb = new Label();
			lb.setStyle("color", _labelFontColor);
			lb.styleName = _labelStyleName;
			lb.text = completionBarPercent.toString() + "%";
			this.addElement(lb);			
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void 
		{
			super.updateDisplayList(unscaledWidth,unscaledHeight);
			
			uic.move(0,0); 
			uic.setActualSize(unscaledWidth,unscaledHeight); 
			lb.move(0,0); 
			lb.setActualSize(unscaledWidth, unscaledHeight); 
		}	
		
		//update position, label text
		override protected function commitProperties():void 
		{ 
			super.commitProperties();
			
			uic.graphics.clear();
			
			//get dataField that use with ItemRenderer
			var adgld:AdvancedDataGridListData = listData as AdvancedDataGridListData;
			completionBarPercent = data[adgld.dataField];
			
			//get column width
			var index:int = listData.columnIndex;
			var adg:AdvancedDataGrid =listData.owner as AdvancedDataGrid;
			var adgc:AdvancedDataGridColumn = adg.columns[index] as AdvancedDataGridColumn;
			
			trace("before round : ",adgc.width*completionBarPercent/100);
			trace("after round : ",Math.round(adgc.width*completionBarPercent/100));
			trace("percent : ",completionBarPercent.toString() + "%");
			//trace(adgc.width*completionBarPercent/100);
			
			uic.graphics.beginFill(completionBarColor);
			//hide border line
			//uic.graphics.lineStyle(1,0x000000);
			uic.graphics.drawRect(0,0,Math.round(adgc.width*completionBarPercent/100), adg.rowHeight - rowPadding);
			
			lb.text = completionBarPercent.toString() + "%";
		}		

		[Bindable]
		public function get completionBarPercent():Number
		{
			return _completionBarPercent;
		}

		public function set completionBarPercent(value:Number):void
		{
			if (value <= 100)
				_completionBarPercent = value;
			else
				_completionBarPercent = 100;
		}

		[Bindable]
		public function get completionBarColor():Number
		{
			return _completionBarColor;
		}

		public function set completionBarColor(value:Number):void
		{
			_completionBarColor = value;
		}

		[Bindable]
		public function get rowPadding():Number
		{
			return _rowPadding;
		}

		public function set rowPadding(value:Number):void
		{
			_rowPadding = value;
		}

		[Bindable]
		public function get labelFontColor():String
		{
			return _labelFontColor;
		}

		public function set labelFontColor(value:String):void
		{
			_labelFontColor = value;
		}

	}
}