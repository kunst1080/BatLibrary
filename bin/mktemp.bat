@echo off
set tmp_dir=%tmp%\@work%date:/=%_%random%.tmp

mkdir %tmp_dir%
explorer %tmp_dir%
