# IEEE-754-FLOATING-POINT-CONVERTER (SCILAB)
This project is a Scilab-based implementation of the **IEEE 754 Standard for Floating-Point Arithmetic**. It focuses on converting decimal numbers into their 32-bit single-precision binary representation, a fundamental concept in **Computer Organization and Architecture (COA)**.

## 💻 Overview

In the modern computing, representing real numbers (fractions) requires a standardized format to ensure precision and portability. This tool (IEEE-754-FLOATING-POINT-CONVERTER) takes a decimal input and breaks it down into the three core components:
1.  **Sign Bit** (1 bit)
2.  **Biased Exponent** (8 bits)
3.  **Mantissa/Significand** (23 bits)

## ✨ Features

* **Decimal to Binary Conversion:** Handles both integer and fractional parts.
* **Normalization:** Automatically shifts the binary point and calculates the exponent.
* **Bias Handling:** Implements the $+127$ bias for single precision.
* **Edge Case Support:** Identifies positive/negative signs and handles bit padding.

# 🖼️ Screenshot of the output

</br>

![Project Screenshot](Assets/Screenshot%202026-04-26%20010330.png)