#!/usr/bin/env python
import os
import sys

from snore_core.build_utils import \
    post_setup as post_setup_snore_core, \
    pre_setup as pre_setup_snore_core, \
    set_up as set_up_snore_core
from scaffolder.build_utils import set_up as set_up_scaffolder
from surfacer.build_utils import set_up as set_up_surfacer


squirrel_away_lib_name = "SquirrelAway"
snore_core_addon_dir_name = "snore_core"
scaffolder_addon_dir_name = "scaffolder"
surfacer_addon_dir_name = "surfacer"
squirrel_away_addon_dir_name = "squirrel_away"

env = pre_setup_snore_core(ARGUMENTS, Environment, Variables, Help, SConscript)

cpp_paths = []
sources = []

set_up_snore_core(env, cpp_paths, sources, snore_core_addon_dir_name, is_setup_for_self=False)
set_up_scaffolder(env, cpp_paths, sources, scaffolder_addon_dir_name, is_setup_for_self=False)
set_up_surfacer(env, cpp_paths, sources, surfacer_addon_dir_name, is_setup_for_self=False)

post_setup_snore_core(env, cpp_paths, sources, squirrel_away_lib_name, squirrel_away_addon_dir_name, Default)

# Make the SnoreCore, Scaffolder, and Surfacer GDExtension and GDScript addon files accessible from the SquirrelAway demo.
snore_core_original_path = os.path.abspath("snore_core/demo/addons/snore_core")
snore_core_link_path = os.path.abspath("demo/addons/snore_core")
if not os.path.lexists(snore_core_link_path):
    os.symlink(snore_core_original_path, snore_core_link_path, target_is_directory=True)
scaffolder_original_path = os.path.abspath("scaffolder/demo/addons/scaffolder")
scaffolder_link_path = os.path.abspath("demo/addons/scaffolder")
if not os.path.lexists(scaffolder_link_path):
    os.symlink(scaffolder_original_path, scaffolder_link_path, target_is_directory=True)
surfacer_original_path = os.path.abspath("surfacer/demo/addons/surfacer")
surfacer_link_path = os.path.abspath("demo/addons/surfacer")
if not os.path.lexists(surfacer_link_path):
    os.symlink(surfacer_original_path, surfacer_link_path, target_is_directory=True)
