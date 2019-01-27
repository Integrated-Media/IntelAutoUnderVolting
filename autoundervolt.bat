@echo off
Title IntelAutoUnderVolting
pushd %~dp0

::Check for XTU
if exist "C:\Program Files (x86)\Intel\Intel(R) Extreme Tuning Utility\Client\XTUCli.exe" echo XTUCLi.exe is found
if not exist "C:\Program Files (x86)\Intel\Intel(R) Extreme Tuning Utility\Client\XTUCli.exe" goto :needxtu
goto :foundxtu

:needxtu
Echo XTUCLi.exe is NOT found! Please install XTU and run this application again! (download page will open)
timeout -t 5 >nul
start https://downloadcenter.intel.com/download/24075/Intel-Extreme-Tuning-Utility-Intel-XTU-
echo press anykey to exit.
pause >nul
exit

:foundxtu
echo Undervolt CPU or iGPU?
echo 1: CPU
echo.
echo 2: iGPU

set/p "dowhat=Please enter (1-2): "
goto :%dowhat%

::CPU Undervolt Mode
:1
set/a cpuunder=-10
echo Now in CPU undervolting mode.
echo.
echo Please make sure you are running some kind of CPU stress testing program while this test runs. 
echo If you don't have one, download aida64 (https://www.aida64.co.uk/)
timeout -t 10
:cpuundervoltloop
echo Now testing a CPU voltage offset of %cpuunder%
Powershell.exe -executionpolicy remotesigned -File ps\apply-cpu.ps1 -under %cpuunder%
timeout -t 60
echo Last stable undervolt is %cpuunder% > cpuunder.txt
set/a cpuunder=%cpuunder%-10
goto :cpuundervoltloop


::iGPU Undervolt Mode
:2
set/a gpuunder=-10
echo Now in GPU undervolting mode.
echo.
echo Please make sure you are running some kind of GPU stress testing program while this test runs. 
echo If you don't have one, download aida64 or furmark
timeout -t 10
:gpuundervoltloop
echo Now testing a GPU voltage offset of %gpuunder%
Powershell.exe -executionpolicy remotesigned -File ps\apply-gpu.ps1 -under %gpuunder%
timeout -t 60
echo Last stable undervolt is %gpuunder% > gpuunder.txt
set/a gpuunder=%gpuunder%-10
goto :gpuundervoltloop