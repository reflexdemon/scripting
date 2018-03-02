#! /bin/bash
# (@) start-android
# If the emulator command exists on this device, displays a list of emulators
# and prompts the user to start one

cd ~/Android/Sdk/tools

# Check if the emulator command exists first
if ! type emulator > /dev/null; then
  echo "emulator command not found"
  exit 1
fi

# Gather emulators that exist on this computer
DEVICES=( $(emulator -list-avds 2>&1 ) )

# Display list of emulators
echo "Available Emulators
----------------------------------------"
N=1
for DEVICE in ${DEVICES[@]}
do
  echo "$N) $DEVICE"
  let N=$N+1
done

# Request an emulator to start
read -p "
Choose an emulator: " num

# If the input is valid, launch our emulator on a separate PID and exit
if [ $num -lt $N ] && [ $num -gt 0 ];
then
  DEVICE=${DEVICES[$num-1]}
  emulator -avd "$DEVICE"  -netdelay none -netspeed full -no-snapshot-load > /dev/null 2>&1 &
  exit 0
else
  echo "Invalid Entry : $num"
  exit 1
fi