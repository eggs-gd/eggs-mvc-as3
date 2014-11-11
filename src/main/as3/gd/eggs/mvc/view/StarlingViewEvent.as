package gd.eggs.mvc.view {
    import starling.events.Event;


    /**
     * Базовый класс события, отсылаемого представлением
     * @author Dukobpa3
     */
    public class StarlingViewEvent extends Event {

        private var _subType:String;

        /**
         * Создает новое событие вьюхи
         * @param    eventType - тип (восновном ViewEvent.CHANGE)
         * @param    subType - подтип - можно указывать любой удобный.
         * @param    data - данные передаваемые с событием.
         * @param    bubbles
         * //TODO свернуть тип, так как везде одинаковый. Ставить автоматом.
         */
        public function StarlingViewEvent(eventType:String, subType:String, data:Object = null, bubbles:Boolean = false) {
            _subType = subType;

            super(eventType, bubbles, data);
        }

        /**
         * Тип события от представления
         */
        public function get subType():String { return _subType; }

    }

}