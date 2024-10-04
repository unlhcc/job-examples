#!/usr/bin/env python

import tensorflow as tf
import time

hello = tf.constant('Hello, TensorFlow!')
a = tf.constant(10)
b = tf.constant(32)
print(a + b)

gpu_devices = tf.config.list_physical_devices('GPU')
details = tf.config.experimental.get_device_details(gpu_devices[0])
print("GPU details:")
print(details)

# This delays the termination of the script by 15 seconds to demonstrate GPU performance tracking using `nvidia-smi`, as the tracking script assumes the job will run for more than 10 seconds. For general TensorFlow use, this delay is not necessary.
time.sleep(15)