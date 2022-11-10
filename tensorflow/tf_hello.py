#!/usr/bin/env python

import tensorflow as tf

hello = tf.constant('Hello, TensorFlow!')
a = tf.constant(10)
b = tf.constant(32)
print(a + b)

gpu_devices = tf.config.list_physical_devices('GPU')
details = tf.config.experimental.get_device_details(gpu_devices[0])
print("GPU details:")
print(details)
