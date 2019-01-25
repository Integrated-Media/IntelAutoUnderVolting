# Intel Auto Undervolt

Simply a tool to undervolt your Intel iGPU and CPU, with as little user input as possible. 

  - Tiny, just killobytes
  - Easy to modify
  - The lazy way to undervolt

### Usage

Download [XTU](https://downloadcenter.intel.com/download/24075/Intel-Extreme-Tuning-Utility-Intel-XTU-) and install it. (this is a dependancy!)
 - Intel was a dick and has shortend the CPU support list for XTU, removing some CPU's such as the i5-8250u. If that's the case for you, try [this older version](https://drive.google.com/file/d/1df1iv8W1XWWc5AcJmUpAYc9PbeDL6U2n/view?usp=sharing)
 - Download this repository as a zip file, extract all, and then run `autoundervolt.bat` as an administrator
 - Run your stress test program of choice during the CPU & iGPU undervolting process.
 - Your system WILL crash, this is normal and expected and happens when the undervolt has gone too far. 
 - You'll find the latest stable undervolt in `cpuunder.txt` and `gpuunder.txt` which you can manually apply
