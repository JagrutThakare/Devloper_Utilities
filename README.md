-----

# Developer Utilities 🛠️

A collection of simple, yet powerful, scripts to automate common developer tasks and streamline your workflow.

This repository, `Devloper_Utilities`, provides a curated set of command-line utilities designed to handle everyday developer needs. Whether it's keeping your environment up-to-date, cleaning up system clutter, or automating repetitive tasks, these scripts aim to make your life easier.

-----

## 🎯 Objectives

The primary goal of this project is to offer a centralized place for small, efficient, and easy-to-use scripts that:

  * **Save time** by automating manual processes.
  * **Improve productivity** by simplifying complex commands.
  * **Maintain a clean and organized** development environment.
  * Are **easy to understand and modify** to fit individual needs.

-----

## 🚀 Available Utilities

Here are the tools currently available in this repository:

### 🧹 System Cleanup (Linux)

  * **File:** `system_cleanup_Linux.sh`
  * **Description:** This comprehensive script performs a deep clean of your Linux system. It removes cached files, old logs, and unused packages from various sources to free up disk space and help maintain system performance.
  * **Key Features:**
      * Cleans APT, Snap, and Flatpak packages.
      * Empties the trash and thumbnail cache.
      * Vacuums old `journalctl` logs.
      * Clears caches for Pip, Conda, Docker, Firefox, and Chrome/Chromium.
      * Deletes rotated log files and temporary directories.

### ⬆️ Auto-Update VS Code (Linux)

  * **File:** `auto_update_VSCODE_Linux.sh`
  * **Description:** A straightforward script to download and install the latest stable version of Visual Studio Code on Debian-based Linux distributions (like Ubuntu). It fetches the most recent `.deb` package and uses `dpkg` to install it, ensuring you're always on the latest version with a single command.

-----

## Usage

To use any of the utilities, first clone this repository:

```bash
git clone https://github.com/JagrutThakare/Devloper_Utilities.git
cd Devloper_Utilities
```

Next, make the desired script executable. For example, to run the system cleanup utility:

```bash
chmod +x system_cleanup_Linux.sh
sudo ./system_cleanup_Linux.sh
```

**Note:** Most scripts require `sudo` privileges to perform system-level operations.

-----

## 🤝 Contributing

Contributions are welcome\! If you have a useful script that you think would benefit other developers, please feel free to open a pull request.

When contributing, please ensure that your scripts are:

  * Well-commented and easy to understand.
  * Focused on a specific, common developer task.
  * Tested to ensure they work as expected.

-----

## 📜 License

This project is licensed under the MIT License. See the `LICENSE` file for more details.
