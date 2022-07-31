// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;
 interface ERC20 {
    function totalSupply() external view returns (uint);
    function balanceOf(address tokenOwner) external view returns (uint balance);
    function allowance(address tokenOwner, address spender) external view returns (uint remaining);
    function transfer(address to, uint tokens) external returns (bool success);
    function approve(address spender, uint tokens) external returns (bool success);
    function transferFrom(address from, address to, uint tokens) external returns (bool success);
 
    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}
contract Safemath{
     function sub(uint256 a, uint256 b) internal pure returns (uint256) {
  assert(b <= a);
  return a - b;
}
function add(uint256 a, uint256 b) internal pure returns (uint256)   {
  uint256 c = a + b;
  assert(c >= a);
  return c;
}

}
contract Token is ERC20,Safemath{
    string public name;
    string public symbol;
    uint public _totalSupply;
    uint public decimals;
    mapping(address => uint)public balance;
    mapping (address =>mapping(address=>uint))public allowed;

    constructor(string memory _name,string memory _sym,uint _totalsupply, uint _decimal){
name = _name;
symbol = _sym;
_totalSupply =_totalsupply;
decimals = _decimal;
balance[msg.sender] = _totalsupply;
    }
function totalSupply()public override view returns(uint){
    return _totalSupply;
}
function balanceOf(address _tokenOwner)public override view returns(uint){
    return balance[_tokenOwner];
}
function transfer(address _to,uint _tokens)public override returns(bool){
    balance[msg.sender] = sub(balance[msg.sender], _tokens);
    balance[_to] = add(balance[_to],_tokens);
    emit Transfer(msg.sender,_to,_tokens);
    return true;
}
function transferFrom(address _from,address _to,uint _tokens)public override returns(bool){
    balance[_from] = sub(balance[_from], _tokens);
    allowed[_from][msg.sender] = sub(allowed[_from][msg.sender],_tokens);
    balance[_to] = add(balance[_to],_tokens);
     emit Transfer(_from,_to,_tokens);
    return true;
}
function approve(address _spender,uint _tokens)public override  returns(bool){
    allowed[msg.sender][_spender] = _tokens;
    emit Approval(msg.sender,_spender,_tokens);
    return true;
}
function allowance(address _tokenOwner,address _spender)public override view returns(uint){
   return allowed[_tokenOwner][_spender];
}
  
}