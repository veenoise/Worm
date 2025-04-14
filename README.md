# Worm Simulation

This is my demonstration for how the worm operates. This attack consists of 2 parts: infection and spreading. For the first part, I'll write the code that echoes `This computer is hacked: port [port number]` and the result will be appended to the C&C server. For the second part, it will scan for other computers and repeat the attack. For simplicity, I will open various ports in my kali linux virtual machine that would represent the computers in a network. 

## Instructions

Use `nc_listener_script.sh` to run netcat listener infinitely. Give execute permission first.

```bash
chmod u+x ./nc_listener_script.sh
```

Then run the command with the port number as argument. For this demonstration, please stick to the port range 4444-4450.

```bash
./nc_listener_script.sh 4444
```

I would do this for ports 4444, 4445, 4446, and 4447.

Give execute permission for `worm.sh`

```bash
chmod u+x ./worm.sh
```

Run `worm.sh` starting it with port 4444 as parameter for patient zero. 

```bash
./worm.sh 4444
```

Take note, the -c flag inside the script is for arbitrary commands, in this case I just used echo, but I can set up reverse shell with `/bin/bash`.

To verify, check all netcat connections and check the logs in `/tmp/worm_log/command_and_control_logs.log`.

To kill all opened ports, use the `kill_all_nc_listener.sh`. Set execute permissions for the script first

```bash
chmod u+x ./kill_all_nc_listener.sh
```

and run the script.

```bash
./kill_all_nc_listener.sh
```

## Video Demonstration

https://github.com/user-attachments/assets/a19459b5-74e5-43b2-a2a3-89bb1b20ea59

