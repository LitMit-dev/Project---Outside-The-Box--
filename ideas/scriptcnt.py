#This funtion will return the data in the file 'orders.txt', as an array of records
def readFile():
    records = []
    
    with open("storyboardcase2.txt", 'r') as conn:
        lines = conn.readlines()

        for line in lines:
            line = line[0:-1]
            records.append(line)
    
    return records

def countWord(inpWord, inpArr):
    count = 0
    for i in range(len(inpArr)):
        if inpWord in inpArr[i]:
            count += 1
    return count


commands = readFile()
inWord = input()

wNum = countWord(inWord, commands)
print(inWord, wNum)