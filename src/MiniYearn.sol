//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.19;

// 0xD322A49006FC828F9B5B37Ab215F99B4E5caB19C -> WETHGateway

interface IWETHGateway{
    function depositETH(address onBehalfOf, uint16 referralCode) external payable;
    function withdrawETH(uint256 amount, address onBehalfOf) external;
}

contract MiniYearn {

    error CantidadIncorrecta();

    function deposit() public payable {
        if (msg.value == 0) revert CantidadIncorrecta();







    }



}
