defmodule GitAge do

  # Main
  # Called from commandline
  #
  # Inputs:
  #   - args - list of arguments from the commandline
  # Outputs:
  #   - None (other than a status code to the console)
  def main(args) do
    args |> parse_args |> process
  end

  # Process
  # Essentially where all arguments get sent for handling
  #
  # Inputs:
  #   - options - Parsed arguments and options
  # Outputs:
  #   - None
  def process(options) do
    if (elem(options, 0)[:help]) do
      IO.puts "git_age git_repo_path"
    else
      [head | tail] = elem(options, 1)
      IO.inspect open_directory(head)
    end
  end


  # Open Directory
  # Opens up the directory that was given by the user.  It will recursively
  # crawl the directory structure until it can send back a full flat list of
  # files.
  #
  # Inputs:
  #   - path - the path that needs to be read
  #   - files - a list of file strings, defaults to an empty list
  # Outputs:
  #   - List of files that need to be blamed.
  def open_directory(path, files \\ []) do
    # Store the current directory
    cur_dir = File.cwd!()
    # Change to the proper directory for the path
    File.cd!(path)
    # Get all the files at that path
    response = File.ls!(path)
    List.flatten(Enum.map(response, fn(x) ->
      full_path = path <> "/" <> x
      # TODO: Figure out some way to handle git ignore stuff
      if (File.dir?(full_path) && x != ".git") do
        open_directory(full_path, files)
      else
        full_path
      end
    end))
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
