#!/bin/python3

import time  # per time.sleep
import subprocess
from send_email import send_email_starttls
from logdav import logger

mytimeout = 1
servicelist = ["QlikSenseEngineService", "QlikSenseProxyService", "QlikSensePrintingService", "QlikSenseSchedulerService",
               "QlikSenseServiceDispatcher", "QlikSenseRepositoryService", "QlikSenseRepositoryDatabase"]

print()
logger.info('')
logger.info('..' * 30)
logger.info('-~' * 30)
logger.info('-*-*-*-*-*-*-*-*-*-*- STARTING SCRIPT -*-*-*-*-*-*-*-*-*-*-')
logger.error('Stopping services...')
print('stopping services...')

for service in servicelist:
    mex = f"stopping {service}"
    logger.info(mex)
    print(mex)
    # if subprocess.call(["net", "stop", service]) > 0:
    #     mex = f"Error stopping {service}"
    #     logger.error(mex)
    #     print(mex)
    #     send_email_starttls(mex)

print()
mex = f"timeout {mytimeout}..."
print(mex)
logger.info(mex)
time.sleep(mytimeout)
print()
logger.info('Starting services...')

for service in reversed(servicelist):
    mex= f"starting {service}"
    print(mex)
    logger.info(mex)
    # if subprocess.call(["net", "start", service]) > 0:
    #     mex = f"Error starting {service}"
    #     logger.error(mex)
    #     print(mex)
    #     send_email_starttls(mex)
