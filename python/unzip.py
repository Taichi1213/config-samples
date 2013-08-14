#!/usr/bin/env python
# -*- coding: utf-8 -*-
# unzip.py

import os
import sys
import zipfile

if len(sys.argv) < 2:
    print u'Please specify a zip file.'
else:
    zipFileName = sys.argv[1]
    print 'Processing File ' + zipFileName

    zipFile = zipfile.ZipFile(zipFileName, 'r')
    listFile = open('unzip-' + zipFileName + '.txt', 'wb');
    zipInfos = zipFile.infolist()

    for zipInfo in zipInfos:
        filename = zipInfo.filename.decode('gbk')

        print 'Extracting ' + filename.encode('mbcs')
        zipInfo.filename = filename
        zipFile.extract(zipInfo)

        # write log
        listFile.write('%s\n' % filename.encode('utf8'))

    zipFile.close()
    listFile.close()
