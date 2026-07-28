#!/bin/sh
logger -t sway-lifecycle "session locked"
swaylock -c 000000ff
logger -t sway-lifecycle "session unlocked"
