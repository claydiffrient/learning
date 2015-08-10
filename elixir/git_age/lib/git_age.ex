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
    updated_count_hash = []
    results = System.cmd("git", ["blame", file],
      into: files
    )

    # Loops through each of the results
    Enum.each(elem(results, 0), fn(x) ->
      # Break the result into lines
      lines = String.split(x, "\n")
      updated_count_hash = handle_blame_lines(lines, 0, count_hash)
      IO.inspect updated_count_hash
    end)
    IO.inspect updated_count_hash
  end

  defp handle_blame_lines(lines, index, dict) do
    if (index == Enum.count(lines) - 1) do
      dict
    else
      line = Enum.at(lines, index)
      date = Enum.at(String.split(line), 3)
      updated_dict = Dict.update(dict, date, 0, fn (val) -> val + 1 end)
      handle_blame_lines(lines, index + 1, updated_dict)
    end
  end



  defp parse_args(args) do
    {options, inputs, _} = OptionParser.parse(args,
      switches: [help: :boolean]
    )
    {options, inputs}
  end


end
