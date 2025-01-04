import argparse
'''
parser = argparse.ArgumentParser()
parser.add_argument('cel',type=float)
args = parser.parse_args()
print(args.cel*(9/10)+32)'''


'''
parser = argparse.ArgumentParser()
parser.add_argument('table',type=int)
args = parser.parse_args()

for i in range(1,11):
    print(f'{i} x {args.table} = {i*args.table}')'''


parser = argparse.ArgumentParser()
parser.add_argument('file',type=str,help='enter file')
count = 0
args = parser.parse_args()
with open(args.file,'r') as f:
    for i in f.read():
        count+=1
print(count)


'''
parser = argparse.ArgumentParser()
parser.add_argument('num',type=int)
parser.add_argument('operation',type=str,choices=['cel','fah'])

args = parser.parse_args()

if args.operation == 'cel':
    print(f'celcius to farenheit {args.num*(9/5)+32}')
elif args.operation == 'fah':
    print(f'farenheit  to celcius {(args.num-32)*(5/9)}')

print(args)'''



parser = argparse.ArgumentParser()
parser.add_argument('--numers',type=int)

args = parser.parse_args()
print(args.numbers)


