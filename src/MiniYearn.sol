//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.19;

import "@aave/misc/interfaces/IWrappedTokenGatewayV3.sol";
import "@solmate/tokens/ERC20.sol";

// 0xD322A49006FC828F9B5B37Ab215F99B4E5caB19C -> WETHGateway

contract MiniYearn is ERC20{

    constructor() ERC20("Nombre", "SYBL", 18) {
    }

    error CantidadIncorrecta();

    function deposit() public payable {
        if (msg.value == 0) revert CantidadIncorrecta();

        IWrappedTokenGatewayV3(0xD322A49006FC828F9B5B37Ab215F99B4E5caB19C)
        .depositETH{value:msg.value}(
            0x87870Bca3F3fD6335C3F4ce8392D69350B4fA4E2, //direccion de la Pool
            address(this)                               //direccion del que va a recivir los tokens de pool de aave
            , 0                                         //no queremos codigo de refereidos
            );
        _mint(msg.sender, msg.value);
    }

    function withraw(uint256 amount) public {
        if (amount > balanceOf[msg.sender]) revert CantidadIncorrecta();

        IWrappedTokenGatewayV3(0xD322A49006FC828F9B5B37Ab215F99B4E5caB19C)
        .withdrawETH(
            0x87870Bca3F3fD6335C3F4ce8392D69350B4fA4E2, //direccion de la Pool
            amount,                                    //cantidad a retirar
            msg.sender                                  //Persona que los va a recivir
        );
        
        _burn(msg.sender, amount);
    }
}
