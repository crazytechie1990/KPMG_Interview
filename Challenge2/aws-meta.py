import os
import json
import argparse
import sys
import subprocess


####################
# Argument parsing #
####################
parser = argparse.ArgumentParser(description='Print AWS Instance MetaData')
group = parser.add_mutually_exclusive_group(required=True)
group.add_argument('--jout', action='store_true', help="Print the whole metadata as json output")
group.add_argument('--key', type=str, help="Enter the key to retrieve from the aws metadata")
args = parser.parse_args()


if sys.argv[1] == '--jout':
    sub_exec = subprocess.Popen(['curl','http://169.254.169.254/latest/meta-data/'], shell=False, stdout=subprocess.PIPE, stderr=subprocess.PIPE,universal_newlines=True)
    return_code = sub_exec.wait()
    output, error = sub_exec.communicate()


for i in output.splitlines():
    print(os.system('curl','http://169.254.169.254/latest/meta-data/' + i))
    
    


# def main():
#     if sys.argv[1] == '--jout':
#         for i in list(os.system('curl http://169.254.169.254/latest/meta-data/')):
#             META_LIST.append(i)
#         print(META_LIST)

        
#     # elif sys.argv[1] == '--key':
#     #     print(os.system('curl http://169.254.169.254/latest/meta-data/'))

# if __name__ == '__main__':
#     main()