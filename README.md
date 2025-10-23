🚀 Project Name : ALICE
===============

### ALICE : Create and manage bash/zsh aliases with ease - Interactive alias maker for Linux/Mac

![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-pink.svg)
<a href="https://github.com/gigachad80 /alice/issues"><img src="https://img.shields.io/badge/contributions-welcome-purple.svg?style=flat"></a>

## Table of Contents

* [📌 Overview](#-overview)
* [✨ Features](#-features)
* [📚 Requirements & Dependencies](#-requirements--dependencies)
* [📥 Installation Guide](#-installation-guide)
* [🚀 Usage](#-usage)
  - [Basic Usage](#basic-usage)
* [📋 Command Line Options](#-command-line-options)
* [🎯 Filtering](#-filtering)
* [🔧 Technical Details](#-technical-details)
* [🤔 Why This Name?](#-why-this-name)
* [⏱️ Development Time](#️-development-time)
* [🙃 Why I Created This](#-why-i-created-this)
* [📞 Contact](#-contact)
* [📄 License](#-license)

### 📌 Overview

**ALICE** (Advanced Linux Command Installer & Executor) is an interactive shell script that makes creating and managing bash/zsh aliases effortless. No more memorizing complex commands or editing configuration files manually. Create permanent aliases with a single keystroke.

**Key Capabilities:**
* Interactive CLI for alias creation, removal, and management
* Automatic shell detection (bash, zsh, fish)
* Persistent storage with dedicated `.bash_aliases` file
* Smart duplicate prevention
* View and manage all aliases in one place
* Works across all terminal sessions
* Survives system reboots and shutdowns

### ✨ Features

### 🚀 Easy Alias Management
- **Create Aliases** - Interactive prompts guide you through alias creation
- **List All Aliases** - View all your saved aliases with line numbers
- **Remove Aliases** - Safely delete unwanted aliases with confirmation
- **View Details** - Inspect individual alias commands

### ⚡ Intelligent Storage
- **Centralized Management** - All aliases stored in clean `.bash_aliases` file
- **Smart Sourcing** - Automatically adds sourcing to `.bashrc` and `.zshrc`
- **Duplicate Prevention** - Prevents adding the same alias twice

### 🎯 User-Friendly Interface
- **Interactive Prompts** - Clear, easy-to-follow questions for each step

### 📚 Requirements & Dependencies

* **Bash 4.0+** or **Zsh 5.0+** - Modern shell required
* **Unix/Linux System** - macOS, Ubuntu, Debian, Fedora, CentOS, etc.
* **Basic Permissions** - Read/write access to home directory

### 📥 Installation Guide

### ⚡ Quick Install

**Method 1: Build from Source**
```bash
git clone https://github.com/gigachad80/alice
cd alice
chmod +x alice.sh
./alice.sh
```

**Method 2: Install Globally**
```bash
git clone https://github.com/gigachad80/alice
cd alice
chmod +x alice.sh
sudo cp alice.sh /usr/local/bin/alice
# Now run from anywhere: alice
```

### 🚀 Usage

### Basic Usage

```bash
# Run ALICE interactively
./alice.sh

# Or if installed globally
alice

# Create a new alias (from menu option 1)
# Follow the interactive prompts:
# 1. Enter alias name (e.g., 'cls')
# 2. Enter command (e.g., 'clear')
# 3. Confirm creation
# Done! Alias is active immediately

# View all your aliases (menu option 2)
# Shows all saved aliases with line numbers

# Remove an alias (menu option 3)
# Enter alias name and confirm removal

# View specific alias details (menu option 4)
# See the exact command for an alias
```

> [!TIP]
> #### ⚡ Pro Tips
> * **Aliases work immediately** - No need to reload shell
> * **Persistent forever** - Survive reboots and shutdowns
> * **Shared across terminals** - Work in all new terminal windows
> * **Easy backup** - Copy `~/.bash_aliases` to backup your aliases
> * **Portable** - Export and use aliases on other machines

> [!WARNING]
> #### ⚠️ Known Behavior
> * First-time use creates necessary files in home directory
> * Existing `.bash_aliases` file is preserved and updated
> * Aliases become active in new terminal windows (current session updates immediately)
> * Safe to run multiple times - prevents duplicate aliases

### 📋 Command Line Options

| Menu Option | Description | Use Case |
|------------|-------------|----------|
| **1** | Create New Alias | Define a shortcut for any command |
| **2** | List All Aliases | See all your saved aliases |
| **3** | Remove Alias | Delete unwanted alias |
| **4** | View Alias | Check what command an alias runs |
| **0** | Exit | Close ALICE |

### 🎯 Filtering

**Smart Alias Creation:**
- Validates alias names (alphanumeric, hyphens, underscores only)
- Prevents special characters that break shell
- Warns if alias already exists
- Shows preview before confirming

**Duplicate Prevention:**
- Automatically removes old alias if recreating
- Prevents accidental overwrites
- Safe replacement with confirmation

**Alias File Format** (`.bash_aliases`):
```bash
alias cls='clear'
alias gs='git status'
alias ll='ls -lah'
alias update='sudo apt update && sudo apt upgrade'
```

### 🔧 Technical Details

### Architecture
- **Shell Agnostic** - Works with bash, zsh, and other POSIX shells
- **Centralized Storage** - All aliases in single `.bash_aliases` file
- **Auto-Sourcing** - Automatically adds sourcing to shell configs
- **Session Aware** - Loads aliases immediately in current session
- **Safe File Operations** - Prevents corruption and data loss

### Why `.bash_aliases` Instead of Direct `.bashrc`/`.zshrc`?

| Aspect | Direct `.bashrc`/`.zshrc` | Dedicated `.bash_aliases` |
|--------|---------------------------|---------------------------|
| **Organization** | Mixed config + aliases | Clean separation of concerns |
| **File Purpose** | Shell config & functions | Aliases only ✅ |
| **Duplicate Risk** | ⚠️ High (easy to append twice) | 🛡️ Low (centralized control) |
| **Maintainability** | 😕 Hard (find aliases in clutter) | ✨ Easy (all in one place) |
| **Portability** | ❌ Risky (system updates may reset) | ✅ Safe (separate file survives updates) |
| **Backup** | 🔀 Must backup entire config | 📦 Simple (just copy `.bash_aliases`) |
| **Multi-Shell** | ⚠️ Need separate entries in each | ✅ One file, sourced by all |
| **Standard Practice** | ❌ Non-standard | ✅ GNU/Linux recommended approach |
| **Zsh Compatibility** | ⚠️ May need adjustments | ✅ Works perfectly |
| **System Reinstall** | ❌ Aliases lost with config reset | ✅ Aliases preserved (separate file) |

**Decision Rationale:**
- `.bashrc` and `.zshrc` should contain shell configuration, not aliases
- Dedicated `.bash_aliases` is the **Unix/Linux best practice**
- ALICE automatically sources it from both shells = universal compatibility
- Prevents accidental conflicts and data loss
- Makes aliases easy to backup, restore, and migrate

### File Management
- **Primary Storage** - `~/.bash_aliases` (dedicated aliases file)
- **Shell Config** - `~/.bashrc` and `~/.zshrc` (sourcing only)
- **Backup Friendly** - Easy to backup and restore
- **Portable** - Can copy between systems

### Performance Characteristics
- **Instant Activation** - Aliases work immediately
- **Memory Efficient** - Minimal resource usage
- **Fast Lookup** - Direct file access, no database
- **Scalable** - Handles 100+ aliases without slowdown

### 🤔 Why This Name?

**ALICE** = **Advanced Linux Command Installer & Executor**

Perfect acronym for an interactive alias creation tool. Easy to remember, rolls off the tongue, and matches the professional nature of the tool.

### ⏱️ Development Time

Total time spent in development, testing , writing & editing README **47 min 11 sec**.

### 🙃 Why I Created This


I’m an average CLI chad who’s been using Windows for the past 5–6 months and Linux only occasionally. After spending years on Linux , I got so used to its CLI habits that when I switched to Windows & I mostly worked in PS and cz of that, I got into the habit of using the cls command instead of clear to wipe the screen. But now that I’m back on Linux, it’s become a struggle and keep typing cls out of habit and have to remind myself to use clear instead

So I thought: why not create an alias? Simple enough. But then I realized - why manually edit `.bashrc` every time? Why not just write a script where you type the alias name, the command it represents, and boom - done. One keystroke. That's how ALICE was born.

What started as a quick solution to my own problem evolved into a full-featured alias management tool . If I can save others from the same frustration, mission accomplished. 🎯


### 📞 Contact

📧 Email: **pookielinuxuser@tutamail.com**

---

### 📄 License

Licensed under the **MIT License**.  
Check here: [`LICENSE`](https://github.com/gigachad80/alice/blob/main/LICENSE)

First Published : October 22nd, 2025

Last Updated : October 23rd, 2025

---

**Made with ❤️ in Bash** - Simple, powerful, and elegantly designed alias management for Linux lovers.
