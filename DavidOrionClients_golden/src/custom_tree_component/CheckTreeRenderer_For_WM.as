package custom_tree_component
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.xml.*;
	
	import mx.collections.*;
	import mx.controls.Alert;
	import mx.controls.CheckBox;
	import mx.controls.Image;
	import mx.controls.Tree;
	import mx.controls.listClasses.*;
	import mx.controls.treeClasses.*;
	import mx.controls.treeClasses.TreeItemRenderer;
	import mx.core.FlexGlobals;
	import mx.core.IDataRenderer;
	import mx.events.FlexEvent;

	public class CheckTreeRenderer_For_WM extends TreeItemRenderer
	{
		//protected var myImage:Image;
		protected var myCheckBox:CheckBox;
		// set image properties
		//private var imageWidth:Number=6;
		//private var imageHeight:Number=6;
		private var inner:String="assets/inner.png";
		static private var STATE_SCHRODINGER:String="schrodinger";
		static private var STATE_CHECKED:String="checked";
		static private var STATE_UNCHECKED:String="unchecked";

		public function CheckTreeRenderer_For_WM()
		{
			super();
			mouseEnabled=false;
		}

		private function toggleParents(item:Object, tree:Tree, state:String):void
		{
			if (item == null)
			{
				return;
			}
			else
			{
				item.@state=state;
				toggleParents(tree.getParentItem(item), tree, getState(tree, tree.getParentItem(item)));
			}
		}

		private function toggleChildren(item:Object, tree:Tree, state:String):void
		{
			if (item == null)
			{
				return;
			}
			else
			{
				item.@state=state;
				var treeData:ITreeDataDescriptor=tree.dataDescriptor;
				if (treeData.hasChildren(item))
				{
					var children:ICollectionView=treeData.getChildren(item);
					var cursor:IViewCursor=children.createCursor();
					while (!cursor.afterLast)
					{
						toggleChildren(cursor.current, tree, state);
						cursor.moveNext();
					}
				}
			}
		}

		private function getState(tree:Tree, parent:Object):String
		{
			var noChecks:int=0;
			var noCats:int=0;
			var noUnChecks:int=0;
			if (parent != null)
			{
				var treeData:ITreeDataDescriptor=tree.dataDescriptor;
				var cursor:IViewCursor=treeData.getChildren(parent).createCursor();
				while (!cursor.afterLast)
				{
					if (cursor.current.@state == STATE_CHECKED)
					{
						noChecks++;
					}
					else if (cursor.current.@state == STATE_UNCHECKED)
					{
						noUnChecks++
					}
					else
					{
						noCats++;
					}
					cursor.moveNext();
				}
			}
			if ((noChecks > 0 && noUnChecks > 0) || (noCats > 0 && noChecks > 0))
			{
				return STATE_SCHRODINGER;
			}
			else if (noChecks > 0)
			{
				return STATE_CHECKED;
			}
			else
			{
				return STATE_UNCHECKED;
			}
		}

		private function imageToggleHandlder(event:MouseEvent):void
		{
			myCheckBox.selected=!myCheckBox.selected;
			checkBoxToggleHandler(event);
		}

		private function checkBoxToggleHandler(event:MouseEvent):void
		{
			if (data)
			{
				var root:String = data.@root; //Get selected checkbox is root?
				var dataProviderType:String = data.@providerType;
				
				var myListData:TreeListData=TreeListData(this.listData);
				var selectedNode:Object=myListData.item;
				var tree:Tree=Tree(myListData.owner);
				var toggle:Boolean=myCheckBox.selected;
				if (toggle)
				{
					toggleChildren(data, tree, STATE_CHECKED);
				}
				else
				{
					toggleChildren(data, tree, STATE_UNCHECKED);
				}
				var parent:Object=tree.getParentItem(data);
				toggleParents(parent, tree, getState(tree, parent));
				
				FlexGlobals.topLevelApplication.workManagerID.chkTreeCheckBoxType(dataProviderType, root, toggle);
			}
		}

		override protected function createChildren():void
		{
			super.createChildren();
			myCheckBox=new CheckBox();
			myCheckBox.setStyle("horizontalCenter", "0");
			myCheckBox.setStyle("horizontalAlign", "center");
			myCheckBox.setStyle("verticalCenter", "0");
			myCheckBox.setStyle("verticalAlign", "middle");
			myCheckBox.setStyle("chromeColor", "white");
			myCheckBox.addEventListener(MouseEvent.CLICK, checkBoxToggleHandler);
			addChild(myCheckBox);
			//myImage=new Image();
			//myImage.source=inner;
			//myImage.addEventListener(MouseEvent.CLICK, imageToggleHandlder);
			//myImage.setStyle("verticalAlign", "middle");
			//addChild(myImage);

		}

		private function setCheckState(checkBox:CheckBox, value:Object, state:String):void
		{
			if (state == STATE_CHECKED)
			{
				checkBox.selected=true;
			}
			else if (state == STATE_UNCHECKED)
			{
				checkBox.selected=false;
			}
			else if (state == STATE_SCHRODINGER)
			{
				checkBox.selected=false;
			}
		}

		override public function set data(value:Object):void
		{
			if (value != null)
			{
				super.data=value;

				setCheckState(myCheckBox, value, value.@state);
				if (TreeListData(super.listData).item.@type == 'dimension')
				{
					setStyle("fontStyle", 'italic');
				}
				else
				{
					if (this.parent != null)
					{
						var _tree:Tree=Tree(this.parent.parent);
						_tree.setStyle("defaultLeafIcon", null);
					}
					setStyle("fontStyle", 'normal');
				}
			}
		}

		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			if (super.data)
			{
				if (super.icon != null)
				{
					myCheckBox.x=super.icon.x;
					//myCheckBox.y=9;
					myCheckBox.y=5;
					super.icon.x=myCheckBox.x + myCheckBox.width + 17;
					super.label.x=super.icon.x + super.icon.width + 3;
				}
				else
				{
					myCheckBox.x=super.label.x;
					//myCheckBox.y=9;
					myCheckBox.y=5;
					super.label.x=myCheckBox.x + myCheckBox.width + 17;
				}
				if (data.@state == STATE_SCHRODINGER)
				{
					//myImage.x=myCheckBox.x + 4;
					//myImage.y=myCheckBox.y + 4;
					//myImage.width=imageWidth;
					//myImage.height=imageHeight;
				}
				else
				{
					//myImage.x=0;
					//myImage.y=0;
					//myImage.width=0;
					//myImage.height=0;
				}
			}
		}
	}
}