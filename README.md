## FundMe: Smart Contract for Crowdfunding in Solidity

This repository contains the source code for a simple crowdfunding contract called `FundMe` built with Solidity and deployed using Foundry.

**Features:**

- Allows users to contribute funds (ETH) to a crowdfunding campaign.
- Tracks the amount contributed by each individual contributor.
- Only the owner of the contract can withdraw the collected funds.
- Uses Chainlink Price Feeds to ensure a minimum contribution amount in USD.

**Foundry Integration:**

This project uses Foundry for development, testing, and deployment. Foundry offers a powerful and efficient toolkit for building and managing Solidity smart contracts.

**Getting Started:**

For detailed instructions on setting up Foundry and using this project, please refer to the official Foundry documentation: https://book.getfoundry.sh/.

**Contract Breakdown:**

**PriceConverter.sol (not included)**: This file provides functions for converting ETH to USD using Chainlink Price Feeds.

**FundMe.sol:**

This file contains the main contract logic.

**State Variables:**

- `s_addressToAmountFunded`: Maps addresses to their corresponding contributions in ETH.
- `s_funders`: An array storing the addresses of all contributors.
- `i_owner`: The address of the contract owner (immutable).
- `s_priceFeed`: The Chainlink Price Feed interface for accessing price data.
- `MINIMUM_USD`: The minimum contribution amount in USD (constant).

**Functions:**

- **`constructor`:** Initializes the contract with the Chainlink price feed address.
- **`fund`:** Allows users to contribute ETH to the campaign.
- **`getVersion`:** Returns the version of the Chainlink price feed.
- **`withdraw`:** Only the owner can withdraw all collected funds.
- **`getFunder`:** Retrieves the address of a contributor by index.
- **`getAddressToAmountFunded`:** Retrieves the contribution amount of a specific address.
- **`getOwner`:** Returns the address of the contract owner.

**Modifiers:**

- `onlyOwner`: Restricts function calls to the contract owner.

**Fallback and receive:** Automatically triggers the `fund` function when receiving ETH.

**Note:** This is a basic example for learning purposes **and my first exploration using Foundry**. Real-world smart contracts require much more rigorous security considerations, testing, and audits before deployment.
