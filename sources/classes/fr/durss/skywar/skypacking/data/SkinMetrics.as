package fr.durss.skywar.skypacking.data {	import fr.durss.skywar.skypacking.graphics.CheckBoxGraphicsS;	import fr.durss.skywar.skypacking.graphics.CheckBoxSelectedGraphicsS;	import fr.durss.skywar.skypacking.graphics.CloseAppGraphicsS;	import fr.durss.skywar.skypacking.graphics.LoadBarBackgroundS;	import fr.durss.skywar.skypacking.graphics.LoadBarFillS;	import fr.durss.skywar.skypacking.graphics.MinimizeAppGraphicsS;	import fr.durss.skywar.skypacking.graphics.SkinScrollThumbS;	import fr.durss.skywar.skypacking.graphics.SkinScrollTrackS;	import fr.durss.skywar.skypacking.graphics.SubmitButtonGraphicsS;	import fr.durss.skywar.skypacking.graphics.TabWindowGraphicsS;	import fr.durss.skywar.skypacking.graphics.TabWindowSelectedGraphicsS;	import com.nurun.components.scroll.scroller.scrollbar.ScrollbarClassicSkin;	import flash.display.MovieClip;	import flash.display.Sprite;	import flash.events.Event;	import flash.events.EventDispatcher;	import flash.geom.Point;	/**	 * Contains the skins metrics.<br>	 * <br>	 * Fires an <code>Event.CHANGE</code> event when the skin is modified.<br>	 * All the view should listen to this event and update themselves consequently. 	 * 	 * @author  François	 */	public class SkinMetrics extends EventDispatcher {				public static var SKIN_SKATCH:String	= "skatch";
		public static var SKIN_DANGREN:String	= "dangren";		private var _skin:String;				private static var _instance:SkinMetrics;						/* *********** *		 * CONSTRUCTOR *		 * *********** */		/**		 * Creates an instance of <code>SkinMetrics</code>		 */		public function SkinMetrics(enforcer:SingletonEnforcer){			enforcer;		// Avoiding unused warning from FDT 3			_skin = SharedObjectManager.getInstance().skin;		}						/* ***************** *		 * GETTERS / SETTERS *		 * ***************** */		/**		 * Singleton instance getter		 */		public static function getInstance(): SkinMetrics{			if(_instance == null)_instance = new  SkinMetrics(new SingletonEnforcer());			return _instance;			}				/**		 * Gets the currently applied skin.		 */		public function get currentSkin():String					{ return (_skin == null)? SKIN_SKATCH : _skin; }				/**		 * Gets the window's tab button skin.		 */		public function get skinTabWindow():MovieClip				{ return new TabWindowGraphicsS(); }				/**		 * Gets the window's tab button selected skin.		 */		public function get skinTabWindowSelected():MovieClip		{ return new TabWindowSelectedGraphicsS(); }				/**		 * Gets the submit button's skin.		 */		public function get skinSubmitButton():MovieClip			{ return new SubmitButtonGraphicsS(); }				/**		 * Gets the skin of the close button.		 */		public function get skinCloseAppButton():MovieClip			{ return new CloseAppGraphicsS(); }				/**		 * Gets the skin of the minimize button.		 */		public function get skinMinimizeAppButton():MovieClip		{ return new MinimizeAppGraphicsS(); }				/**		 * Gets the skin of the loadbar's background		 */		public function get skinLoadBarBack():Sprite				{ return new LoadBarBackgroundS(); }				/**		 * Gets the skin of the loadbar's background		 */		public function get skinLoadBarFill():Sprite				{ return new LoadBarFillS(); }				/**		 * Gets the checkbox's skin.		 */		public function get skinCheckBox():MovieClip				{ return new CheckBoxGraphicsS(); }				/**		 * Gets the selected checkbox's skin.		 */		public function get skinCheckBoxSelected():MovieClip		{ return new CheckBoxSelectedGraphicsS(); }				/**		 * Gets the frame of the current's skin.		 */		public function get frame():int								{ return 1; }				/**		 * Gets the position of the close application button.		 */		public function get closeAppButtonPos():Point				{ return new Point(300, 22); }				/**		 * Gets the position of the minimize application button.		 */		public function get minimizeAppButtonPos():Point			{ return new Point(278, 22); }		/**		 * Gets the scrollbars skin.		 */		public function get skinScroll():ScrollbarClassicSkin		{			var upBt:MovieClip			= null;//(_skin == SKIN_DANGREN)? new SkinScrollUpD() : new SkinScrollUpS();			var downBt:MovieClip		= null;//(_skin == SKIN_DANGREN)? new SkinScrollDownD() : new SkinScrollDownS();			var trackBt:MovieClip		= new SkinScrollTrackS();			var scrollerBt:MovieClip	= new SkinScrollThumbS();			return new ScrollbarClassicSkin(upBt, downBt, scrollerBt, null, trackBt);		}						/* ****** *		 * PUBLIC *		 * ****** */		/**		 * Loads a new skin.<p>		 */		public function loadSkin(skin:String):void {			if(_skin == skin) return;			_skin = skin;			dispatchEvent(new Event(Event.CHANGE));		}						/* ******* *		 * PRIVATE *		 * ******* */			}}internal class SingletonEnforcer{}