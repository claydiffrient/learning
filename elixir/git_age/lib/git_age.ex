defmodule GitAge do



  def main(args) do
    args |> parse_args |> process
  end

  def process(options) do
    if (elem(options, 0)[:help]) do
      IO.puts "git_age git_repo_path"
    else
      open_directory(elem(options, 1))
    end
  end

  def open_directory(path) do
    File.cd!(path, fn(
      ) ->
      response = File.ls!(path)
      counts = HashDict.new()
      Dict.put(counts, "count", 0)
      Enum.each(response, fn(x) ->
        IO.puts "Processing #{x}"
        if (File.dir?(x)) do
          #open_directory(x)
          IO.puts "--Directory"
        else
          git_blame(x, counts);
        end
      end)
    end)
  end

  defp git_blame(file, count_hash) do
    files = []
    results = System.cmd("git", ["blame", file],
      into: files
    )
    handle_results(results, 0, count_hash)
    # Loops through each of the results
    Enum.each(elem(results, 0), fn(x) ->
      # Loops through each of the lines of the result
      Enum.each(String.split(x, "\n"), fn(line) ->
        # Pulls the date from the line.
        date = Enum.at(String.split(line), 3)
        Dict.update(count_hash, date, 0, fn (val) -> val + 1 end)
      end)


      # IO.puts(x |> Timex.DateFormat.parse("{ISO}"))
    end)
    IO.inspect count_hash
  end

  defp handle_results(results, index, dict) do
    if (index == Enum.count(results) - 1) do
      dict
    end
    Enum.at(results, index)
  end



  defp parse_args(args) do
    {options, inputs, _} = OptionParser.parse(args,
      switches: [help: :boolean]
    )
    {options, inputs}
  end


end
