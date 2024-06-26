# NewsFromWorld


При первом запуске приложения:

1.  Отображается список всех доступных стран. Флаги стран загружаются асинхронно, чтобы не блокировать интерфейс. 
2.  После выбора как минимум одной страны появляется анимированная кнопка "Продолжить".
3.  Приложение начинает загрузку новостей из API (с использованием Alamofire).  Во время загрузки пользователь видит анимацию.

Интерфейс приложения:

   Отображаются новости.
   При прокрутке ленты новостей:
       Появляется анимированная кнопка "Вернуться наверх", когда пользователь прокручивает вниз.
       Появляется анимированная кнопка "В самый низ", когда пользователь прокручивает вверх.
       Кнопки исчезают с анимацией, когда пользователь прокручивает в противоположном направлении.

Действия пользователя:

   Нажатие на название новости: открывает оригинал новости в Safari (с использованием SafariServices).
   Нажатие на флаг страны: фильтрует новости, показывая только новости выбранной страны.
   Нажатие на значок шестеренки: открывает экран выбора стран, где пользователь может добавить или удалить страны из списка выбранных.

Повторный запуск приложения:

1.  Приложение загружает сохраненные данные из CoreData.
2.  Параллельно приложение запрашивает новые данные из API. 
3.  Приложение объединяет данные, удаляя дубликаты.


![Simulator Screenshot - iPhone 15](https://github.com/akulash4rk/NewsFromWorld/assets/159540365/a9e6bc9d-9b63-4938-8b9b-8e8fdff3ca6f)
![Simulator Screenshot - iPhone 15-2](https://github.com/akulash4rk/NewsFromWorld/assets/159540365/23080e21-4d49-46ea-aeb3-4c270b0fa7e8)
![Simulator Screenshot - iPhone 15-1](https://github.com/akulash4rk/NewsFromWorld/assets/159540365/7d34cb91-1d21-4aef-bf31-77002c8bb40b)
