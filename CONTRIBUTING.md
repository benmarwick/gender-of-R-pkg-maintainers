# Contributing Guidelines

## Pull requests

Requirements for making a pull request:

* Some knowledge of [git]()
* Some knowledge of [GitHub]()

Read more about pull requests on GitHub at [https://help.github.com/articles/using-pull-requests/](https://help.github.com/articles/using-pull-requests/). If you haven't done this before, Hadley Wickham provides a nice overview of git (<http://r-pkgs.had.co.nz/git.html>), as well as best practices for submitting pull requests (<http://r-pkgs.had.co.nz/git.html#pr-make>).

Then:

* Fork the repo to your GitHub account
* Clone the version on your account down to your machine from your account, e.g,. `git clone git@github.com:benmarwick/<package name>.git`
* Make sure to track progress upstream (i.e., on our version of the package at `benmarwick/<package name>`) by doing `git remote add upstream git@github.com:benmarwick/<package name>.git`. Each time you go to make changes on your machine, be sure to pull changes in from upstream (aka the ropensci version) by doing either `git fetch upstream` then merge later or `git pull upstream` to fetch and merge in one step
* Make your changes (we prefer if you make changes on a new branch)
* Ideally included in your contributions:
* Well documented code in roxygen docs
* If you add new functions or change functionality, add one or more tests.
* Make sure the package passes `R CMD CHECK` on your machine without errors/warnings
* Push up to your account
* Submit a pull request and participate in the discussion.

## Documentation contributions

Documentation contributions are surely much needed in every project as each could surely use better instructions. If you are editing any files in the repo, follow the above instructions for pull requests to add contributions. However, if you are editing the wiki, then you can just edit the wiki and no need to do git, pull requests, etc.


## Code

Bug reports _must_ have a [reproducible example](http://adv-r.had.co.nz/Reproducibility.html) and include the output of `devtools::session_info()` (instead of `sessionInfo()`). We recommend using Hadley Wickham's style guide when writing code (<http://adv-r.had.co.nz/Style.html>).


## Questions or comments?

Do not hesitate to open an issue in the issues tracker to raise any questions or comments about the package or these guidelines.
