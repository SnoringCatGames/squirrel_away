import os
import shutil


default_lib_name = "SquirrelAway"
default_addon_dir_name = "squirrel_away"


def create_symlink_for_squirrel_away_demo_project() -> None:
    source_path = os.path.abspath("demo/project.godot")
    link_path = os.path.abspath("addon/project.godot")
    if not os.path.exists(link_path):
        os.symlink(source_path, link_path, target_is_directory=False)


def create_symlink_for_surf_scaf_extension_manifest() -> None:
    source_path = os.path.abspath("submodules/surf_scaf/addon/bin")
    link_path = os.path.abspath("demo/addons/surf_scaf/bin")

    # Ensure the destination directory exists.
    link_dir = os.path.dirname(link_path)
    os.makedirs(link_dir, exist_ok=True)

    if os.path.exists(link_path):
        os.remove(link_path)
    os.symlink(source_path, link_path, target_is_directory=False)
