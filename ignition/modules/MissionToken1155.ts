import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const Erc1155Module = buildModule("Erc1155Module", (m) => {
  const initialUri = m.getParameter("initialUri", "https://example.com");
  const ownerAddress = m.getParameter(
    "ownerAddress",
    "0xA327BE0ABfA6391acdDC0BC6D4F914607d872153" // for testing
  );

  const erc1155 = m.contract("MissionToken1155", [initialUri, ownerAddress]);

  return { erc1155 };
});

export default Erc1155Module;
