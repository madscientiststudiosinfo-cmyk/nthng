# Protocol Specification - Privacy Focused

- **No Metadata:** No timestamp metadata stored on servers. Clients manage local-only temporal ordering.
- **Privacy First:** Server nodes function as blind, decentralized relays. They only process encrypted packets without visibility into sender, receiver, or timestamps.
- **Handshake:** ECDH combined with Post-Quantum KEM (Key Encapsulation Mechanism)
- **Message Routing:** Onion-routed encapsulated packets through the decentralized network.
- **Data Encrypted:** Messages are E2EE encrypted using a shared secret derived from the handshake.
- **Group Chats:** Each group has a unique E2EE key set, managed through a decentralized key distribution protocol.
