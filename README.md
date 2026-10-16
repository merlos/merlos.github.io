# merlos.org

Source code of [merlos.org](http://www.merlos.org), my personal website.

In the web you can find some articles about things I am interested in as well as more info about me (ego zone xD).

# Geeky stuff

* The web is built using [jekyll](http://www.jekyllrb.com) (no database, simple update awesome!)
* It also uses the iconset provided by [fontawesome](http://fortawesome.github.io/Font-Awesome/icons/)
* To provide partial support of multilingual, I followed [this article from Sylvain Durand](http://sylvaindurand.org/making-jekyll-multilingual/)
* Redirecting webpages: http://joshualande.com/redirect-urls-jekyll-github/

# Run locally

This site uses Jekyll through the `github-pages` gem. Its locked dependencies are old, so the most reliable way to run it on a current Linux distribution is a Docker container with Ruby 2.7.

Docker must be running, and your account must be allowed to access it. On Linux, grant that access once, then start a new shell:

```bash
sudo usermod -aG docker "$USER"
newgrp docker
```

Run the development server:

```bash
./run-local.sh
```

Open <http://localhost:4000>. The browser reloads automatically when files change. Stop the server with `Ctrl+C`.

The script mounts this repository into a Ruby 2.7 container, installs the Bundler version pinned by `Gemfile.lock`, and uses the `jekyll-bundle-cache` Docker volume to retain installed gems between runs.

To generate the static site without starting a server, replace `jekyll serve --host 0.0.0.0 --livereload` with `jekyll build`. Jekyll writes the generated files to `_site/`, which is ignored by Git.

# Licenses

Contents/Articles: [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-nc-sa/4.0/).

Source code distributed under MIT License.
