# some -------------------------------
## provider
### provider_min
- lite example to use Like State Manager
![screen_search](img/provider_min.jpg)
..
## a1 &a2 &a3 a2_multi_bloc_provider 
- MultiProvider + logs config
![screen_search](img/a3_bloc.jpg)
..
## bloc_examples
### bloc_lite_list 
![screen_search](img/bloc_lite_list.jpg)
..
## context_read_watch_select/bloc_with_context
### bloc_with_context 
![screen_search](img/context_read_watch_select.jpg)
..

## context_read_watch_select/bloc_listener_selector
### bloc_listener_selector
**BlocBuilder**:
- Используется для построения UI на основе состояний, предоставляемых `Bloc`
- Подобен `context.watch()`, так как подписывается на все изменения состояния блока
**BlocListener**:
- Предназначен для выполнения побочных эффектов в ответ на изменения состояния, но не обновляет пользовательский интерфейс.
- Подходит для выполнения таких задач, как навигация, показ уведомлений и т.д
**BlocConsumer**: Комбинирует функциональность BlocBuilder и BlocListener
- Позволяет одновременно слушать изменения состояния и строить UI.
- Подобен комбинации `context.watch()` и `context.read()`.
**BlocSelector**:
- Подобен `context.select()`, позволяет выбрать часть состояния блока и подписаться только на изменения этой части.
- Обеспечивает более гибкий и оптимизированный способ работы с состоянием блока.
..


