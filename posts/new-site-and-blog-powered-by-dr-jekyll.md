---
title: New Site and Blog Powered by Dr. Jekyll
date: 2010-02-03 03:21:00 +0200
categories: [technology, ruby, jekyll, git, rsync, disqus, font, design]
---

I finally found some time to rebuild my site, and add a blog. I'm also working on a portfolio, which I will probably be putting up on [heartb.it][]. I haven't really decided how I'm gonna make the split between my personal site and work portfolio yet though.

For archival reasons I've made the [previous][v1] [versions][v2] of my site available for anybody who might be curious.

On an unrelated note, it happens to be my 24th birthday today, I haven't decided yet if that's a good or a bad thing. But at least I found time to push up my new site today, so I guess that's a good start at least :)


## Powered by Dr. Jekyll?

My personal site has always been a **very** simple site. In the past it's just been a single HTML page which I've coded by hand and uploaded via SFTP. It's a simple process, and decently straight forward. This time however, I wanted to incorporate a blog as well. My first choice was [WordPress][], as I've used it on my [previous][zydev] blog. But it's overkill for what I need, and keept getting hacked all the fucking time even when I was keeping WordPress decently up to date.

So I'm using [Jekyll][] this time around. Jekyll is a small website framework written in [Ruby][] which generates static HTML files. It was created by one of [GitHub]'s founders, and is used on GitHub [Pages][]. Part of what makes it nice is that it's more intended to be a quick and elegant blogging engine, rather than just a static site generator. It let's you write blog posts in pure HTML, Markdown, or Textile. Meaning I'm writing this post in TextMate, which always puts a smile on my face.

I'll soon write a more in-depth article about Jekyll and how I'm using it.


## Comments with Disqus

Since I'm using static HTML files, I'm left with only a few — but awesome — solutions to have a commenting feature on the blog. Both [Disqus][] and [Intense Debate][idebate] have great Javascript-based commenting systems which work for static HTML sites. My favorite of the two is Disqus.


## Deployment with Rake+Rsync

I've also opted for a much easier way to deploy to the live server once I'm done with changes locally. Namely, Ruby's Make program, *Rake*.

I've written a couple of custom rake tasks which run Jekyll to build the static HTML files, and to rsync said HTML files to the remote server. So instead of using a SFTP client, or something like [Coda][] to upload and update the remote site, I simply run `rake deploy` from a terminal.

I get butterflies in my stomach whenever I think about how neat it is.


## Source Code Management with Git

After being an avid user of [Subversion][svn] for about 5 years, I switched permanently to [Git][] last August when I spent 4 hours reading a PDF I had with me on holiday. So I'm obviously using Git for this site, and the source code is [available][repo] on GitHub in all it's glory.


## Design

I really focused on minimalism, to the point I'm not using a single image, but rather only text on a white background. This is a first for me, as I generally like to have nice rounded corners, or drop shadows, or something, but still simple and elegant looking.

Since the design in highly text-focussed, good typography was a must right from the start. I wanted to stray away from the standard web-safe fonts, to create a truly unique and elegant looking site in terms of it's typography. To do this, I needed to embed fonts, and I used the [@font-face][fontface] technique for it.

The two fonts I'm using are [Colaborate][] for body text, and [DejaVu Sans Mono][dejavu] for fixed width text and code examples. I got both from [Font Squirrel][fontsquirrel]'s excellent [@font-face fontkit][ffkits] page which has hundreds of free and ready to use kits.


## The End

> {insert [yo mamma joke][yomama] here}. Have a nice day.


[heartb.it]: http://heartb.it/
[repo]: http://github.com/jimeh/jimeh.me
[v1]: http://v1.jimeh.me/
[v2]: http://v2.jimeh.me/
[wordpress]: http://www.wordpress.org/
[zydev]: http://blog.zydev.info/
[jekyll]: http://jekyllrb.com/
[ruby]: http://www.ruby-lang.org/
[github]: http://github.com/
[pages]: http://pages.github.com/
[disqus]: http://disqus.com/
[idebate]: http://intensedebate.com/
[coda]: http://www.panic.com/coda/
[svn]: http://subversion.apache.org/
[git]: http://git-scm.com/
[fontface]: http://en.wikipedia.org/wiki/Web_typography#Browser_support
[colaborate]: http://www.fontsquirrel.com/fonts/Colaborate
[dejavu]: http://www.fontsquirrel.com/fonts/DejaVu-Sans-Mono
[fontsquirrel]: http://www.fontsquirrel.com/
[ffkits]: http://www.fontsquirrel.com/fontface
[yomama]: http://en.wikipedia.org/wiki/Mother_insult
