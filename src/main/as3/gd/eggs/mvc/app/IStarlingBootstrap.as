package gd.eggs.mvc.app {
    import starling.display.DisplayObjectContainer;


    /**
     * Интерфейс инициализатора приложения
     * Можно имплементить документ-классом, можно вынести в отдельный класс.
     */
    public interface IStarlingBootstrap {
        //=========================================================================
        //	METHODS
        //=========================================================================
        /** Сначала регистрируем все модели */
        function registerModels():void;

        /** Далее вьюхи */
        function registerViews(root:DisplayObjectContainer):void;

        /** В последнюю очередь регистрируются контроллеры */
        function registerControllers():void;

        /**
         * стартуем всё
         */
        function startup():void;
    }

}
