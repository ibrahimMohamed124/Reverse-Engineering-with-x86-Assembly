function Generate-License {

    # Create a byte array with length 19
    [byte[]]$licenseBytes = New-Object byte[] 19

    # Validation conditions (first 4 bytes)
    $licenseBytes[0] = 2   # Must be divisible by 2
    $licenseBytes[1] = 3   # Must be divisible by 3
    $licenseBytes[2] = 5   # Must be divisible by 5
    $licenseBytes[3] = 8   # Must be divisible by 8

    # Remaining bytes are not checked by the program
    # Set them to zero
    for ($i = 4; $i -lt 19; $i++) {
        $licenseBytes[$i] = 0
    }

    # Write the license file as raw binary
    [System.IO.File]::WriteAllBytes("key.license", $licenseBytes)

    Write-Host "Valid license generated: key.license"
}

# Generate the license file
Generate-License
