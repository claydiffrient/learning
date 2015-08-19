defmodule GitAgeTest do
  use ExUnit.Case

  test "reads in files in the fixtures directory" do
    fixtures_dir = File.cwd!() <> "/test/fixtures"
    expected_files = [
      fixtures_dir <> "/firstLevelFile.txt",
      fixtures_dir <> "/firstLevelFolder/secondLevelFile.txt",
      fixtures_dir <> "/firstLevelFolder/secondLevelFolder/thirdLevelFile.txt"
    ]
    actual_files = GitAge.open_directory(fixtures_dir)
    assert actual_files == expected_files
  end
end
