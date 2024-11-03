<!DOCTYPE html>
<html>
<head>

</head>
<body>

<h1>FPGA Project with AD9833 Signal Generator</h1>

<p>This repository contains code and documentation for implementing an FPGA-based project utilizing the AD9833 signal generator chip.</p>

<h2>Project Overview</h2>
<p>The primary objectives of this project are to configure the AD9833 to generate specific waveforms (triangular and sinusoidal) and to establish communication between the FPGA and the AD9833 via SPI protocol.</p>

<h2>Project Requirements</h2>
<ul>
    <li>FPGA platform (configured as SPI Master)</li>
    <li>AD9833 Signal Generator (configured as SPI Slave)</li>
    <li>Oscillator with 100 MHz frequency for clock signal generation</li>
</ul>

<h2>Project Setup</h2>
<ol>
    <li>Initialize three main registers on the AD9833: 
        <ul>
            <li>Control Register</li>
            <li>Frequency Register</li>
            <li>Phase Register</li>
        </ul>
    </li>
    <li>Set up an FPGA code module with the following:
        <ul>
            <li>Clock signal generation and management</li>
            <li>SPI communication configuration for data transfer</li>
            <li>Signal waveform settings (9 kHz triangular, 800 kHz sinusoidal)</li>
        </ul>
    </li>
    <li>Configure multiple AD9833 chips on a shared SPI bus with a unique Chip Select for each chip.</li>
</ol>

<h2>Usage Instructions</h2>
<p>Follow the steps below to simulate and implement the design:</p>
<ol>
    <li>Use either ISE or Vivado software to build and simulate the project.</li>
    <li>Ensure that each module has a corresponding testbench for verification.</li>
    <li>Analyze output waveforms for signal correctness.</li>
</ol>

<h2>Features</h2>
<ul>
    <li>Clock generation from a 100 MHz oscillator to produce required signals for AD9833</li>
    <li>SPI communication implementation to configure AD9833 registers</li>
    <li>Customizable waveform frequency and type</li>
</ul>

<h2>Testing and Verification</h2>
<p>The project includes testbenches for each module to ensure the following:</p>
<ul>
    <li>Correct initialization of AD9833 registers</li>
    <li>Accurate generation of clock and reset signals</li>
    <li>Waveform output validation (9 kHz triangular and maximum 800 kHz sinusoidal)</li>
</ul>

<h2>Resources</h2>
<ul>
    <li><a href="https://www.analog.com/en/products/ad9833.html#product-overview">AD9833 Product Overview</a></li>
    <li><a href="https://www.analog.com/media/en/technical-documentation/application-notes/AN-1070.pdf">AD9833 Application Notes</a></li>
</ul>


</body>
</html>
