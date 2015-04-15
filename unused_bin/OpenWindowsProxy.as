package org.mdid.MediaViewer.models
{
	import com.ericfeminella.collections.HashMap;
	import com.ericfeminella.collections.IMap;
	
	import mx.collections.ArrayCollection;
	import mx.utils.UIDUtil;
	
	import org.mdid.MediaViewer.events.WindowEvent;
	import org.mdid.MediaViewer.views.components.SecondWindow;
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * Proxy to keep track of current open <code>secondWindow</code> objects
	 * @author joel (modified by kevin hegg)
	 *
	 */
	public class OpenWindowsProxy extends Actor
	{
		/**
		 * Hash of currently open windows
		 */
		protected var windowMap:IMap;
		
		public function OpenWindowsProxy()
		{
			windowMap = new HashMap();
		}
		
		/**
		 * Create a new <code>secondWindow</code>. If the <code>windowMap</code>
		 * already contains a window with the specified UID, return that window
		 * instead
		 *
		 * @param uid identifies the window
		 * @return
		 *
		 */
		public function createWindow(uid:String = null):SecondWindow
		{
			var secondWindow:SecondWindow;
			
			if (this.hasWindowUID(uid))
			{
				secondWindow = this.getWindowFromUID(uid);
				return secondWindow
			}
			
			if (!uid)
				uid = UIDUtil.createUID();
			
			secondWindow = new SecondWindow();
			secondWindow.id = uid;
			this.windowMap.put(secondWindow.id, SecondWindow);
			dispatch(new WindowEvent(WindowEvent.INFO_WINDOW_ADDED, uid));
			return secondWindow;
		}
		
		/**
		 * Retrieve an <code>secondWindow</code> by its unique identifier
		 *
		 * @param uid
		 * @return
		 *
		 */
		public function getWindowFromUID(uid:String):SecondWindow
		{
			return this.windowMap.getValue(uid) as SecondWindow;
		}
		
		/**
		 * Remove a <code>secondWindow</code> from the <code>windowMap</code>
		 * by its unique identifier.
		 *
		 * @param uid
		 *
		 */
		public function removeWindowByUID(uid:String):void
		{
			this.windowMap.remove(uid);
			dispatch(new WindowEvent(WindowEvent.INFO_WINDOW_REMOVED, uid));
		}
		
		/**
		 * Check if the <code>windowMap</code> contains an <code>secondWindow</code>
		 * unique identifier as a key.
		 *
		 * @param uid
		 * @return
		 *
		 */
		public function hasWindowUID(uid:String):Boolean
		{
			return this.windowMap.containsKey(uid);
		}
		
		public function updateCollection(collection:ArrayCollection):void
		{
			var windows:Array = this.windowMap.getValues();
			var secondWindow:SecondWindow;
			//trace("currently registered:", windows);
			for each (secondWindow in windows)
			{
				if (collection.getItemIndex(secondWindow) < 0)
					collection.addItem(secondWindow);
			}
			
			for each (secondWindow in collection)
			{
				if (!this.windowMap.containsValue(secondWindow))
					collection.removeItemAt(collection.getItemIndex(secondWindow));
			}
		}
		
		public function getAllWindows():ArrayCollection
		{
			return new ArrayCollection(this.windowMap.getValues());
		}
	}
}