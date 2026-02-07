# Reverse-Engineering-with-x86-Assembly

A hands-on repository focused on **Reverse Engineering**, **x86 Assembly**, and **crackme analysis**. This project documents practical experiments, tools, scripts, and notes collected while learning how real Windows binaries work at a low level.

The repo is built around understanding **how programs actually execute**, not just how to use tools.

---

## 🎯 Goals

* Understand **x86 / x86-64 assembly** in real-world binaries
* Learn how compilers translate C/C++ into assembly
* Practice **static & dynamic analysis** on Windows executables
* Analyze **crackmes**, license checks, and protection logic
* Write small **patchers and keygens** for educational purposes
* Get comfortable with tools used by malware analysts and reversers

---

## 🛠 Tools Used

* **x32dbg / x64dbg** – Debugging Windows executables
* **Ghidra** – Decompilation and static analysis
* **Hex editors** – Raw byte-level inspection
* **PowerShell** – Binary patching scripts
* **Python** – Patchers, helpers, and automation
* **Windows API** – Understanding low-level OS interaction

---

## 🧪 Example Work

* Reverse engineered a Windows crackme using **Ghidra + x32dbg**
* Identified username and license validation logic
* Analyzed file-based key verification (`key.license`)
* Patched conditional jumps (`JNZ → NOP NOP`)
* Automated binary patching using **PowerShell and Python**

---

## ⚠️ Legal & Ethical Notice

This repository is for **educational purposes only**.

* All binaries analyzed are **crackmes or self-made test programs**
* No commercial software is targeted
* Do NOT use these techniques on software you do not own or have permission to analyze

Reverse Engineering is a **legitimate skill** when used responsibly.

---

## 📚 Recommended Knowledge

Helpful (but not required):

* C / C++ basics
* Operating Systems fundamentals
* Assembly basics
* Curiosity and patience 😄

---

## 🚀 Who This Repo Is For

* Students learning low-level programming
* Malware analysis beginners
* Security & reverse engineering enthusiasts
* Anyone curious about **how software really works under the hood**

---

## ✍️ Author

**Ibrahim Mohamed**
Software Engineering Student
Interested in Reverse Engineering, Low-Level Systems, and Security

---

If you find this repo useful ⭐ star it and feel free to fork or contribute.
