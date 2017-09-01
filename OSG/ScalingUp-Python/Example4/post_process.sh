#!/bin/bash
grep "Search Result" Log/job.out.*.* | sort -n -k3 -r
