def bin_to_hex(file_path, output_file):
    with open(file_path, 'rb') as f, open(output_file, 'w') as nowfp:
        i = 0
        hex_string = f.read().hex()

        # Split the string into chunks of 2 characters (1 byte)
        for byte_index in range(0, len(hex_string), 2):
            nowfp.write('0x{}{}, '.format(hex_string[byte_index], hex_string[byte_index+1]))
            i += 1
            if i >= 10:
                # Insert a newline after every 10 pairs
                nowfp.write('\n')
                i = 0

# Use the function
bin_to_hex('x.bin', 'y.txt')
