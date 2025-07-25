import os
import shutil


default_lib_name = "SquirrelAway"
default_addon_dir_name = "squirrel_away"


def create_symlink_for_squirrel_away_demo_project() -> None:
    source_path = os.path.abspath("demo/project.godot")
    link_path = os.path.abspath("addon/project.godot")
    if not os.path.exists(link_path):
        os.symlink(source_path, link_path, target_is_directory=False)


def move_bin_from_squirrel_away_to_surf_scaf() -> None:
    shutil.move("demo/addons/squirrel_away/bin", "demo/addons/surf_scaf/bin")
