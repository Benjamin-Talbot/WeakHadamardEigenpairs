#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Jun 30 23:05:30 2024

@author: luismbvarona
"""

# %%
import numpy as np
from scipy.io import savemat

# %%
for i in range(135):
    arrayName = 'L11sIntegral_chunk' + str(i+1)
    exec(arrayName + " = np.load('../chunks/" + arrayName + ".npy')")

L11sIntegral = np.concatenate(
    [eval('L11sIntegral_chunk' + str(i+1)) for i in range(135)], axis = 2)
savemat('L11sIntegral.mat', {'L11sIntegral': L11sIntegral})