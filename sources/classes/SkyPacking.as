package {	import flash.events.ErrorEvent;	import flash.events.Event;	import flash.events.ProgressEvent;	import flash.filters.GlowFilter;	import flash.text.TextField;	import flash.text.TextFieldAutoSize;	/**	 * Bootstrap class of the SWF application.	 * Must be set as the main class for the flex sdk compiler	 * but actually the real bootstrap class will be the factoryClass	 * designated in the metadata instruction.	 * 	 * @author Francois	 */	 	[SWF(width="320", height="360", backgroundColor="0xFFFFFF", frameRate="31")]	[Frame(factoryClass="SkyPackingLoader")]	public class SkyPacking extends SkyPackingAir {				private var _percentTxt:TextField;		private var _spinning:MainLoaderGraphics;								/* *********** *		 * CONSTRUCTOR *		 * *********** */		/**		 * Creates an instance of <code>Application</code>.<br>		 */		public function SkyPacking() {			super();			_loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,	loadProgressHandler);						_percentTxt				= new TextField();			_percentTxt.textColor	= 0x000000;			_percentTxt.autoSize	= TextFieldAutoSize.CENTER;			_spinning				= addChild(new MainLoaderGraphics()) as MainLoaderGraphics;			_spinning.filters		= [new GlowFilter(0x272B24, 1, 5, 5, 1.5, 3)];			addChild(_percentTxt);			addEventListener(Event.ENTER_FRAME,		enterFrameHandler);		}						/* ***************** *		 * GETTERS / SETTERS *		 * ***************** */		/* ****** *		 * PUBLIC *		 * ****** */						/* ******* *		 * PRIVATE *		 * ******* */		/**		 * Initialize the application/		 */		override protected function initialize(e:Event):void {			removeChild(_percentTxt);			removeChild(_spinning);			super.initialize(e);			removeEventListener(Event.ENTER_FRAME, enterFrameHandler);		}				/**		 * Called if an error uccors on loading.		 */		override protected function initErrorHandler(e:ErrorEvent):void {			removeChild(_percentTxt);			removeChild(_spinning);			super.initErrorHandler(e);			removeEventListener(Event.ENTER_FRAME, enterFrameHandler);		}				/**		 * Called on font loading progression.		 */		private function loadProgressHandler(e:ProgressEvent):void {			var percent:Number = Math.round(e.bytesLoaded / e.bytesTotal * 100);			_percentTxt.htmlText	= "<font size=\"10\">"+percent+"</font>";		}				/**		 * Called on ENTER_FRAME event to rotate the spin.		 */		private function enterFrameHandler(e:Event = null):void {			_spinning.rotation -= 25;			_percentTxt.x	= Math.round((stage.stageWidth - _percentTxt.width) * .5) + 2;			_percentTxt.y	= Math.round((stage.stageHeight - _percentTxt.height) * .5);			_spinning.x		= Math.round((stage.stageWidth) * .5) + 1;			_spinning.y		= Math.round((stage.stageHeight) * .5);		}			}}