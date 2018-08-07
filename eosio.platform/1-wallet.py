#!/usr/bin/python3
import sys
import os

CMD = ''
line = ''
waltname = ''
if len(sys.argv) == 1:
   CMD = 'cleos wallet create'
   waltname = 'default'
if len(sys.argv) == 2:
   CMD = 'cleos wallet create -n '+ sys.argv[1]
   waltname = sys.argv[1]
#print(CMD)

for s in os.popen(CMD).readlines():
   line = s
line1 = line[1:-2]
waltpin = waltname + ',' + line1 +'\n'
f = open('walt_pin','a')
f.writelines(waltpin)
f.close()


# import eosio keypair
os.system('cleos wallet import --private-key 5KXyqBjYphm3LUu89Sd2SztXRahjr7sF8tprXF1ZrfhqLzxSkGf')
