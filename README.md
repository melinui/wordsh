# wordsh
Wordle with a twist. A command-line wordle game using bash scripts lol

```
 __      __                .___     .__     
/  \    /  \___________  __| _/_____|  |__  
\   \/\/   /  _ \_  __ \/ __ |/  ___/  |  \ 
 \        (  <_> )  | \/ /_/ |\___ \|   Y  \
  \__/\  / \____/|__|  \____ /____  >___|  /
       \/                   \/    \/     \/ 
```

## Install & Setup
1. Clone git repo on local machine:
```bash
git clone https://github.com/melinui/wordsh.git
```

2. Go to `wordsh` directory:
```bash
cd /path/to/wordsh
```

3. Run setup script:
- First make it executable
```bash
chmod u+x setup.sh
``` 
- Run script
```bash
./setup.sh
```

4. Make the game executable as well:
```bash
chmod u+x game.sh
```

5. Now you can run and play the game:
```bash
./game.sh
```

## Use your own words for wordsh

In case you have a collection of 5-letter words you want to use, either:
- Replace link with your own in `setup.sh` (line 10) or
- Explicitly add a `words.txt` file in the `wordsh` directory (you may skip running `setup.sh`)

**Careful** though, if you are planning to add your own words file, it needs to be in
format: one-word-per-line text file called `words.txt`
- **In any other case**, you might need to change a few lines in `game.sh` and specificaly
the `shuf` command that picks a random word from the file.

## Resources

- **Credits to** [deamondevin](https://gist.github.com/daemondevin) on `Github Gist` for providing a ready to fetch [`5-letter-words.txt`](https://gist.github.com/daemondevin/df09befaf533c380743bc2c378863f0c)

- ASCII art for banner generated via this [website](https://patorjk.com/software/taag/)