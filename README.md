# RISC-V-Processor


<!--
*** Thanks for checking out this README Template. If you have a suggestion that would
*** make this better, please fork the repo and create a pull request or simply open
*** an issue with the tag "enhancement".
*** Thanks again! Now go create something AMAZING! :D
-->





<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
<!-- [![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url] -->



<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://riscv.org">
    <img src="images/RISCV.png" alt="Logo" width="300" height="56">
  </a>

  <h3 align="center">Open Source RISC ISA</h3>

  <p align="center">
    Verilog implementation of 32-bit RISC-V processor!
    <br />
    <a href="https://riscv.org/technical/specifications/"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <!-- <a href="https://github.com/othneildrew/Best-README-Template">View Demo</a> -->
    ·
    <a href="https://github.com/ash-olakangal/RISC-V-Processor/issues">Report Bug</a>
    ·
    <!-- <a href="https://github.com/othneildrew/Best-README-Template/issues">Request Feature</a> -->
  </p>
</p>



<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
  * [Project Structure](#project-structure)
* [Tools Used](#tools-used)
  * [iVerilog](#iVerilog)
  * [GTKWave](#GTKWave)
* [Getting Started](#getting-started)
* [License](#license)



<!-- ABOUT THE PROJECT -->
## About The Project

In this project we implement a 32-bit, RISC-V ISA based processor in verilog. The sub-modules that are used and their interaction with each other are shown in the following picture.

<p align="center">
    <img src = "images/Processor.png">
    <br>
    </br>
    <p>Output waveform using GTKWave:
    </p>
    <p align = "center">
    <img src = "images/Waveform.png" width="607" height="387">
    </p>
</p>

 


### Project Structure:

* Each sub-unit that has been created has its own folder in root of the repository.
* This sub-unit folder comprises of the modules used in that particular unit.
* Additionally it consists of testbench and waveform used for testing and debugging those modules.
* The final processor implementation is in the folder called "Processor". 
* This uses all the relevent units created individually and integrates them to give us our working processor.



## Tools Used

### [iVerilog](https://github.com/steveicarus/iverilog): 

While there are many compilers for verilog present, not many of them are open source, and even fewer are robust, user-friendly and updated regularly. [Icarus Verilog](https://github.com/steveicarus/iverilog) checks all boxes and can be learnt easily with this really [helpful wiki](https://iverilog.fandom.com/wiki/Main_Page) setup for it.

### [GTKWave](https://sourceforge.net/projects/gtkwave/files/):

Another really powerful open source tool that was essential in building this project was [GTKWave](https://github.com/gtkwave/gtkwave). It helps to view vcd and other waveforms. Really important for debugging and understanding if dependencies of different signals are as described by you.



<!-- GETTING STARTED -->
## Getting Started

This is an example of how you may give instructions on setting up your project locally.
To get a local copy up and running follow these simple example steps.

### Setting up instructions

Before we begin to run our processor we must initialize the instruction memory with the desired sequence of instructions that we want to execute. By default 8 instructions are included that will execute in that particular sequence of initialization.

### Initializing the register file

In order to implement instructions we must have values in the register to act upon, these values can be initialized in the register file. By default each register is initialized to have a value the same as the _register number - 1._ 
    Example: Register 14 will have value 13.

### Running the processor

Once the above initializations have been done as desired, compile the file "Processor_tb.v" using iverilog using the following command:

* compilation

```sh
iverilog -o gen-compiled "Processor_tb.v"
```
The above command generates a compile file named as "gen-compile". After compilation we can execute the compiled file using:
* execution

```sh
vvp gen-compiled
```

### Viewing waveform

1. The waveform generated from testbench is named as "output_wave.vcd"
2. Use GTKWave to view the waveform file

```sh
gtkwave output_wave.vcd
```

<!-- USAGE EXAMPLES -->
<!-- ## Usage

Use this space to show useful examples of how a project can be used. Additional screenshots, code examples and demos work well in this space. You may also link to more resources.

_For more examples, please refer to the [Documentation](https://example.com)_ -->

<!-- ROADMAP -->
<!-- ## Roadmap

See the [open issues](https://github.com/othneildrew/Best-README-Template/issues) for a list of proposed features (and known issues).



<!-- CONTRIBUTING -->
<!-- ## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request --> 

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.

<!-- CONTACT -->
Project Link: [https://github.com/ash-olakangal/RISC-V-Processor](https://github.com/ash-olakangal/RISC-V-Processor)


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=flat-square
[contributors-url]: https://github.com/othneildrew/Best-README-Template/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/othneildrew/Best-README-Template.svg?style=flat-square
[forks-url]: https://github.com/othneildrew/Best-README-Template/network/members
[stars-shield]: https://img.shields.io/github/stars/othneildrew/Best-README-Template.svg?style=flat-square
[stars-url]: https://github.com/othneildrew/Best-README-Template/stargazers
[issues-shield]: https://img.shields.io/github/issues/othneildrew/Best-README-Template.svg?style=flat-square
[issues-url]: https://github.com/othneildrew/Best-README-Template/issues
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=flat-square
[license-url]: https://github.com/othneildrew/Best-README-Template/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/othneildrew
[product-screenshot]: images/screenshot.png