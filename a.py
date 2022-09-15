import os
from random import randrange

## Number of days you want to make commits
for i in range(365*2,365*4 + 1):
    d = str(i) + ' day ago'
    ## Open a text file and modify it
    with open('bot.txt', 'a') as file:
        file.write(d)
    ## Add bot.txt to staging area
    for i in range(randrange(6)):
        os.system('git add bot.txt')
        ## Commit it
        os.system('git commit --date="' + d + '" -m "first commit"')

## push the commit to github
os.system('git push -u origin master')
