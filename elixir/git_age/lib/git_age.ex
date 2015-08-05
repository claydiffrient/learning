defmodule GitAge do



  def main(args) do
    args |> parse_args |> process
  end

  def process(options) do
    if (elem(options, 0)[:help]) do
      IO.puts "git_age git_repo_path sha_to_check"
    else
      IO.puts "Not implemented yet"
    end
  end


  defp parse_args(args) do
    {options, inputs, _} = OptionParser.parse(args,
      switches: [help: :boolean]
    )
    {options, inputs}
  end


end
