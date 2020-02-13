module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!
  networks: {
    development: {
      host: "127.0.0.1",
      port: 854,
      network_id: "*" // Match any network id
    },
    solc: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    },
    develop: {
      port: 854
    }
  }
};
