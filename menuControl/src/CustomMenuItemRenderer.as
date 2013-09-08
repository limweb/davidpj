package {
	import mx.controls.menuClasses.MenuItemRenderer;
	
	[Bindable]
	public class CustomMenuItemRenderer extends MenuItemRenderer {
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
			super.updateDisplayList(unscaledWidth, unscaledHeight);
				
			//Adjust label position slightly to left to fit icon on right
			super.label.x = 0;
			
		}
	}
}
