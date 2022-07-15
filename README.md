# practice

Разработано на языке Solidity.

Блокчейн-Binance Smart Chain.

[Документация для Solidity](https://soliditylang.org/)

Для проверки программы понадобиться 5 кошельков:
Один владелец,
Три наследника,
Один сторонний пользователь.

## Функции
```
constructor() 
```
- Функция, которая обрабатывается один раз, при развертывании конракта в блокчейне.
Здесь мы определяем владельца, тот кто развернул смарт контракт.
И обновляем таймер.

```
modifier interactOwner()
```
- Модификатордля функции, который позволяет только владельцу пользоваться функцией.

```
fallback() external payable
```
- Функция, обрабатывающая переводы, которые пришли через неизвестную для контракта функцию.

```
receive() external payable
```
- Функция, обрабатывающая переводы, которые пришли на контракт без вызова функции.

```
function getPay() external payable
```
- Функция, которая принимает платежи.

```
setAddr (address client,uint amount) private
```
- Функция, которая записывает данные о вкладчиках в массив и mapping.

```
getBalance() external returns(uint balance)
```
- Функция возвращает баланс контракта.

```
getBalance(address account) external returns(uint balance)
```
- Функция возвращает количество вложенных денег .

```
sendToContri (address account) public
```
- Функция для вывода денег вкладчика с контракта.

```
percentageIncrease() public interactOwner
```
- Функция для начисление процентов вкладчикам к их вложениям

```
sendTo(address payable account,uint amount) public interactOwner
```
- Функция для отправки денег с контракта(доступен только владельцу).

```
sendToHeit() public
```
- Функция для перечисления денег с контракта наследникам

```
send(address payable account,uint amount) private
```
- Функция для перечисления денег

```
timerUpdate() private
```
- Функция для обновления таймера


