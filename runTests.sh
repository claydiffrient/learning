###
# Script which will run all the tests shown here.
# TODO: Allow a single test to be run from here.
###

echo 'Running ruby tests'
cd ruby
rspec

echo 'Running elixir tests'
cd ../elixir
for elixir_project in *; do
  if [ -d ${elixir_project} ]; then
    cd $elixir_project
    mix test
    cd ..
  fi
done
