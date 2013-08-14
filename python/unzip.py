#!/usr/bin/env python
# -*- coding: utf-8 -*-
# unzip.py

import os
import sys
import zipfile

if len(sys.argv) < 2:
    print u'Please specify a zip file.'
else:
    print 'Processing File ' + sys.argv[1]

    zipFile = zipfile.ZipFile(sys.argv[1], 'r')
    listFile = open('unzip-list.txt', 'wb');
    names = zipFile.namelist()

    for name in names:
        decodedName = name.decode('gbk')

        print 'Extracting ' + decodedName.encode('mbcs')

        # create directory
        pathname = os.path.dirname(decodedName)

        if not os.path.exists(pathname) and pathname != '':
            os.makedirs(pathname)

        # create file
        data = zipFile.read(name)

        if not os.path.exists(decodedName):
            fo = open(decodedName, 'w')
            fo.write(data)
            fo.close

        # write log
        listFile.write('%s\n' % decodedName.encode('utf8'))

    zipFile.close()
    listFile.close()