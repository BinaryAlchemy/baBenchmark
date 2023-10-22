# baBenchmark



This speedtest uses multiple different CPU and GPU tests to measure the speed of a computer.
The results are collected in a .csv table, which can be opened/imported into Excel.


How to use:

1) 
Optionally: Open a terminal/command prompt.
Execute the startup script for your OS.

baBenchmark\START_Windows_CPU.bat  [prependName] [appendName]


IMPORTANT NOTE for the CPU test regarding VRAY:
WINDOWS with CPU INTEL 12th Gen and later:
The new Intel CPUs have Performance and Efficiency cores.
Windows 10/11 automatically assigns the render to Efficiency cores only.
VRay does not tell Windows 10/11 to use all cores.
As a result, the column CPUv state about 34% only.
In this case, please start the command prompt with admin rights.
Then baBenchmark can tell Windows that these renderer should use all cores.


[prependName] and [appendName] are optional.
If you do not specify them, then the hostname is used for the name in the resulting table.
But there are cases in which the hostname is not sufficient.
In this case you can prepend or append a name to the hostname.

Example to use [appendName]: 
You test the same machine twice. Once which default RAM settings, once with improved RAM settings.
RAM modules have an internal timing table with faster modes named XMP(Intel) or D.O.C.P.(AMD).
This mode can be enabled in BIOS. Use CPUZ tab "SPD" to see the available timing table. 
Commandline (notice the seperated "-" to ignore the [prependName] ):
START_Windows_CPU.bat  -  FastRAM


Example to use [prependName]: 
You want to know if Linux is faster than Windows.
Some distros offer a "try mode" if you export the installer.iso onto a boot USB stick.
(Please see Ubuntu USB stick for more information)
This "try mode" does not set any hostname. 
If you use the benchmark on different machines, the table is overwritten again and again.
Therefore add the original name of the machine.
START_Windows_CPU.bat  MyAMDmachine   


Execute on renderfarm:
You can load the startup script START_Windows_CPU.bat into the rrSubmitter as well.
Change the renderer to "Once Each Client" and submit it.
IMPORTANT Note:
Cinebench does not run on Windows if the rrClient is running as background service.
(Cinebench is using some UI libs which the Nvidia driver does not offer for background tasks)



2) 
Hint: Windows only: 
DO NOT click in any terminal window.
If you do, the title of the cmd window changes to "Select" and the execution stops.

3) 
Wait until all tasks are executed.
The terminal states "---------------- DONE ------------"


4) 
Open the .csv file in subfolder /_results

Note about the .csv filename:
The test adds the fileserver IP to the name.
This is required in case you have multiple synced fileservers/fileserver heads with different IPs.


Note Excel import: 
If you are located in e.g. Germany then your system does not use the . (point) as decimal symbol.
You have to use Excel menu "Data"/"External Data"/"Import from text" to open the csv files.
Change the Settings Divider to Comma and change the number format decimal symbol to . (point) and the 1000er symbol to comma.

Note Google Drive import: 
If you are located in e.g. Germany then your system does not use the . (point) as decimal symbol.
In this case Google is not able to open the file properly.
You may change the settings somewhere in your google account (Sorry that I am not able to provide the right steps atm)




Result notes:

"CPU.." columns:
The "CPU.." columns are just a confirmation that there was no other process running that took the CPU.
And to see if all cores have been used (See note about Windows 10 + Intel Performance Cores above).
The first "CPU..." column is the maximum usage. It should be 100%.
The second "avCPU..." column is the average CPU usage. It includes starting the application and ranges from 50%-99% depending on the test, OS and harddrive.

Points and time:
Each renderer has a point-based value (e.g. ArnoldV). The higher the better/faster the machine.
Then there is a time value (e.g. ArnoldVTime) which is the render time that was returned by the render app.
If it is 0, then there was probably an issue/crash. In ths case please see the log file of that test.

CoresRRClient:
If it is set, then it was started by Royal Render.
It states if the number of cores the rrClient has used for the processes.
Windows only: Every half minute, the rrClient verifies that a new started process takes only this number of cores.


VM/VM_hardware:
If the machine is a VM, then VM should state which software was used.
In case you are runnning a VM and the VM is not detected, please let us know that we can fix it.
VM_hardware retrieves the VM type/size of Azure, AWS and GCC. 







Ubuntu USB stick:
There are multiple Distributions that offer a "try mode" within their boot .iso.
In this case I use Ubuntu 20.

To access the baBenchmark files within this try mode, you could mount your fileserver.
Or any share on some other machine (In case your fileserver is very restrictive regarding clients that are not in your AD/Domain)

Or you may want to use a second partition on the drive with this benchmark.
If you use a cross OS format like FAT, then you have to re-mount it with "write" and "executable" file rights.
Once Ubuntu is loaded, the USB drive should be listed in the desktop menu on the left.
 - Double-Click to access it.
 - Open a terminal.
 - See the drives hardware source and mount point with command:  
   df -h
 - Execute command: 
   umount /media/ubuntu/USB_Partition
   Replace the mount point "/media/ubuntu/USB_Partition" with the one listed in the last command.
 - Create a new mount point with:
   sudo mkdir /mnt/usb
 - mount the drive
   sudo mount -o gid=users,fmask=000,dmask=000 /dev/sda2 /mnt/usb
   Replace "/dev/sda2" with the hardware source that was shown by "df -h" 
 - Change the folder
   cd /mnt/usb/baBenchmark/
 - Execute Benchmark
   ./START_Linux_CPU.sh "ThatMachine"
   
   
   
   







