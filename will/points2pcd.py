import re

def split_array(line):
    splitted = re.split(r'[\s\s+,\[\]]', line)
    splitted = [float(splitted[2]), float(splitted[4]), float(splitted[6])]
    return splitted

with open("./points.txt") as file:
    with open("./pcd.pcd", 'w') as pcdfile:
        for line in file:
            if not line[0] == "-":
                if line[0] == "n":
                    splitted = split_array(line)
                    print("normal", splitted)
                    pcdfile.write(str(splitted[0]) + " ")
                    pcdfile.write(str(splitted[1]) + " ")
                    pcdfile.write(str(splitted[2]))
                    pcdfile.write("\n")

                else:
                    splitted = split_array(line)
                    print("position", splitted)
                    pcdfile.write(str(splitted[0]) + " ")
                    pcdfile.write(str(splitted[1]) + " ")
                    pcdfile.write(str(splitted[2]))
                    pcdfile.write(" ")