# Ruby Gem Project Skeleton

[![RubyGems.org](https://img.shields.io/gem/v/makenew-rbgem)](https://rubygems.org/gems/makenew-rbgem)
[![GitHub Actions](https://github.com/makenew/rbgem/actions/workflows/check.yml/badge.svg)](https://github.com/makenew/rbgem/actions/workflows/check.yml)

Project skeleton for a Ruby gem.

## Description

Bootstrap a new Ruby gem in five minutes or less.

### Features

- [Ruby]'s [gem][rubygems.org] package structure.
- Consistent dependency management with [Bundler].
- Release your Ruby gems with ease using [gem release].
- [Standard] Ruby style guide, linter, and formatter.
- Productive and fun testing with [RSpec].
- Code coverage reporting with [SimpleCov].
- Fully automated version management and package publishing with [semantic-release].
- Continuous checks and tests with [GitHub Actions].
- [Keep a CHANGELOG].
- Consistent coding with [EditorConfig].
- Badges from [Shields.io].
- Start coding instantly with [GitHub Codespaces].

[bundler]: https://bundler.io/
[editorconfig]: https://editorconfig.org/
[gem release]: https://github.com/svenfuchs/gem-release
[github actions]: https://github.com/features/actions
[github codespaces]: https://github.com/features/codespaces
[keep a changelog]: https://keepachangelog.com/
[rspec]: https://rspec.info/
[ruby]: https://www.ruby-lang.org/
[rubygems.org]: https://rubygems.org/
[semantic-release]: https://semantic-release.gitbook.io/semantic-release/
[shields.io]: https://shields.io/
[simplecov]: https://github.com/simplecov-ruby/simplecov
[standard]: https://github.com/testdouble/standard

### Bootstrapping a new project

1. Create an empty (**non-initialized**) repository on GitHub.
2. Clone the main branch of this repository with
   ```
   $ git clone --single-branch git@github.com:makenew/rbgem.git <new-ruby-gem>
   $ cd <new-ruby-gem>
   ```
   Optionally, reset to the latest version with
   ```
   $ git reset --hard <version-tag>
   ```
3. Run
   ```
   $ ./makenew.sh
   ```
   This will replace the boilerplate, delete itself,
   remove the git remote, remove upstream tags,
   and stage changes for commit.
4. Create the required GitHub repository secrets.
5. Review, commit, and push the changes to GitHub with
   ```
   $ git diff --cached
   $ git commit -m "Replace makenew boilerplate"
   $ git remote add origin git@github.com:<user>/<new-ruby-gem>.git
   $ git push -u origin main
   ```
6. Ensure the GitHub action passes,
   then publish the initial version of the gem with
   ```
   $ bundle install
   $ bundle exec gem bump --sign --push --version patch
   $ bundle exec gem tag --sign --push
   ```

### Updating from this skeleton

If you want to pull in future updates from this skeleton,
you can fetch and merge in changes from this repository.

Add this as a new remote with

```
$ git remote add upstream git@github.com:makenew/rbgem.git
```

You can then fetch and merge changes with

```
$ git fetch --no-tags upstream
$ git merge upstream/main
```

#### Changelog for this skeleton

Note that `CHANGELOG.md` is just a template for this skeleton.
The actual changes for this project are documented in the commit history
and summarized under [Releases].

[releases]: https://github.com/makenew/rbgem/releases

## Installation

Add this as a dependency to your project using [Bundler] with

```
$ bundle add makenew-rbgem
```

[bundler]: https://bundler.io/

## Development and Testing

### Quickstart

```
$ git clone https://github.com/makenew/rbgem.git
$ cd rbgem
$ bundle install
```

Run the command below

```
$ bundle exec rake
```

Open an interactive ruby console with

```
$ bundle exec rake
```

Primary development tasks are defined as [rake] tasks in the `Rakefile`
and available via `rake`.
View them with

```
$ bundle exec rake -T
```

[rake]: https://ruby.github.io/rake/

### Source code

The [source code] is hosted on GitHub.
Clone the project with

```
$ git clone git@github.com:makenew/rbgem.git
```

[source code]: https://github.com/makenew/rbgem

### Requirements

You will need [Ruby] with [Bundler].

Be sure that all commands run under the correct Ruby version, e.g.,
if using [rbenv], install the correct version with

```
$ rbenv install
```

Install the development dependencies with

```
$ bundle install
```

[bundler]: https://bundler.io/
[ruby]: https://www.ruby-lang.org/
[rbenv]: https://github.com/rbenv/rbenv

### Publishing

New versions are created with [gem release].

#### Automatic

New versions are released automatically with [semantic-release]
as long as commits follow the [Angular Commit Message Conventions].

[Angular Commit Message Conventions]: https://semantic-release.gitbook.io/semantic-release/#commit-message-format
[semantic-release]: https://semantic-release.gitbook.io/

#### Manual

Publish a new version by triggering a [version workflow_dispatch on GitHub Actions].
The `version` input will be passed to the `--version` option of `gem bump`.

This may be done on the web or using the [GitHub CLI] with

```
$ gh workflow run version.yml --raw-field version=<version>
```

[gem release]: https://github.com/svenfuchs/gem-release
[GitHub CLI]: https://cli.github.com/
[version workflow_dispatch on GitHub Actions]: https://github.com/seamapi/javascript-http/actions?query=workflow%3Aversion

## GitHub Actions

_GitHub Actions should already be configured: this section is for reference only._

The following repository secrets must be set on [GitHub Actions]:

- `RUBYGEMS_API_KEY`: RubyGems.org token for publishing gems.

These must be set manually.

### Secrets for Optional GitHub Actions

The version, format, generate, and semantic-release GitHub actions
require a user with write access to the repository.
Set these additional secrets to enable the action:

- `GH_TOKEN`: A personal access token for the user.
- `GIT_USER_NAME`: The GitHub user's real name.
- `GIT_USER_EMAIL`: The GitHub user's email.
- `GPG_PRIVATE_KEY`: The GitHub user's [GPG private key].
- `GPG_PASSPHRASE`: The GitHub user's GPG passphrase.

[github actions]: https://github.com/features/actions
[gpg private key]: https://github.com/marketplace/actions/import-gpg#prerequisites

## Contributing

Please submit and comment on bug reports and feature requests.

To submit a patch:

1. Fork it (https://github.com/makenew/rbgem/fork).
2. Create your feature branch (`git checkout -b my-new-feature`).
3. Make changes.
4. Commit your changes (`git commit -am 'Add some feature'`).
5. Push to the branch (`git push origin my-new-feature`).
6. Create a new Pull Request.

## License

This Ruby gem is licensed under the MIT license.

## Warranty

This software is provided by the copyright holders and contributors "as is" and
any express or implied warranties, including, but not limited to, the implied
warranties of merchantability and fitness for a particular purpose are
disclaimed. In no event shall the copyright holder or contributors be liable for
any direct, indirect, incidental, special, exemplary, or consequential damages
(including, but not limited to, procurement of substitute goods or services;
loss of use, data, or profits; or business interruption) however caused and on
any theory of liability, whether in contract, strict liability, or tort
(including negligence or otherwise) arising in any way out of the use of this
software, even if advised of the possibility of such damage.
