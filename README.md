# Firmware Upgradation GUI

This repository contains a remote GUI for firmware upgradation, specifically designed for the Parallax P2X8C4M64P microcontroller. The code is written in the Spin programming language, a custom language developed by Parallax Inc. This project is part of the summer internship 2024.

## Parallax P2X8C4M64P Microcontroller

### Key Specifications

- **Cores:** 8 x 32-bit cores, each with 4 KB dual-port RAM
- **Memory:** 512 KB shared RAM
- **I/O:** 64 identical Smart I/O pins
- **Power:** Core @ 1.8 VDC, I/O pins @ 3.3 VDC
- **Clock:** Internal ~24 MHz and ~20 kHz RC oscillators
- **Low-power mode:** ~130 µA
- **Frequency:** 180 MHz typical, 320 MHz extended
- **Performance:** 
  - Hub access speed: 720 MB/s/cog @180 MHz
  - Max execution: 720 MIPs (90 MIPs/cog) @180 MHz

### Physical Characteristics

- **Package:** 14x14 mm exposed-pad 100-pin TQFP
- **Operating temperature:** -40 to +105°C
- **Moisture Sensitivity Level (MSL):** 3 (168 hours)

### Compliance

- RoHS3 Compliant (EU 2011/65/EU)
- REACH Compliant (EU EC 1907/2006)
- ECCN 3A991A2 (EU EAR99)
- HTSUS 8542.31.0001

### Hardware Function Highlights

- **ADC:** 64 x 14-bit
  - Modes: Delta-Sigma, SINC1/2/3, Scope
- **Atomic Locks:** 16 locks accessible by all cogs
- **CORDIC math solver:** 54 stage, 8 function
- **Counter Modes:** 28 per cog & 64-bit hub global
- **DAC:** 64 x 16-bit, 3 ns 75 ohm
- **Debug:** Single-stepping & breakpoint interrupts
- **Drive modes:** 1.5k, 15k, 150k, 1mA, 100µA, 10µA
- **Event & timer modes:** 16 per cog
- **Interrupts:** 3 per cog, 16 event sources
- **Math functions:** SIN, LOG, TAN, ARC
- **PWM:** Triangle, Sawtooth, SMPS
- **USB:** 12 Mbps
- **Video:** 
  - Analog: VGA/HDTV/NTSC/PAL
  - Digital: HDMI 480p @60fps, 720p @24fps
- **PRNG:** Xoroshiro128 (noise-seeded)

## Getting Started

You can set it up by following the hardware manual and Spin assembly language manual attached in this repo.

## Contributing

We welcome contributions to improve the Firmware Upgradation GUI! Here are some ways you can contribute:

1. Report bugs or suggest features by opening issues.
2. Improve documentation, including this README and code comments.
3. Submit pull requests with bug fixes or new features.
4. Share your experience using the GUI with the community.

Before contributing, please:

- Check existing issues and pull requests to avoid duplicates.
- Follow the existing code style and conventions.
- Write clear commit messages and documentation.
- Test your changes thoroughly before submitting a pull request.

For major changes, please open an issue first to discuss what you would like to change. We appreciate your efforts to make this project better!

## Acknowledgments

- Special thanks to @Sniffsneaker for the contributions to the project.

Feel free to contact the project maintainers for any questions or concerns.
