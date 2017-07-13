# DEOS

I was looking into how to code in Java with Emacs better and I ran across
[Dakrone's](https://github.com/dakrone/eos) config and was blown away. This is
my imitation of it. He calls his config EOS for Emacs Operation System, but I'm
conceded so I call mine DEOS for Daniel's Emacs Operating System.

Clone this project into you home folder and run =make clean= and =make= and
=make install= and it should take care of everything for you. Oh and be sure to
backup your Emacs config because this will blow it away for good.

This project depends on all of the config to be in the deos directory in your
home directory. It creates symlinks to your .emacs.d directory and all you have
to do if you update the config is run make again to tangle to org files.

See [deos](deos.org) for more information.
