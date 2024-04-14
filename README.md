<p align=center>
<br>
<a href="http://makeapullrequest.com"><img src="https://img.shields.io/badge/PRs-welcome-darkorange.svg"></a>
<img src="https://img.shields.io/badge/os-linux-darkorange">
<img src="https://img.shields.io/badge/os-windows-darkorange">
<br>
</p>

<h1 align="center">ani-skip<h1>

<p align="center">
<img src="https://media.tenor.com/CHVEROnz6hMAAAAC/asta-black-clover.gif">
</p>

<h3 align="center">
A script to automatically skip anime opening and ending sequences, making it easier to watch your favorite shows without having to manually skip the intros and outros each time.
</h3>

**Important:** There's a chance `ani-skip` may not recognize the anime you're watching. It leverages the [aniskip API](https://api.aniskip.com/api-docs). If an anime's episode(s) are missing, you can contribute or request its inclusion on their [discord server](https://discord.com/invite/UqT55CbrbE).

## Troubleshooting Errors

Should you run into problems, first ensure you're using the most recent version:

- For Linux:
  ```bash
  sudo ani-skip -U
  ```

- For Windows:
  Open Git Bash as an administrator and enter:
  ```bash
  ani-skip -U
  ```

If the issue remains unresolved, please create a new issue.

---

## Usage

- Press **`i`** in MPV to toggle the skipping of the OP/ED
> To configure this key, open `mpv/input.conf` and add the line `b script-binding skip_enable`,replace `b` with key of your choosing.\
 Note: Typing `B` in the config requires pressing **`shift`** + **`b`** in MPV. \
(`i` will still work, unless remaped in the input config.)
##

```sh
ani-skip -h
```
```
    Usage:
    ani-skip [OPTIONS]

    Options:
      -q, --query
        Anime Title or MyAnimeList ID
      -e, --episode
        Specify the episode number
      -V, --version
        Show the version of the script
      -h, --help
        Show this help message and exit
      -U, --update
        Update the script
    Some example usages:
      ani-skip -q "Solo Leveling" # Returns MyAnimeList ID
      ani-skip -q "Solo Leveling" -e 3 # Returns MPV skip flag
      ani-skip -q 52299 -e 5 # Returns MPV skip flag
```

- Build MPV skip options directly using anime's title
  ```sh
  ani-skip --query "Black Clover (170 episodes)" --episode 10
  ```
  ```
  --chapters-file=/tmp/tempfile --script-opts=skip-op_start=140.153,skip-op_end=230.153,skip-ed_start=1301.824,skip-ed_end=1431
  ```
  > `script-opts` with the `script` flag is produced by ani-skip when metadata for a specific anime's skip times exists in the database. It's important to append these flags at the end due to certain mpv nuances.

- Fetch `MyAnimeList` ID
  ```sh
  ani-skip -q "Solo Leveling"
  ```
  ```
  52299
  ```
  > Persisting it will help building flags quickly when requesting the same anime for skip times.

- Build MPV skip options directly using `MyAnimeList` ID
  ```sh
  ani-skip -q 52299 -e 2
  ```
  ```
  --chapters-file=/tmp/tempfile --script-opts=skip-op_start=130.531,skip-op_end=220.531,skip-ed_start=1326.58,skip-ed_end=1416.58
  ```
  > Use the stored or persisted MAL ID to expedite the process of fetching skip times.


## Install

- Linux
  ```sh
  git clone https://github.com/synacktraa/ani-skip.git
  sudo apt install mpv fzf  
  sudo cp ani-skip/ani-skip /usr/local/bin
  mkdir -p ~/.config/mpv/scripts && cp ani-skip/skip.lua ~/.config/mpv/scripts
  ```
  
- Windows
  > Make sure [scoop](https://scoop.sh/) is installed.
  - Open powershell and run:
    ```powershell
    scoop install mpv fzf git
    ```
  - Open git bash
    ```sh
    git clone https://github.com/synacktraa/ani-skip.git
    cp ani-skip/ani-skip /usr/bin
    mkdir -p ~/scoop/apps/mpv/current/portable_config/scripts
    cp ani-skip/skip.lua ~/scoop/apps/mpv/current/portable_config/scripts
    ```

## Dependencies
- grep
- sed
- curl
- fzf
- mpv - Video Player

## Checklist

- [x] MPV support
- [x] MyAnimeList Id scraper
- [ ] VLC support
- [ ] Create packages for Windows, Linux and Termux
- [ ] Test it on Android termux and Mac
