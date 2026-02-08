import os
import shutil

# 1. Target file paths
file_path = "keylicense.exe" 
backup_path = "cre.exe.bak"

# Create backup if it does not exist
if not os.path.exists(backup_path):
    shutil.copyfile(file_path, backup_path)

# 2. Read executable bytes
with open(file_path, "rb") as f:
    data = bytearray(f.read())

# 3. Direct patching based on the provided dump
# Convert JNZ (75) into NOP NOP (90 90) to bypass the jump

# First pattern: 0B C0 75 31
pattern1 = [0x0B, 0xC0, 0x75, 0x31]

# Second pattern: 0B C0 75 11
pattern2 = [0x0B, 0xC0, 0x75, 0x11]

patched = False

for i in range(len(data) - 4):

    # Disable the first conditional jump
    if data[i:i+4] == bytearray(pattern1):
        data[i+2] = 0x90  # NOP
        data[i+3] = 0x90  # NOP
        print(f"[+] First check patched at 0x{i:X}")
        patched = True

    # Disable the second conditional jump
    if data[i:i+4] == bytearray(pattern2):
        data[i+2] = 0x90  # NOP
        data[i+3] = 0x90  # NOP
        print(f"[+] Second check patched at 0x{i:X}")
        patched = True

if patched:
    with open(file_path, "wb") as f:
        f.write(data)
    print("[*] All checks bypassed. Run the program now!")
else:
    print("[-] Patterns not found. Make sure you are using the original file.")
