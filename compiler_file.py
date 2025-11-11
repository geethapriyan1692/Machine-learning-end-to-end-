import os
import compileall
import shutil
import re
import sys
root = r'/AIML/'

# path = os.path.join(root)

#root = r'F:\AI-Code\Code_Checkout_06_01\centuryml'
# To compile all the .py files in the directory
compileall.compile_dir(root, force=True)

path = os.path.join(root)

for path, subdirs, files in os.walk(root):
    for name in files:
        if name != 'manage.py':
            process=os.path.join(path, name)
            data=os.path.join(path)
            if data.endswith('__pycache__'):
                pycache_storage=data
            if process.endswith('.pyc'):
                newName = process.split(".")[0] +'.' + process.split(".")[-1]
                os.rename(pycache_storage +'//'+ name,  newName)

for path, subdirs, files in os.walk(root):
    for i in subdirs:
        if i.endswith('__pycache__'):
            source = path + '//' + i
            allfiles = os.listdir(source)
            for f in allfiles:
                if f != 'manage.pyc' and 'settings.pyc' not in f:
                    shutil.move(source +'//'+ f, path + '//'+f)
        else:
            source = path + '//' + i
            allfiles = os.listdir(source)
            for f in allfiles:
                if f.endswith('.py') and f != 'manage.py' and 'settings.py' not in f:
                    os.remove(source +'//'+ f)