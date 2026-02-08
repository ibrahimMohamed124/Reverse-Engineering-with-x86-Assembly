def generate_license():
    license_bytes = bytearray(19)

    # شروط التحقق
    license_bytes[0] = 2    # %2 == 0
    license_bytes[1] = 3    # %3 == 0
    license_bytes[2] = 5    # %5 == 0
    license_bytes[3] = 8    # %8 == 0

    # باقي البايتات
    for i in range(4, 19):
        license_bytes[i] = 0

    with open("key.license", "wb") as f:
        f.write(license_bytes)

    print("Valid license generated: key.license")

generate_license()
