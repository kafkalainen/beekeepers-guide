## Nifty Git Commands

Command | Explanation
--------|--------
`git checkout HEAD -- oops.c` | This will reset a single file from your HEAD. Nifty when you have made one change to a file that you don't want to push in a middle of a larger feature.
`git restore oops.c` | Same, but this will restore file from your local git.
`git remote rm [name]` | If you happen to work a school project, and you would like to remove the remote vogsphere address, you can do it by typing this command.
`git remote -v` | This command lists all the remotes you have. When in doubt, [git](https://git-scm.com/docs/git-remote) it out.
`git remote add origin git@github.com..` | You can add your repository's address here, and push to remote. Origin is the name of the remote location and address comes after it. Github has [excellent documentation](https://docs.github.com/en/get-started/getting-started-with-git/managing-remote-repositories) about this.
`git push --set-upstream origin main` | On your first push, it's good to say that you are pushing to the origin remote, and the name of the upstream branch is main. If you just push, you will be greeted with this command.
`git log` | list all the commits in the git history.
`git checkout d3260c0e2` | This checkouts to the earlier commit in the current branch. You will be headless mode, so you can fool around. This is where I ended up when googling it. [How do I revert a git repository to a previous commit](https://stackoverflow.com/questions/4114095/how-do-i-revert-a-git-repository-to-a-previous-commit)
`git checkout -b before-covid d3260c0e2` | Or you can create a new branch based on that earlier commit.
`git checkout HEAD` | Going back to the head means no more fooling around, time to get some work done.
