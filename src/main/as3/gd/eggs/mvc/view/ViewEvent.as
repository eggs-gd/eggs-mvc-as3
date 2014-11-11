﻿package gd.eggs.mvc.view {
    import flash.events.Event;


    /**
     * Базовый класс события, отсылаемого представлением
     * @author Dukobpa3
     */
    public class ViewEvent extends Event {
        private var _subType:String;
        private var _data:Object;

        /**
         * Создает новое событие вьюхи
         * @param    eventType - тип (восновном ViewEvent.CHANGE)
         * @param    subType - подтип - можно указывать любой удобный.
         * @param    data - данные передаваемые с событием.
         * @param    bubbles
         * @param    cancelable
         * //TODO свернуть тип, так как везде одинаковый. Ставить автоматом.
         */
        public function ViewEvent(eventType:String, subType:String, data:Object = null, bubbles:Boolean = false, cancelable:Boolean = false) {
            _subType = subType;
            _data = data;

            super(eventType, bubbles, cancelable);
        }

        /**
         * Тип события от представления
         */
        public function get subType():String { return _subType; }

        /**
         * Данные отправляемые вместе с событием
         */
        public function get data():Object { return _data;}

    }

}