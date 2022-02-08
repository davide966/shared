#!/usr/bin/python3
import sys
import logging


logname = f"{format(sys.path[0])}/dav.log"


def initialize_logger():
    logging.basicConfig(filename=logname,
                        filemode='a',
                        # format='%(asctime)s,%(msecs)d %(name)s %(levelname)s %(message)s',
                        format='%(asctime)s %(levelname)s %(message)s',
                        datefmt='%Y-%m-%d %H:%M:%S',
                        level=logging.DEBUG)
    logger = logging.getLogger()
    return logger


def clear_log():
    with open(logname, 'w'):
        pass


logger = initialize_logger()
