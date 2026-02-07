# 1. Target file paths
$filePath = "cr.exe"
$backupPath = "cr.exe.bak"

# Create backup if it does not exist
if (!(Test-Path $backupPath)) { Copy-Item $filePath $backupPath }

# 2. Read executable bytes
$bytes = [System.IO.File]::ReadAllBytes($filePath)

# 3. Direct patching based on the provided dump
# We will convert JNZ (75) into NOP NOP (90 90) to completely bypass the jump

# First pattern: 0B C0 75 31 (at 0040124B)
$pattern1 = @(0x0B, 0xC0, 0x75, 0x31)

# Second pattern: 0B C0 75 11 (at 0040125A)
$pattern2 = @(0x0B, 0xC0, 0x75, 0x11)

$patched = $false

for ($i = 0; $i -lt $bytes.Length - 4; $i++) {

    # Disable the first conditional jump
    if ($bytes[$i] -eq 0x0B -and $bytes[$i+1] -eq 0xC0 -and $bytes[$i+2] -eq 0x75 -and $bytes[$i+3] -eq 0x31) {
        $bytes[$i+2] = 0x90 # NOP
        $bytes[$i+3] = 0x90 # NOP
        Write-Host "[+] First check patched at 0x$($i.ToString('X'))" -ForegroundColor Green
        $patched = $true
    }

    # Disable the second conditional jump
    if ($bytes[$i] -eq 0x0B -and $bytes[$i+1] -eq 0xC0 -and $bytes[$i+2] -eq 0x75 -and $bytes[$i+3] -eq 0x11) {
        $bytes[$i+2] = 0x90 # NOP
        $bytes[$i+3] = 0x90 # NOP
        Write-Host "[+] Second check patched at 0x$($i.ToString('X'))" -ForegroundColor Green
        $patched = $true
    }
}

if ($patched) {
    [System.IO.File]::WriteAllBytes($filePath, $bytes)
    Write-Host "[*] All checks bypassed. Run the program now!" -ForegroundColor Cyan
} else {
    Write-Host "[-] Patterns not found. Make sure you are using the original file." -ForegroundColor Red
}
