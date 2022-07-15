// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Countdown{
    address public owner;
    uint public timer;
    uint8 constant inc=10;
    uint8 public amountHeir=3;
    mapping (address=>uint256) public accounts;//contributors
    address[] public addr;

    constructor(){
        owner=msg.sender;
        timerUpdate();
    }
    //модификатор для владельца
    modifier interactOwner(){
        require(msg.sender==owner,"No owner");
        timerUpdate();
        _;
    }
    //вызывается неизвестная функция
    fallback() external payable{
        if(owner==msg.sender){
            timerUpdate();
        }
        setAddr(msg.sender,msg.value);
    }
    //деньги просто пришли без функции на смарт контракт
    receive() external payable{
        if(owner==msg.sender){
            timerUpdate();
        }
        setAddr(msg.sender,msg.value);
    }
    //пришли деньги через функцию
    function getPay() external payable{
        if(owner==msg.sender){
            timerUpdate();
        }
        setAddr(msg.sender,msg.value);
    }
    //проверка есть ли этот кошелек в mapping
    function setAddr (address client,uint amount)private{
        accounts[client]+=amount;
        if (addr.length==0){
            addr.push(msg.sender);}
        for(uint i = 0; i < addr.length; i++)
        {
            if(addr[i] == client){
                break;
            }else if(i==addr.length-1){
                addr.push(msg.sender);
            }
        }
    }
    //проверка баланса контракта
    function getBalance() external returns(uint balance){
        if(owner==msg.sender){
            timerUpdate();
        }
        balance=address(this).balance;
    }
    //проверка баланса вкладчиков
    function getBalance(address account) external returns(uint balance){
        if(owner==msg.sender){
            timerUpdate();
        }
        balance=accounts[account];
    }
    //вывод денег вкладчиков
    function sendToContri (address account) public {
        for(uint i = 0; i < addr.length; i++)
        {
            uint balance=accounts[addr[i]];
            if(addr[i] == account){
                payable(addr[i]).transfer(balance);
            }else if(i==addr.length-1){
                break;
            }
        }
    }
    //увеличение процентов
    function percentageIncrease() public interactOwner{
        for(uint i = 0; i < addr.length; i++)
        {
            accounts[addr[i]]+=uint((accounts[addr[i]])/20);
        }
    }
    //перевод денег с контракта(доступно только владельцу)
    function sendTo(address payable account,uint amount) public interactOwner{
        send(account,amount);
    }
    //перевод денег наследникам
    function sendToHeit() public{
        if(owner==msg.sender){
            timerUpdate();
        }
        require(timer+inc<block.timestamp,"Timer has not ended");
        require(address(this).balance!=0,"Contract is empty");
        uint balance=uint((address(this).balance)/amountHeir);
        if (amountHeir==3){
            send(payable(0xfEE6654fbC7ab0Ee57EbD3c59a3977E43Bab7038),balance);
        }else if(amountHeir==2){
            send(payable(0x59C224A9BC071b71DBa613735B08a39C6844B15D),balance);
        }else{
            send(payable(0x1F96000fe56c038aaa2029E680FfE9A64c25640d),balance);}
        amountHeir--;
    }
    //функция перевода
    function send(address payable account,uint amount) private{
        account.transfer(amount);
    }
    //обновление таймера
    function timerUpdate() private {
        timer=block.timestamp;
    }
}
