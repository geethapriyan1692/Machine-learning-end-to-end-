import os, shutil, glob

def collect_static(source_dirs, target_dir="collected_static"):
    os.makedirs(target_dir, exist_ok=True)
    for src in source_dirs:
        for file in glob.glob(f"{src}/**/*", recursive=True):
            if os.path.isfile(file):
                rel_path = os.path.relpath(file, src)
                dest = os.path.join(target_dir, rel_path)
                os.makedirs(os.path.dirname(dest), exist_ok=True)
                shutil.copy(file, dest)

if __name__ == "__main__":
    collect_static(["galaxyml/mlstatic"])