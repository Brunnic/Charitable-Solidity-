require("@nomiclabs/hardhat-waffle");

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
    solidity: "0.8.4",
    networks: {
        ropsten: {
            url: "https://eth-ropsten.alchemyapi.io/v2/HWKBMO2PSxxwn7YQUy6dXk0b7xcuSiuJ",
            accounts: [
                "37793392690a2fcf2d7cd7b2ebd576c0bc65045ba49e5c28a53c51282c2810ab",
            ],
        },
    },
};
