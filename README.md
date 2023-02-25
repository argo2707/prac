# Practice
Смарт-контракт, который отправляет деньги наследникам, если владелец не длительное время не взаимодействует со смарт-контрактом.

*Код написан Аргоковой Дарья Андреевной группа 4932*

Разработано на языке Solidity.

Блокчейн-Binance Smart Chain.

[Документация для Solidity](https://soliditylang.org/)

Для тестирования программы понадобиться 5 кошельков:
Один владелец,
Три наследника,
Один сторонний пользователь.

## Функции

- Функция, которая обрабатывается один раз, при развертывании конракта в блокчейне.
Здесь мы определяем владельца, тот кто развернул смарт контракт.
И обновляем таймер.
```
constructor() 
```

- Модификатор для функции, который позволяет только владельцу пользоваться функцией.
```
modifier interactOwner()
```

- Функция, обрабатывающая переводы, которые пришли через неизвестную для контракта функцию.
```
fallback() external payable
```

- Функция, обрабатывающая переводы, которые пришли на контракт без вызова функции.
```
receive() external payable
```

- Функция, которая принимает платежи.
```
function getPay() external payable
```

- Функция, которая записывает данные о вкладчиках в массив и mapping.
```
setAddr (address client,uint amount) private
```

- Функция возвращает баланс контракта.
```
getBalance() external returns(uint balance)
```

- Функция возвращает количество вложенных денег .
```
getBalance(address account) external returns(uint balance)
```

- Функция для вывода денег вкладчика с контракта.
```
sendToContri (address account) public
```

- Функция для начисление процентов вкладчикам к их вложениям
```
percentageIncrease() public interactOwner
```

- Функция для отправки денег с контракта(доступен только владельцу).
```
sendTo(address payable account,uint amount) public interactOwner
```

- Функция для перечисления денег с контракта наследникам
```
sendToHeit() public
```

- Функция для перечисления денег
```
send(address payable account,uint amount) private
```

- Функция для обновления таймера
```
timerUpdate() private
```
## Переменные

- Адрес владельца контракта
```
address public owner
```
- Начало отсчета таймера
```
uint public timer
```
- Значение таймера
```
uint8 constant inc=10
```
- Количество наследников
```
uint8 public amountHeir=3
```
- Хранение адреса и сумму вложения
```
mapping (address=>uint256) public accounts
```
- Хранение адресов для доступа к mapping
```
address[] public addr
```
