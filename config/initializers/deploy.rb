# after :deploy do
#   target = File.join(%W[#{release_path} public assets])
#   run "cp -r `cd #{release_path} && bundle show jquery-minicolors-rails`/vendor/assets/images/jquery.minicolors.png #{target}"
# end