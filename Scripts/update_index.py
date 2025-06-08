import os
from shutil import copyfile

LOCAL_DIR = "/sdcard/TempleofTruth"
GIT_DIR = "/data/data/com.termux/files/home/Akasha"

def get_sermons(sermon_dir):
    files = os.listdir(sermon_dir)
    return sorted([f for f in files if f.endswith(".html")], reverse=True)

def write_index(sermons, target_file, base_path="sermons"):
    with open(target_file, "w") as f:
        f.write("<html><head><title>The JimmyWay</title></head><body>\n")
        f.write("<h1>Welcome Pilgrim</h1>\n")
        f.write("<p>These are the Entire Sermons. Take what you need.</p>\n")
        f.write("<ul>\n")
        for sermon in sermons:
            title = sermon.replace("-", " ").replace(".html", "").title()
            f.write(f'<li><a href="{base_path}/{sermon}">{title}</a></li>\n')
        f.write("</ul>\n")
        f.write('<p><a href="https://www.buymeacoffee.com/yourname">☕ Buy Developer a Cup of Coffee</a></p>\n')
        f.write("</body></html>")

if __name__ == "__main__":
    sermons = get_sermons(os.path.join(LOCAL_DIR, "sermons"))

    # Write to local Temple
    write_index(sermons, os.path.join(LOCAL_DIR, "index.html"))

    # Copy sermons to git repo
    os.makedirs(os.path.join(GIT_DIR, "sermons"), exist_ok=True)
    for s in sermons:
        src = os.path.join(LOCAL_DIR, "sermons", s)
        dst = os.path.join(GIT_DIR, "sermons", s)
        copyfile(src, dst)

    # Write to Git repo index.html
    write_index(sermons, os.path.join(GIT_DIR, "index.html"))
