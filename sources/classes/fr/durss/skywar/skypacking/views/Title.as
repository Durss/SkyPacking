package fr.durss.skywar.skypacking.views {	import fr.durss.skywar.skypacking.data.Model;	import com.nurun.components.text.CssTextField;	import com.nurun.structure.mvc.model.events.IModelEvent;	import com.nurun.structure.mvc.views.IView;	import flash.events.Event;	/**	 * Displays the title over the grid.	 * 	 * @author  Francois	 */	public class Title extends AbstractSPView implements IView {				private var _label:CssTextField;						/* *********** *		 * CONSTRUCTOR *		 * *********** */		/**		 * Creates an instance of <code>Title</code>.		 */		public function Title() {			super();		}						/* ***************** *		 * GETTERS / SETTERS *		 * ***************** */		/* ****** *		 * PUBLIC *		 * ****** */		override public function update(e:IModelEvent):void {			var model:Model = e.model as Model;			var id:int = model.stateIndex;			if(id == 0) {				_label.text = "Reproduisez votre île.";			} else if(id == 1){				_label.text = "Placez vos solutions manuellement.";			} else if(id == 2){				_label.text = "Laissez l'algorithme calculer pour vous.";			} else if(id == 3){				_label.text = "Options :";			}else{				_label.text = "";			}			open();		}						/* ******* *		 * PRIVATE *		 * ******* */		/**		 * Initialize the class.		 */		override protected function initialize(e:Event):void {			super.initialize(e);			_label = addChild(new CssTextField("windowLabel")) as CssTextField;			_label.width = WIDTH;			_label.multiline = false;		}	}}