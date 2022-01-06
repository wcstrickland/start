git diff [<options>] [commit1  commit2] -- [file/path]

git difftool [<options>] [commit1  commit2] -- [file/path]

git diff HEAD * will show changes compared to index

git diff --staged will show diff between staged and last

git config --global diff.tool vimdiff
git config --global difftool.prompt false
