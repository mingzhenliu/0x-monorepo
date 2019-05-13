## 1、[solidity 的语法](https://solidity-cn.readthedocs.io/zh/develop/)

## 2、[solidity 的指令](https://solidity.readthedocs.io/en/v0.5.5/assembly.html)

### 2.1、call 函数

### 2.2、[fallback-function](https://solidity.readthedocs.io/en/v0.5.5/contracts.html#fallback-function)

合同可以只有一個未命名的功能。此函數不能有參數，不能返回任何內容，必須具有外部可見性。如果沒有其他函數與給定的函數標識符匹配（或者根本沒有提供數據），則在調用合同時執行它。

## 3、[abi说明](https://solidity-cn.readthedocs.io/zh/develop/abi-spec.html)

## 4、MultiSigWallet

可以参考文章https://www.bokconsulting.com.au/blog/guide-to-using-the-gnosis-multisig-wallet/



## 5、[Exchange流程](https://github.com/0xProject/wiki/blob/master/tutorials/1-Create%2C-Validate%2C-Fill-Order.md)



![0x_v2_trade_erc20_erc20.png](https://github.com/0xProject/0x-protocol-specification/blob/master/v2/img/0x_v2_trade_erc20_erc20.png?raw=true)

### 5.1 Approvals and WETH Balance

允许proxy合约转账 

### 5.2 Creating an order

### 5.3 Signing the order

#### 5.4 Filling the order

相关名词解释。

ZRX是0x协议的通证，是REC20标准的通证，在以太坊网络中发行和流通。

WETH  Wrapped Ether。<https://app.radarrelay.com/ZRX/WETH>



## 6、[web3j]( https://github.com/ethereum/web3.js)

可以参考：https://github.com/leopoldjoy/react-ethereum-dapp-example

## 7、 DApp开发流程

可以参考：https://www.imooc.com/article/31140



## 8、0x主要的合约

例如：

{

​        erc20Proxy: '0x1dc4c1cefef38a777b15aa20260a54e584b16c48',

​        erc721Proxy: '0x1d7022f5b17d2f8b695918fb48fa1089c9f85401',

​        zrxToken: '0x871dd7c2b4b25e1aa18728e9d5f2af4c4e431f5c',

​        etherToken: '0x0b1ba0af832d7c05fd64161e0db78e85978e8082',

​        exchange: '0x48bacb9266a570d521063ef5dd96e61686dbe788',

​        assetProxyOwner: '0x04b5dadd2c0d6a261bfafbc964e0cac48585def3',

​        forwarder: '0x6000eca38b8b5bba64986182fe2a69c57f6b5414',

​        orderValidator: '0x32eecaf51dfea9618e9bc94e9fbfddb1bbdcba15',

​        dutchAuction: '0x7e3f4e1deb8d3a05d9d2da87d9521268d0ec3239',

​        coordinatorRegistry: '0xaa86dda78e9434aca114b6676fc742a18d15a1cc',

​        coordinator: '0x4d3d5c850dd5bd9d6f4adda3dd039a3c8054ca29',

}

