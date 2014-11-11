package gd.eggs.mvc.view {
    import gd.eggs.mvc.model.IModel;
    import gd.eggs.util.IInitialize;

    import starling.display.Sprite;
    import starling.events.Event;


    [Event(name="viewChange", type="gd.eggs.mvc.view.StarlingViewEvent")]

    /**
     * Базовый класс-представление
     * При создании или установке модели добавляет коллбек по-умолчанию
     * При удалении модели или дестрое - удаляет его.
     * Остальные подписки следует добавить в инит и дестрой
     * @author Dukobpa3
     */
    public class StarlingView extends Sprite implements IInitialize, IView {
        /** Данные для отображения */
        protected var _model:IModel;

        private var _inited:Boolean;

        /**
         * Конструктор
         * @param    model модель (можно не указывать)
         * @param    update отрисовывать ли сразу при создании
         */
        public function StarlingView(model:IModel = null, update:Boolean = true) {
            if (model) {
                _model = model;
                _model.addCallback(this, "default", onModelChange);
                if (update) {
                    _model.refresh();
                }
            }
        }

        /**
         * Отображает вью.
         * Реализация по-умолчанию просто visible = true;
         * Для более эффектного появления на екране слудет переопредлить.
         */
        public function show():void {
            this.visible = true;
        }

        /**
         * Скрывает вью.
         * Реализация по-умолчанию просто visible = false;
         * Для более эффектного появления на екране слудет переопредлить.
         */
        public function hide():void {
            this.visible = false;
        }

        /**
         * Устанавливает модель
         * @param    model модель
         * @param    update нужно ли рендерить сразу после установки
         */
        public function setModel(model:IModel, update:Boolean = true):void {
            if (_model) {
                _model.removeCallback(this);
                _model = null;
            }

            _model = model;
            _model.addCallback(this, "default", onModelChange);
            if (update) {
                _model.refresh();
            }
        }

        /**
         * @inheritDoc
         */
        public function init():void {
            _inited = true;
        }

        /**
         * @inheritDoc
         * Отписывается от модели и обнуляет ссылку
         */
        public function destroy():void {
            removeEventListener(Event.ENTER_FRAME, onNextFrame);
            if (_model) {
                _model.removeCallback(this);
                _model = null;
            }

            _inited = false;
        }

        /**
         * Вызывает перерисовку вьюхи в следующем кадре
         */
        public function invalidate():void {
            if (!hasEventListener(Event.ENTER_FRAME)) {
                addEventListener(Event.ENTER_FRAME, onNextFrame);
            }
        }

        /**
         * Вызывает перерисовку вьюхи немедленно
         */
        public function invalidateNow():void {
            redraw();
        }

        //=====================================================================
        //		PRIVATE
        //=====================================================================

        /**
         * Обработка события изменения модели
         * Вызов отложенной перерисовки
         */
        private function onModelChange():void {
            if (!hasEventListener(Event.ENTER_FRAME)) {
                addEventListener(Event.ENTER_FRAME, onNextFrame);
            }
        }

        /**
         * обрабатываем событие модели о изменении оной.
         * Так же очищаем массив изменений модели после рендера.
         * @param    e
         */
        private function onNextFrame(e:Event):void {
            removeEventListener(Event.ENTER_FRAME, onNextFrame);
            redraw();
        }

        /**
         * Наследуемый метод обработки данных модели (перерисовка компонента)
         */
        protected function redraw():void {

        }

        /**
         * @inheritDoc
         */
        public function get isInited():Boolean { return _inited; }


    }

}