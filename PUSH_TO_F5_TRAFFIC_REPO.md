# Push this project to F5-Traffic-Simulator repo

This folder lives inside **Python-Automation-and-Analysis-Toolkit**, so it was never pushed to the **F5-Traffic-Simulator** repo on GitHub. Use one of the options below to upload it.

---

## Option 1: Use the push script (easiest)

From this directory (`f5-traffic-simulator`):

```bash
./push_to_f5_traffic_repo.sh
```

This pushes to `https://github.com/angelatierney/F5-Traffic-Simulator.git` by default.

---

## Option 2: Manual steps

```bash
cd /Users/angelatierney/Documents/Python-Automation-and-Analysis-Toolkit/f5-traffic-simulator

cp -r . ../F5-Traffic-Simulator-push
cd ../F5-Traffic-Simulator-push

git init
git add .
git commit -m "Initial commit: F5 Traffic Simulator"
git branch -M main
git remote add origin https://github.com/angelatierney/F5-Traffic-Simulator.git
git push -u origin main
```

---

## Why nothing was uploaded before

- **f5-traffic-simulator** is a subfolder of the **Python-Automation-and-Analysis-Toolkit** repo.
- Pushes go to the parent repo only, so the **F5-Traffic-Simulator** repo on GitHub stayed empty until you push this folder to it.
