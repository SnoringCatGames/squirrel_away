#!/usr/bin/env python
import os
import sys

from snore_core.build_utils import \
    post_setup as post_setup_snore_core, \
    pre_setup as pre_setup_snore_core, \
    set_up as set_up_snore_core
from scaffolder.build_utils import set_up as set_up_scaffolder
from surfacer.build_utils import set_up as set_up_surfacer


lib_name = "SquirrelAway"
addon_dir_name = "squirrel_away"

env = pre_setup_snore_core(ARGUMENTS, Environment, Variables, Help, SConscript)

cpp_paths = []
sources = []

set_up_snore_core(env, cpp_paths, sources, addon_dir_name, is_setup_for_self=False)
set_up_scaffolder(env, cpp_paths, sources, addon_dir_name, is_setup_for_self=False)
set_up_surfacer(env, cpp_paths, sources, addon_dir_name, is_setup_for_self=False)

post_setup_snore_core(env, cpp_paths, sources, lib_name, addon_dir_name, Default)

# Make the SnoreCore GDExtension and GDScript addon files accessible from the SquirrelAway demo.
os.symlink("snore_core/demo/addons/snore_core", "demo/addons/snore_core", target_is_directory=True)
os.symlink("scaffolder/demo/addons/scaffolder", "demo/addons/scaffolder", target_is_directory=True)
os.symlink("surfacer/demo/addons/surfacer", "demo/addons/surfacer", target_is_directory=True)
