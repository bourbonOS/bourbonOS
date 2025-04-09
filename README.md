<p align="center">
  <img src="https://github.com/user-attachments/assets/5fc1dbf1-b8c1-4096-a708-dca0bfb16996"/>
</p>

No, we are not the alcohol. We are literally the best type of cherry in existence. Fight me.

# About
**bourbonOS** is a custom image focused on containerization, in a way similar to that of vanillaOS.

Our framework teaches you to use things like [containers](https://www.geeksforgeeks.org/linux-container) and [nix.](https://wikipedia.org/wiki/Nix_(package_manager)) We also rely on apps from [Flathub](https://flathub.org) as a replacement to system packages, since they are more secure.

We also include a bunch of tools to make this possible and more streamlined.

Those tools being:

- `cherry`: a command-line tool uses for managing containers (AKA "branches"), the baseOS (AKA the "stem"), and filesystem protection (AKA "pesticide"). Uses [distrobox](https://github.com/89luca89/distrobox) under the hood.
- `containershell`: the shell of all users, it's purpose is to start a lightweight, blinged-out container for the user to use as their shell
- `pesticide`: our version of vanillaOS's FsGuard, it's purpose is to verify directories containing important executables, incase of corruption. In rare cases, corrupt executables can cause damage.
- `synergy`: a command-line tool acting as a wrapper for Nix, meant as a better replacement for installing packages on the base system and Homebrew, and with simpler syntax. More info on nix [here.](https://nixos.org/guides/how-nix-works/)
- `homefs`: a tool that saves all of /home to an image that you can retreive a copy of and serves as an easy, built-in backup service.

We offer two types of images, and three channels.

**Images:**
- GNOME: Images coming with the GNOME Desktop Environment. Simple, efficient, and modern.
- BASE: Base images with no desktop environment. Bare, reserved for the tinkerers.

**Channels:**
- LTS: Uses a baseOS of CentOS Stream 10 for stability, as it has a release cycle of ~5 years.
- Stable: Uses a baseOS of Fedora 41 for some stability, as it has a bi-annual release cycle.
- DEVEL: Development branch of bourbonOS. This is where major changes are tested. Has two sub-branches, LTS and Stable.

# How will updates work?
Updates run in the background, so you don't have to worry about manually updating, and you won't notice. Nice, right?

We also won't bug you to update, or force you to... unlike certain operating systems. Ahem.

Images are built daily to make sure we are up-to-date (doesn't mean you'll update every day), and major changes are tested in the development repository before reaching this repository.

# How do I switch?
Open your terminal and run the following, respectively:
- **bourbonOS GNOME**: `rpm-ostree rebase ostree-unverified-registry:ghcr.io/bourbonOS/stem-bourbon`
- **bourbonOS BASE**: `rpm-ostree rebase ostree-unverified-registry:ghcr.io/bourbonOS/stem-lambert`
If you want the **Stable** channel, append `-stable` to the command.

If you want the **LTS** (long-term support) channel, append `-lts` to the command.

If you want the **DEVEL** (development) channel, choose one of the previous channels and append `-devel`. (ex. the suffix for LTS + devel is `-lts-devel`)

If you can't decide, we provide a command to switch channels, the command being `cherry baseos channel-switch`. :> 

# Contributing
We'd **love** it if you want to aid in our development, and we'd appreciate it!

Head over to [our development repository](https://github.com/bourbonOS/bourbonOS-devel) to get started.
